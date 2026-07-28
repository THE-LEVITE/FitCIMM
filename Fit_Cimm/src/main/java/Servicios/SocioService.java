package Servicios;

import Modelo.Socio;
import DAO.GestionSocios;
import DAO.GestionMembresia;
import Modelo.Membresia;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class SocioService {

    private GestionSocios oSocioDAO = new GestionSocios();
    private GestionMembresia oMembresiaDAO = new GestionMembresia();

    public void insertarSocio(Socio oSocio) throws Exception {
        if (oSocioDAO.documentoExiste(oSocio.getDocumento())) {
            throw new Exception("El documento ya existe");
        }

        int edad = Period.between(oSocio.getFecha_nacimiento(), LocalDate.now()).getYears();
        if (edad < 15) {
            throw new Exception("El socio debe ser mayor de 15 años");
        }

        oSocioDAO.insertarSocio(oSocio);
    }

    /*public List<Socio> ListarSocios() throws SQLException {
        return oSocioDAO.listarSocios();
    }
     */
    public Socio socioId(String idSocio) throws SQLException {
        return oSocioDAO.socioId(idSocio);
    }

    public void editarSocio(Socio oSocio, int idSo) throws Exception {
        int edad = Period.between(oSocio.getFecha_nacimiento(), LocalDate.now()).getYears();
        if (edad < 15) {
            throw new Exception("El socio debe ser mayor de 15 años");
        }
        oSocioDAO.editarSocio(oSocio, idSo);
    }

    public void inactivarSocio(String idSocio) throws Exception {

        Membresia membresia = oMembresiaDAO.consultarMembresiaVigente(Integer.parseInt(idSocio));
        if (membresia != null) {
            throw new Exception("No se puede inactivar el socio porque tiene una membresía vigente");
        }
        oSocioDAO.eliminarSocio(idSocio);
    }

    public List<Socio> bucarSocio(String busqueda) throws SQLException {
        return oSocioDAO.bucarSocio(busqueda);
    }

    public List<Socio> listarSociosConMembresia() throws SQLException {
        return oSocioDAO.listarSociosConMembresia();
    }

    public List<Membresia> getHistorialMembresias(int idSocio) throws SQLException {
        return oMembresiaDAO.getHistorialMembresias(idSocio);
    }

    public List<Socio> ListarSocios() throws SQLException {

        List<Socio> socioList = oSocioDAO.listarSocios();

        return socioList;
    }
}
