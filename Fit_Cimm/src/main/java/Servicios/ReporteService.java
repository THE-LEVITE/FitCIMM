package Servicios;

import DAO.GestionReportes;
import Modelo.ReporteRecaudo;
import Modelo.Socio;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class ReporteService {

    private GestionReportes oReporteDAO = new GestionReportes();

    public List<Socio> listarSociosActivosConMembresia() throws SQLException {
        return oReporteDAO.listarSociosActivosConMembresia();
    }

    public List<ReporteRecaudo> getTotalRecaudadoPorPlan(LocalDate fechaInicio, LocalDate fechaFin) throws SQLException {
        return oReporteDAO.getTotalRecaudadoPorPlan(fechaInicio, fechaFin);
    }

    public ReporteRecaudo getPlanMasVendidoDelMes() throws SQLException {
        return oReporteDAO.getPlanMasVendidoDelMes();
    }
}
