/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.Membresia;

import Util.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class GestionMembresia {

    public Membresia consultarMembresiaSocio(int idSocio) throws SQLException {

        Membresia oMembresia = new Membresia();

        Connection conn = Conexion.getConexion();

        String socio = "select m.* from membresia m join socio s On s.id_socio = m.id_socio where m.id_socio = ?;";

        try (PreparedStatement ps = conn.prepareStatement(socio)) {

            ps.setInt(1, idSocio);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    oMembresia.setId_socio(rs.getInt("id_socio"));
                    oMembresia.setId_plan(rs.getInt("id_plan"));
                    oMembresia.setFecha_inicio(LocalDate.parse(rs.getString("fecha_inicio")));
                    oMembresia.setFecha_fin(LocalDate.parse(rs.getString("fecha_fin")));
                    oMembresia.setValor_pagado(rs.getDouble("valor_pagado"));

                }
            }
        }
        return oMembresia;

    }

    public Membresia consultarMembresiaVigente(int idSocio) throws SQLException {
        String sql = "SELECT * FROM membresia WHERE id_socio = ? AND fecha_fin >= CURDATE() ORDER BY fecha_fin DESC LIMIT 1";
        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idSocio);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Membresia m = new Membresia();
                    m.setId_membresia(rs.getInt("id_membresia"));
                    m.setId_socio(rs.getInt("id_socio"));
                    m.setId_plan(rs.getInt("id_plan"));
                    m.setFecha_inicio(rs.getObject("fecha_inicio", LocalDate.class));
                    m.setFecha_fin(rs.getObject("fecha_fin", LocalDate.class));
                    m.setValor_pagado(rs.getDouble("valor_pagado"));
                    return m;
                }
            }
        }
        return null;
    }

    public List<Membresia> getHistorialMembresias(int idSocio) throws SQLException {
        List<Membresia> historial = new ArrayList<>();

        String sql = "SELECT m.*, p.nombre as nombre_plan "
                + "FROM membresia m "
                + "JOIN plan p ON m.id_plan = p.id_plan "
                + "WHERE m.id_socio = ? "
                + "ORDER BY m.fecha_fin DESC";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idSocio);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Membresia m = new Membresia();
                    m.setId_membresia(rs.getInt("id_membresia"));
                    m.setId_socio(rs.getInt("id_socio"));
                    m.setId_plan(rs.getInt("id_plan"));
                    m.setFecha_inicio(rs.getObject("fecha_inicio", LocalDate.class));
                    m.setFecha_fin(rs.getObject("fecha_fin", LocalDate.class));
                    m.setValor_pagado(rs.getDouble("valor_pagado"));
                    m.setNombrePlan(rs.getString("nombre_plan"));

                    LocalDate hoy = LocalDate.now();
                    long diasRestantes = ChronoUnit.DAYS.between(hoy, m.getFecha_fin());
                    m.setDiasRestantes(diasRestantes);

                    if (diasRestantes > 5) {
                        m.setEstado("VIGENTE");
                    } else if (diasRestantes >= 0) {
                        m.setEstado("POR_VENCER");
                    } else {
                        m.setEstado("VENCIDA");
                    }

                    historial.add(m);
                }
            }
        }
        return historial;
    }

    public void registrarMembresia(Membresia oMembresia) throws Exception {

        String sql = "INSERT INTO membresia "
                + "(id_socio,id_plan,fecha_inicio,fecha_fin,valor_pagado) "
                + "VALUES (?,?,?,?,?)";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, oMembresia.getId_socio());
            ps.setInt(2, oMembresia.getId_plan());

            ps.setDate(3, Date.valueOf(oMembresia.getFecha_inicio()));
            ps.setDate(4, Date.valueOf(oMembresia.getFecha_fin()));

            ps.setDouble(5, oMembresia.getValor_pagado());

            int numero = ps.executeUpdate();

            System.out.println("Membresías registradas: " + numero);

        }

    }

    public List<Membresia> listarMembresias() throws Exception {

        Connection conn = Conexion.getConexion();

        List<Membresia> lista = new ArrayList<>();

        String sql = "SELECT m.*,\n"
                + "CONCAT(s.nombres,' ',s.apellidos) AS nombreSocio,\n"
                + "p.nombre AS nombrePlan\n"
                + "FROM membresia m\n"
                + "INNER JOIN socio s ON m.id_socio=s.id_socio\n"
                + "INNER JOIN plan p ON m.id_plan=p.id_plan";

        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {

                Membresia oMembresia = new Membresia();

                oMembresia.setId_membresia(rs.getInt("id_membresia"));
                oMembresia.setId_socio(rs.getInt("id_socio"));
                oMembresia.setId_plan(rs.getInt("id_plan"));
                oMembresia.setNombreSocio(rs.getString("nombreSocio"));
                oMembresia.setNombrePlan(rs.getString("nombrePlan"));

                oMembresia.setFecha_inicio(
                        rs.getDate("fecha_inicio").toLocalDate());

                oMembresia.setFecha_fin(
                        rs.getDate("fecha_fin").toLocalDate());

                oMembresia.setValor_pagado(
                        rs.getDouble("valor_pagado"));

                lista.add(oMembresia);

            }

        }

        return lista;

    }

    public Membresia membresiaId(String id) throws Exception {

        Membresia oMembresia = null;

        Connection conn = Conexion.getConexion();

        String sql = "SELECT * FROM membresia WHERE id_membresia = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    oMembresia = new Membresia();

                    oMembresia.setId_membresia(rs.getInt("id_membresia"));
                    oMembresia.setId_socio(rs.getInt("id_socio"));
                    oMembresia.setId_plan(rs.getInt("id_plan"));

                    oMembresia.setFecha_inicio(
                            rs.getDate("fecha_inicio").toLocalDate());

                    oMembresia.setFecha_fin(
                            rs.getDate("fecha_fin").toLocalDate());

                    oMembresia.setValor_pagado(
                            rs.getDouble("valor_pagado"));

                }

            }

        }

        return oMembresia;
    }

    public boolean tieneMembresiaVigente(int idSocio) throws Exception {

        String sql = "SELECT COUNT(*) FROM membresia "
                + "WHERE id_socio = ? "
                + "AND fecha_fin >= CURDATE()";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idSocio);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }

        return false;
    }

    public List<Membresia> listarPorVencer() throws Exception {

        Connection conn = Conexion.getConexion();

        List<Membresia> lista = new ArrayList<>();

        String sql = "SELECT m.*, "
                + "CONCAT(s.nombres,' ',s.apellidos) AS nombreSocio, "
                + "p.nombre AS nombrePlan "
                + "FROM membresia m "
                + "INNER JOIN socio s ON m.id_socio=s.id_socio "
                + "INNER JOIN plan p ON m.id_plan=p.id_plan "
                + "WHERE fecha_fin BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 5 DAY)";

        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {

                Membresia m = new Membresia();

                m.setId_membresia(rs.getInt("id_membresia"));
                m.setId_socio(rs.getInt("id_socio"));
                m.setId_plan(rs.getInt("id_plan"));
                m.setNombreSocio(rs.getString("nombreSocio"));
                m.setNombrePlan(rs.getString("nombrePlan"));

                m.setFecha_inicio(rs.getDate("fecha_inicio").toLocalDate());
                m.setFecha_fin(rs.getDate("fecha_fin").toLocalDate());

                m.setValor_pagado(rs.getDouble("valor_pagado"));

                lista.add(m);
            }

        }

        return lista;
    }

}
