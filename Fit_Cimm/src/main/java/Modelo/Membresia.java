/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;
import java.util.logging.Logger;

/**
 *
 * @author PC_21
 */
public class Membresia {

    private int id_membresia;
    private int id_socio;
    private int id_plan;
    private LocalDate fecha_inicio;
    private LocalDate fecha_fin;
    private double valor_pagado;

    private String nombreSocio;
    private String nombrePlan;
    private long diasRestantes;
    private String estado;

    public Membresia() {
    }

    public Membresia(int id_membresia, int id_socio, int id_plan, LocalDate fecha_inicio, LocalDate fecha_fin, double valor_pagado, String nombreSocio, String nombrePlan, long diasRestantes, String estado) {
        this.id_membresia = id_membresia;
        this.id_socio = id_socio;
        this.id_plan = id_plan;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.valor_pagado = valor_pagado;
        this.nombreSocio = nombreSocio;
        this.nombrePlan = nombrePlan;
        this.diasRestantes = diasRestantes;
        this.estado = estado;
    }

    public String getNombrePlan() {
        return nombrePlan;
    }

    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    public long getDiasRestantes() {
        return diasRestantes;
    }

    public void setDiasRestantes(long diasRestantes) {
        this.diasRestantes = diasRestantes;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setNombreSocio(String nombreSocio) {
        this.nombreSocio = nombreSocio;
    }

    public String getNombreSocio() {
        return nombreSocio;
    }

    public int getId_membresia() {
        return id_membresia;
    }

    public int getId_socio() {
        return id_socio;
    }

    public int getId_plan() {
        return id_plan;
    }

    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }

    public LocalDate getFecha_fin() {
        return fecha_fin;
    }

    public double getValor_pagado() {
        return valor_pagado;
    }

    public void setId_membresia(int id_membresia) {
        this.id_membresia = id_membresia;
    }

    public void setId_socio(int id_socio) {
        this.id_socio = id_socio;
    }

    public void setId_plan(int id_plan) {
        this.id_plan = id_plan;
    }

    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public void setFecha_fin(LocalDate fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public void setValor_pagado(double valor_pagado) {
        this.valor_pagado = valor_pagado;
    }

    @Override
    public String toString() {
        return "Membresia{" + "id_membresia=" + id_membresia + ", id_socio=" + id_socio + ", id_plan=" + id_plan + ", fecha_inicio=" + fecha_inicio + ", fecha_fin=" + fecha_fin + ", valor_pagado=" + valor_pagado + ", nombreSocio=" + nombreSocio + '}';
    }

}
