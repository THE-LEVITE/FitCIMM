/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servicios;

import DAO.GestionMembresia;
import DAO.GestionPlan;
import Modelo.Membresia;
import Modelo.Plan;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class MembresiaService {

    private GestionMembresia oMembresia = new GestionMembresia();

    public Membresia consultarMembresiaSocio(int idSocio) throws SQLException {
        return oMembresia.consultarMembresiaSocio(idSocio);
    }

    public long calcularDiasRestantes(LocalDate fechaFin) {
        return ChronoUnit.DAYS.between(LocalDate.now(), fechaFin);
    }

    private GestionMembresia oMembresiaDAO = new GestionMembresia();
    private GestionPlan oPlanDAO = new GestionPlan();

    public void venderMembresia(Membresia oMembresia) throws Exception {

        Plan oPlan = oPlanDAO.PlanId(String.valueOf(oMembresia.getId_plan()));

        if (oPlan == null) {
            throw new Exception("El plan no existe");
        }

        LocalDate fechaInicio = oMembresia.getFecha_inicio();

        LocalDate fechaFin = fechaInicio.plusDays(oPlan.getDuracion_dias());

        oMembresia.setFecha_fin(fechaFin);

        oMembresia.setValor_pagado(oPlan.getValor());

        if (oMembresiaDAO.tieneMembresiaVigente(oMembresia.getId_socio())) {
            throw new Exception("El socio ya tiene una membresía vigente.");
        }

        oMembresiaDAO.registrarMembresia(oMembresia);
    }

    public List<Membresia> listarMembresias() throws Exception {

        List<Membresia> lista = oMembresiaDAO.listarMembresias();

        LocalDate hoy = LocalDate.now();

        for (Membresia m : lista) {

            if (m.getFecha_fin().isBefore(hoy)) {

                m.setEstado("VENCIDA");

            } else if (!m.getFecha_fin().isAfter(hoy.plusDays(7))) {

                m.setEstado("POR VENCER");

            } else {

                m.setEstado("VIGENTE");

            }

        }

        return lista;
    }

    public void renovarMembresia(int idSocio, int idPlan) throws Exception {

        Membresia nueva = new Membresia();

        nueva.setId_socio(idSocio);
        nueva.setId_plan(idPlan);
        nueva.setFecha_inicio(LocalDate.now());

        venderMembresia(nueva);

    }

    public Membresia membresiaId(int id) throws Exception {
        return oMembresiaDAO.membresiaId(String.valueOf(id));
    }

    public List<Membresia> listarPorVencer() throws Exception {

        List<Membresia> lista = oMembresiaDAO.listarPorVencer();

        for (Membresia m : lista) {
            m.setEstado("POR VENCER");
        }

        return lista;
    }

}
