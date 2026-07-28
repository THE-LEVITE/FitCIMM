package Servicios;

import DAO.GestionIngreso;
import java.sql.SQLException;
import Modelo.Ingreso;
import java.time.LocalDate;
import java.util.List;

public class IngresoService {

    private GestionIngreso oGestionIngreso = new GestionIngreso();

    public void registrarIngreso(int id_socio) throws SQLException {
        oGestionIngreso.registrarIngreso(id_socio);
    }

    public void actualizarIngreso(int id_Socio) throws SQLException {
        oGestionIngreso.actualizarIngreso(id_Socio);
    }

    public boolean consultarIngreso(int idSocio) throws SQLException {
        return oGestionIngreso.consultarIngreso(idSocio);
    }

    public boolean ultimoIngreso(int idSocio) throws SQLException {
        return oGestionIngreso.ultimoIngreso(idSocio);
    }

    public boolean consultarIngresoHoy(int idSocio) throws SQLException {
        return oGestionIngreso.consultarIngresoHoy(idSocio);
    }

    public List<Ingreso> buscarIngresos(LocalDate fechaBusqueda) throws SQLException {
        return oGestionIngreso.buscarIngresos(fechaBusqueda);
    }
}
