/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.Ingreso;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author halfo
 */
public class GestionIngreso {

    public void registrarIngreso(int id_socio) throws SQLException {

        String insert = "insert into ingreso (id_socio,fecha_ingreso,hora_ingreso) values (?,?,?)";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(insert)) {

            ps.setInt(1, id_socio);
            ps.setObject(2, LocalDate.now());
            ps.setObject(3, LocalTime.now());

            int numero = ps.executeUpdate();
            System.out.println("Insert en el ingreso: " + numero);
        }

    }

    public void actualizarIngreso(int id_socio) throws SQLException {

        String insert = "UPDATE ingreso SET fecha_ingreso = ?, hora_ingreso = ? WHERE id_socio = ?;";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(insert)) {

            ps.setObject(1, LocalDate.now());
            ps.setObject(2, LocalTime.now());
            ps.setInt(3, id_socio);

            int numero = ps.executeUpdate();
            System.out.println("Insert en el ingreso: " + numero);
        }
    }

    public boolean consultarIngreso(int idSocio) throws SQLException {
        String query = "select * from ingreso where id_socio = ?;";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, idSocio);

            try (ResultSet rs = ps.executeQuery()) {

                boolean existeRegistro = rs.next();

                return existeRegistro;
            }
        }
    }

    public boolean ultimoIngreso(int idSocio) throws SQLException {

        String query = "select * from ingreso where id_socio = ? and fecha_ingreso = ?;";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, idSocio);
            ps.setObject(2, LocalDate.now());

            try (ResultSet rs = ps.executeQuery()) {

                boolean existeRegistro = rs.next();

                return existeRegistro;
            }
        }

    }

    public List<Ingreso> buscarIngresos(LocalDate fechaBusqueda) throws SQLException {

        List<Ingreso> listIngreso = new ArrayList<>();

        String query = "select * from ingreso where fecha_ingreso = ?;";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setObject(1, fechaBusqueda);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Ingreso oIngreso = new Ingreso();

                    oIngreso.setFecha_ingreso(LocalDate.parse(rs.getString("fecha_ingreso")));
                    oIngreso.setHora_ingreso(LocalTime.parse(rs.getString("hora_ingreso")));
                    oIngreso.setId_socio(rs.getInt("id_socio"));

                    listIngreso.add(oIngreso);

                }
            }
        }
        return listIngreso;

    }

    public boolean consultarIngresoHoy(int idSocio) throws SQLException {
        String query = "SELECT 1 FROM ingreso WHERE id_socio = ? AND fecha_ingreso = CURDATE()";
        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, idSocio);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

}
