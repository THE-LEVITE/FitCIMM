/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.time.LocalDate;

/**
 *
 * @author halfo
 */
public class FuncionesFitt {

    public boolean camposVaciosString(String datos) {

        boolean validarDatos = true;

        if (datos == null || datos.trim().isEmpty()) {
            validarDatos = false;
        }

        return validarDatos;
    }

    public boolean camposVaciosInt(int datos) {

        boolean validarDatos = true;

        if (datos <= 0) {
            validarDatos = false;
        }

        return validarDatos;
    }

    public boolean camposVaciosDate(LocalDate datos) {

        boolean validarDatos = true;

        if (datos == null) {
            validarDatos = false;
        }

        return validarDatos;
    }

}
