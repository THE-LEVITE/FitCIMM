package Controlador;

import Modelo.Ingreso;
import Servicios.IngresoService;
import Servicios.SocioService;
import Servicios.MembresiaService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Socio;
import Modelo.Membresia;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet(name = "IngresoControl", urlPatterns = {"/IngresoControl"})
public class IngresoControl extends HttpServlet {

    private IngresoService oIngresoS = new IngresoService();
    private SocioService oServiceSocio = new SocioService();
    private MembresiaService oMembresiaS = new MembresiaService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        try {

            if ("registrarIngreso".equals(accion)) {
                String documentoSocio = request.getParameter("ingreso");

                if (documentoSocio == null || documentoSocio.trim().isEmpty()) {
                    request.setAttribute("error", "Debe ingresar un número de documento");
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                List<Socio> SocioList = oServiceSocio.bucarSocio(documentoSocio);
                Socio oSocio = (SocioList != null && !SocioList.isEmpty()) ? SocioList.get(0) : null;

                if (oSocio == null) {
                    request.setAttribute("error", "No existe ningún socio con el documento: " + documentoSocio);
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                if (!oSocio.isActivo()) {
                    request.setAttribute("error", "El socio está INACTIVO. No puede registrar ingreso.");
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                Membresia oMembresia = oMembresiaS.consultarMembresiaSocio(oSocio.getId_socio());
                if (oMembresia == null || oMembresia.getFecha_fin() == null) {
                    request.setAttribute("error", "El socio no tiene una membresía vigente.");
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                long diasRestantes = oMembresiaS.calcularDiasRestantes(oMembresia.getFecha_fin());
                if (diasRestantes < 0) {
                    request.setAttribute("error", "La membresía del socio está VENCIDA. No puede ingresar.");
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                boolean yaIngresoHoy = oIngresoS.consultarIngresoHoy(oSocio.getId_socio());
                if (yaIngresoHoy) {
                    request.setAttribute("error", "El socio YA INGRESÓ hoy. Solo se permite un ingreso por día.");

                    String infoSocio = "Socio: " + oSocio.getNombres() + " " + oSocio.getApellidos()
                            + ". Días restantes: " + diasRestantes;
                    request.setAttribute("textoEnviado2", infoSocio);
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                oIngresoS.registrarIngreso(oSocio.getId_socio());

                String mensaje = "✅ Ingreso registrado correctamente.";
                String infoSocio = "Socio: " + oSocio.getNombres() + " " + oSocio.getApellidos()
                        + ". Días restantes: " + diasRestantes;

                request.setAttribute("textoEnviado", mensaje);
                request.setAttribute("textoEnviado2", infoSocio);
                request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                return;
            }

            if ("buscarFecha".equals(accion)) {
                String fechaBusquedaString = request.getParameter("busquedaFecha");

                if (fechaBusquedaString == null || fechaBusquedaString.trim().isEmpty()) {
                    request.setAttribute("error", "Debe seleccionar una fecha para la búsqueda");
                    request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                    return;
                }

                LocalDate fechaBusqueda = LocalDate.parse(fechaBusquedaString);
                List<Ingreso> listIngreso = oIngresoS.buscarIngresos(fechaBusqueda);

                if (listIngreso != null && !listIngreso.isEmpty()) {
                    String mensaje = "El día " + fechaBusquedaString + " tuvo un total de "
                            + listIngreso.size() + " ingresos registrados.";
                    request.setAttribute("textoEnviado", mensaje);
                    request.setAttribute("listaIngresos", listIngreso);
                } else {
                    request.setAttribute("textoEnviado", "En la fecha " + fechaBusquedaString + " no hubo ingresos.");
                }

                request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                return;
            }

        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
        }
    }
}
