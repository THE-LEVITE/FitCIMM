/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.Plan;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author halfo
 */
public class GestionPlan {

    public void crearPlanD(Plan oPlan) throws SQLException {
        String crear = "insert into Plan (nombre, duracion_dias, valor) values (?,?,?)";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(crear)) {

            ps.setString(1, oPlan.getNombre());
            ps.setObject(2, oPlan.getDuracion_dias());
            ps.setObject(3, oPlan.getValor());

            int numero = ps.executeUpdate();
            System.err.println(numero);
        }
    }

    public List<Plan> listarP() throws SQLException {

        Connection conn = Conexion.getConexion();

        List<Plan> planList = new ArrayList<>();

        String listar = "select * from Plan where activo = true";

        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(listar)) {

            while (rs.next()) {
                Plan oPlan = new Plan();
                oPlan.setId_Plan(rs.getInt("id_plan"));
                oPlan.setNombre(rs.getString("nombre"));
                oPlan.setDuracion_dias(rs.getInt("duracion_dias"));
                oPlan.setValor(rs.getInt("valor"));

                planList.add(oPlan);
            }
        }
        return planList;
    }

    public Plan PlanId(String idPlan) throws Exception {
        Plan oPlan = new Plan();

        Connection conn = Conexion.getConexion();

        String plan = "select * from plan where id_plan = ?";

        try (PreparedStatement ps = conn.prepareStatement(plan)) {

            ps.setString(1, idPlan);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    oPlan = new Plan();

                    oPlan.setId_Plan(rs.getInt("id_plan"));
                    oPlan.setNombre(rs.getString("nombre"));
                    oPlan.setDuracion_dias(rs.getInt("duracion_dias"));
                    oPlan.setValor(rs.getInt("valor"));
                }
            }
        }
        return oPlan;
    }

    public void editarPlan(Plan oPlan, int idPlan) throws SQLException {

        String insertar = "UPDATE plan set nombre = ?, duracion_dias = ? , valor = ? where id_Plan = ?";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(insertar)) {

            ps.setString(1, oPlan.getNombre());
            ps.setObject(2, oPlan.getDuracion_dias());
            ps.setObject(3, oPlan.getValor());
            ps.setObject(4, idPlan);

            int numero = ps.executeUpdate();
            System.out.println(numero);
        }
    }

    public void eliminarPlan(String idPlan) throws Exception {

        String delete = "Update plan set activo = false where id_plan = ?";

        try (Connection conn = Conexion.getConexion(); PreparedStatement ps = conn.prepareStatement(delete)) {

            ps.setString(1, idPlan);

            int numero = ps.executeUpdate();
            System.out.println(numero);
        }
    }

    public List<Plan> buscarPlan(String busqueda) throws Exception {

        Connection conn = Conexion.getConexion();

        List<Plan> planList = new ArrayList<>();

        if (busqueda == null || busqueda.trim().isEmpty()) {
            return planList;
        }

        String lista = "select * from plan where nombre LIKE ?";

        try (PreparedStatement ps = conn.prepareStatement(lista)) {

            ps.setString(1, "%" + busqueda + "%");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Plan plan = new Plan();
                    plan.setId_Plan(rs.getInt("id_Plan"));
                    plan.setNombre(rs.getString("nombre"));
                    plan.setDuracion_dias(rs.getInt("duracion_dias"));
                    plan.setValor(rs.getDouble("valor"));

                    planList.add(plan);
                }
            }
        }
        return planList;
    }
}
