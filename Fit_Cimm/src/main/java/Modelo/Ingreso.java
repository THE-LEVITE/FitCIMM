/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author PC_21
 */
public class Ingreso {

    private int id_ingreso;
    private int id_socio;
    private LocalDate fecha_ingreso;
    private LocalTime hora_ingreso;

    private String nombreSocio;

    public Ingreso() {
    }

    public Ingreso(int id_ingreso, int id_socio, LocalDate fecha_ingreso, LocalTime hora_ingreso, String nombre) {
        this.id_ingreso = id_ingreso;
        this.id_socio = id_socio;
        this.fecha_ingreso = fecha_ingreso;
        this.hora_ingreso = hora_ingreso;
        this.nombreSocio = nombre;
    }

    public String getNombreSocio() {
        return nombreSocio;
    }

    public void setNombreSocio(String nombreSocio) {
        this.nombreSocio = nombreSocio;
    }

    public int getId_ingreso() {
        return id_ingreso;
    }

    public int getId_socio() {
        return id_socio;
    }

    public LocalDate getFecha_ingreso() {
        return fecha_ingreso;
    }

    public LocalTime getHora_ingreso() {
        return hora_ingreso;
    }

    public void setId_ingreso(int id_ingreso) {
        this.id_ingreso = id_ingreso;
    }

    public void setId_socio(int id_socio) {
        this.id_socio = id_socio;
    }

    public void setFecha_ingreso(LocalDate fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public void setHora_ingreso(LocalTime hora_ingreso) {
        this.hora_ingreso = hora_ingreso;
    }

}
