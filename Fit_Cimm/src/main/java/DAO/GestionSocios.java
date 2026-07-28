/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.Membresia;
import Util.Conexion;
import Modelo.Socio;
import com.mysql.cj.xdevapi.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class GestionSocios {

    public void insertarSocio(Socio oSocio) throws SQLException {
        String insert = "insert into socio (nombres, apellidos, documento, fecha_nacimiento,telefono, correo) values (?,?,?,?,?,?)";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(insert)) {

            ps.setString(1, oSocio.getNombres());
            ps.setString(2, oSocio.getApellidos());
            ps.setString(3, oSocio.getDocumento());
            ps.setObject(4, oSocio.getFecha_nacimiento());
            ps.setObject(5, oSocio.getTelefono());
            ps.setObject(6, oSocio.getCorreo());

            int numero = ps.executeUpdate();
            System.out.println(numero);
        }

    }

    public boolean documentoExiste(String documento) throws SQLException {
        String buscar = "Select 1 from socio where documento = ?";
        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(buscar)) {

            ps.setString(1, documento);

            ResultSet rs = ps.executeQuery();

            boolean numero = rs.next();

            return numero;
        }
    }

    public List<Socio> listarSociosConMembresia() throws SQLException {
        List<Socio> listaSocios = new ArrayList<>();

        String sql = "SELECT "
                + "s.id_socio, s.documento, s.nombres, s.apellidos, s.telefono, s.correo, s.fecha_nacimiento, s.activo, "
                + "m.id_membresia, m.id_plan, m.fecha_inicio, m.fecha_fin, m.valor_pagado, "
                + "p.nombre as nombre_plan "
                + "FROM socio s "
                + "LEFT JOIN membresia m ON s.id_socio = m.id_socio "
                + "LEFT JOIN plan p ON m.id_plan = p.id_plan "
                + "WHERE s.activo = true "
                + "ORDER BY s.apellidos, s.nombres";

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

                if (rs.getObject("id_membresia") != null) {
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
                }

                listaSocios.add(socio);
            }
        }
        return listaSocios;
    }

    public Socio socioId(String idSocio) throws SQLException {
        Socio oSocio = new Socio();

        Connection conn = Conexion.getConexion();

        String socio = "Select * from socio where id_socio = ?";

        try (PreparedStatement ps = conn.prepareStatement(socio)) {

            ps.setString(1, idSocio);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    oSocio = new Socio();

                    oSocio.setId_socio(rs.getInt("id_socio"));
                    oSocio.setNombres(rs.getString("nombres"));
                    oSocio.setApellidos(rs.getString("apellidos"));
                    oSocio.setDocumento(rs.getString("documento"));
                    oSocio.setTelefono(rs.getString("telefono"));
                    oSocio.setCorreo(rs.getString("correo"));
                    oSocio.setFecha_nacimiento(rs.getObject("fecha_nacimiento", LocalDate.class));
                    oSocio.setActivo(rs.getBoolean("activo"));
                }
            }
        }
        return oSocio;
    }

    public void editarSocio(Socio oSocio, int idSo) throws SQLException {

        String insert = "UPDATE socio set nombres = ? ,apellidos= ? ,documento= ? ,telefono = ? ,correo= ? ,fecha_nacimiento= ?  where id_socio = ?";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(insert)) {

            ps.setString(1, oSocio.getNombres());
            ps.setString(2, oSocio.getApellidos());
            ps.setString(3, oSocio.getDocumento());
            ps.setObject(4, oSocio.getTelefono());
            ps.setObject(5, oSocio.getCorreo());
            ps.setObject(6, oSocio.getFecha_nacimiento());
            ps.setObject(7, idSo);

            int numero = ps.executeUpdate();
            System.out.println(numero);
        }

    }

    public void eliminarSocio(String idSocio) throws SQLException {

        String delete = "update socio set activo = false where id_socio = ?";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(delete)) {

            ps.setString(1, idSocio);

            int numero = ps.executeUpdate();
            System.out.println(numero);
        }

    }

    public List<Socio> bucarSocio(String busqueda) throws SQLException {

        Connection conn = Conexion.getConexion();

        List<Socio> socioList = new ArrayList<>();

        String lista = "select * from socio where documento = ? or apellidos = ?";

        try (PreparedStatement ps = conn.prepareStatement(lista)) {

            ps.setString(1, busqueda);
            ps.setString(2, busqueda);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Socio oSocio = new Socio();
                    oSocio.setId_socio(rs.getInt("id_socio"));
                    oSocio.setNombres(rs.getString("nombres"));
                    oSocio.setApellidos(rs.getString("apellidos"));
                    oSocio.setDocumento(rs.getString("documento"));
                    oSocio.setTelefono(rs.getString("telefono"));
                    oSocio.setCorreo(rs.getString("correo"));
                    oSocio.setFecha_nacimiento(rs.getObject("fecha_nacimiento", LocalDate.class));
                    oSocio.setActivo(rs.getBoolean("activo"));

                    socioList.add(oSocio);
                }
            }
        }

        return socioList;

    }

    public List<Socio> listarSocios() throws SQLException {

        Connection conn = Conexion.getConexion();

        List<Socio> socioList = new ArrayList<>();

        String lista = "Select id_socio, nombres, apellidos,documento, telefono, correo, fecha_nacimiento, activo from socio where activo = true";

        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(lista)) {

            while (rs.next()) {
                Socio oSocio = new Socio();
                oSocio.setId_socio(rs.getInt("id_socio"));
                oSocio.setNombres(rs.getString("nombres"));
                oSocio.setApellidos(rs.getString("apellidos"));
                oSocio.setDocumento(rs.getString("documento"));
                oSocio.setTelefono(rs.getString("telefono"));
                oSocio.setCorreo(rs.getString("correo"));
                oSocio.setFecha_nacimiento(rs.getObject("fecha_nacimiento", LocalDate.class));
                oSocio.setActivo(rs.getBoolean("activo"));

                socioList.add(oSocio);
            }
        }
        return socioList;
    }

}
