/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author halfo
 */
public enum EstadoMembresia {
    VIGENTE("Vigente", "success"),
    POR_VENCER("Por vencer", "warning"),
    VENCIDA("Vencida", "danger"),
    SIN_MEMBRESIA("Sin membresía", "secondary");

    private String descripcion;
    private String colorBootstrap;

    EstadoMembresia(String descripcion, String colorBootstrap) {
        this.descripcion = descripcion;
        this.colorBootstrap = colorBootstrap;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getColorBootstrap() {
        return colorBootstrap;
    }
}
