/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import com.sun.org.apache.bcel.internal.Const;

/**
 *
 * @author PC_21
 */
public class Plan {

   private int id_Plan;
    private String nombre;
    private int duracion_dias;
    private double valor;
    private boolean activo;

    public Plan() {
    }

    public int getId_Plan() {
        return id_Plan;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDuracion_dias() {
        return duracion_dias;
    }

    public double getValor() {
        return valor;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setId_Plan(int id_Plan) {
        this.id_Plan = id_Plan;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDuracion_dias(int duracion_dias) {
        this.duracion_dias = duracion_dias;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

}
