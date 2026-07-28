/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servicios;

import DAO.GestionPlan;
import Modelo.Plan;
import java.util.List;

/**
 *
 * @author halfo
 */
public class PlanService {
    private GestionPlan oPlanDAO = new GestionPlan();

    public void crearPlan(Plan oPlan) throws Exception {
        if (oPlan.getNombre() == null || oPlan.getNombre().trim().isEmpty()) {
            throw new Exception("El nombre del plan es obligatorio");
        }
        if (oPlan.getDuracion_dias() <= 0) {
            throw new Exception("La duracion de dias debe ser mayor a 0");
        }
        if (oPlan.getValor() <= 0) {
            throw new Exception("El valor debe ser mayor a 0");
        }
        System.out.println("Plan creado correctamente");

        oPlanDAO.crearPlanD(oPlan);
    }

    public List<Plan> listarPlanes() throws Exception {
        return oPlanDAO.listarP();
    }

    public Plan PlanId(String idPlan) throws Exception {
        return oPlanDAO.PlanId(idPlan);
    }

    public void editarPlan(Plan oPlan, int idPlan) throws Exception {
        oPlanDAO.editarPlan(oPlan, idPlan);
    }

    public void eliminarPlan(String idPlan) throws Exception {
        oPlanDAO.eliminarPlan(idPlan);
    }

    public List<Plan> buscarPlan(String busqueda) throws Exception {
        return oPlanDAO.buscarPlan(busqueda);
    }
}
