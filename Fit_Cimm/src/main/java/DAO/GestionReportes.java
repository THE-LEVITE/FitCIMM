package DAO;

import Modelo.ReporteRecaudo;
import Modelo.Socio;
import Modelo.Membresia;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class GestionReportes {

    public List<Socio> listarSociosActivosConMembresia() throws SQLException {
        List<Socio> listaSocios = new ArrayList<>();

        String sql = "SELECT "
                + "s.id_socio, s.documento, s.nombres, s.apellidos, s.telefono, s.correo, s.fecha_nacimiento, s.activo, "
                + "m.id_membresia, m.id_plan, m.fecha_inicio, m.fecha_fin, m.valor_pagado, "
                + "p.nombre as nombre_plan "
                + "FROM socio s "
                + "JOIN membresia m ON s.id_socio = m.id_socio "
                + "JOIN plan p ON m.id_plan = p.id_plan "
                + "WHERE s.activo = true AND m.fecha_fin >= CURDATE() "
                + "ORDER BY m.fecha_fin ASC";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Socio socio = new Socio();
                socio.setId_socio(rs.getInt("id_socio"));
                socio.setDocumento(rs.getString("documento"));
                socio.setNombres(rs.getString("nombres"));
                socio.setApellidos(rs.getString("apellidos"));
                socio.setTelefono(rs.getString("telefono"));
                socio.setCorreo(rs.getString("correo"));
                socio.setFecha_nacimiento(rs.getObject("fecha_nacimiento", LocalDate.class));
                socio.setActivo(rs.getBoolean("activo"));

                Membresia membresia = new Membresia();
                membresia.setId_membresia(rs.getInt("id_membresia"));
                membresia.setId_socio(rs.getInt("id_socio"));
                membresia.setId_plan(rs.getInt("id_plan"));
                membresia.setFecha_inicio(rs.getObject("fecha_inicio", LocalDate.class));
                membresia.setFecha_fin(rs.getObject("fecha_fin", LocalDate.class));
                membresia.setValor_pagado(rs.getDouble("valor_pagado"));
                membresia.setNombrePlan(rs.getString("nombre_plan"));

                LocalDate hoy = LocalDate.now();
                long diasRestantes = ChronoUnit.DAYS.between(hoy, membresia.getFecha_fin());
                membresia.setDiasRestantes(diasRestantes);

                if (diasRestantes > 5) {
                    membresia.setEstado("VIGENTE");
                } else if (diasRestantes >= 0) {
                    membresia.setEstado("POR_VENCER");
                } else {
                    membresia.setEstado("VENCIDA");
                }

                socio.setMembresiaActual(membresia);
                listaSocios.add(socio);
            }
        }
        return listaSocios;
    }

    public List<ReporteRecaudo> getTotalRecaudadoPorPlan(LocalDate fechaInicio, LocalDate fechaFin) throws SQLException {
        List<ReporteRecaudo> lista = new ArrayList<>();

        String sql = "SELECT p.id_plan, p.nombre, COUNT(m.id_membresia) as cantidad, SUM(m.valor_pagado) as total "
                + "FROM membresia m "
                + "JOIN plan p ON m.id_plan = p.id_plan "
                + "WHERE m.fecha_inicio BETWEEN ? AND ? "
                + "GROUP BY p.id_plan, p.nombre "
                + "ORDER BY total DESC";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setObject(1, fechaInicio);
            ps.setObject(2, fechaFin);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ReporteRecaudo reporte = new ReporteRecaudo();
                    reporte.setIdPlan(rs.getInt("id_plan"));
                    reporte.setNombrePlan(rs.getString("nombre"));
                    reporte.setCantidad(rs.getInt("cantidad"));
                    reporte.setTotalRecaudado(rs.getDouble("total"));
                    lista.add(reporte);
                }
            }
        }
        return lista;
    }

    public ReporteRecaudo getPlanMasVendidoDelMes() throws SQLException {
        String sql = "SELECT p.id_plan, p.nombre, COUNT(m.id_membresia) as cantidad, SUM(m.valor_pagado) as total "
                + "FROM membresia m "
                + "JOIN plan p ON m.id_plan = p.id_plan "
                + "WHERE YEAR(m.fecha_inicio) = YEAR(CURDATE()) AND MONTH(m.fecha_inicio) = MONTH(CURDATE()) "
                + "GROUP BY p.id_plan, p.nombre "
                + "ORDER BY cantidad DESC LIMIT 1";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                ReporteRecaudo reporte = new ReporteRecaudo();
                reporte.setIdPlan(rs.getInt("id_plan"));
                reporte.setNombrePlan(rs.getString("nombre"));
                reporte.setCantidad(rs.getInt("cantidad"));
                reporte.setTotalRecaudado(rs.getDouble("total"));
                return reporte;
            }
        }
        return null;
    }
}
