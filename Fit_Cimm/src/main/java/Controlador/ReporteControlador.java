package Controlador;

import Servicios.ReporteService;
import Modelo.ReporteRecaudo;
import Modelo.Socio;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReporteControlador", urlPatterns = {"/ReporteControlador"})
public class ReporteControlador extends HttpServlet {

    private ReporteService reporteService = new ReporteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        try {

            if ("sociosVigentes".equals(accion)) {
                List<Socio> socios = reporteService.listarSociosActivosConMembresia();
                request.setAttribute("socios", socios);
                request.getRequestDispatcher("ReporteSociosVigentes.jsp").forward(request, response);
                return;
            }

            if ("recaudo".equals(accion)) {
                LocalDate fechaInicio = LocalDate.now().withDayOfMonth(1);
                LocalDate fechaFin = LocalDate.now();

                String fechaInicioParam = request.getParameter("fechaInicio");
                String fechaFinParam = request.getParameter("fechaFin");

                if (fechaInicioParam != null && !fechaInicioParam.isEmpty()) {
                    fechaInicio = LocalDate.parse(fechaInicioParam);
                }
                if (fechaFinParam != null && !fechaFinParam.isEmpty()) {
                    fechaFin = LocalDate.parse(fechaFinParam);
                }

                List<ReporteRecaudo> recaudos = reporteService.getTotalRecaudadoPorPlan(fechaInicio, fechaFin);
                request.setAttribute("recaudos", recaudos);
                request.setAttribute("fechaInicio", fechaInicio);
                request.setAttribute("fechaFin", fechaFin);
                request.getRequestDispatcher("ReporteRecaudo.jsp").forward(request, response);
                return;
            }

            if ("planMasVendido".equals(accion)) {
                ReporteRecaudo plan = reporteService.getPlanMasVendidoDelMes();
                request.setAttribute("plan", plan);
                request.getRequestDispatcher("ReportePlanMasVendido.jsp").forward(request, response);
                return;
            }

        } catch (Exception e) {
            request.setAttribute("error", "Error al generar reporte: " + e.getMessage());
            request.getRequestDispatcher("Index.jsp").forward(request, response);
        }
    }
}
