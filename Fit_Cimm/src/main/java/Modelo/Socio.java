/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;

/**
 *
 * @author PC_21
 */
public class Socio {

    private int id_socio;
    private String documento;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String correo;
    private LocalDate fecha_nacimiento;
    private boolean activo;

    private Membresia membresiaActual;

    public Socio() {
        this.activo = true;
    }

    public Socio(int id_socio, String documento, String nombres, String apellidos, String telefono, String correo, LocalDate fecha_nacimiento, boolean activo, Membresia membresiaActual) {
        this.id_socio = id_socio;
        this.documento = documento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.correo = correo;
        this.fecha_nacimiento = fecha_nacimiento;
        this.activo = activo;
        this.membresiaActual = membresiaActual;
    }

    public Membresia getMembresiaActual() {
        return membresiaActual;
    }

    public void setMembresiaActual(Membresia membresiaActual) {
        this.membresiaActual = membresiaActual;
    }

    public int getId_socio() {
        return id_socio;
    }

    public String getDocumento() {
        return documento;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setId_socio(int id_socio) {
        this.id_socio = id_socio;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Socio{" + "id_socio=" + id_socio + ", documento=" + documento + ", nombres="
                + nombres + ", apellidos=" + apellidos + ", telefono=" + telefono + ", correo="
                + correo + ", fecha_nacimiento=" + fecha_nacimiento + ", activo=" + activo + '}';
    }

    public enum EstadoMembresia {
        VIGENTE, POR_VENCER, VENCIDA
    }

}
