package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servicios.SocioService;
import Modelo.Socio;
import Modelo.Membresia;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "SocioControlador", urlPatterns = "/SocioControlador")
public class SocioControlador extends HttpServlet {

    private SocioService oService = new SocioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String idSocio = request.getParameter("id");

        try {
            if ("listar".equals(accion)) {
                List<Socio> socioList = oService.listarSociosConMembresia();
                request.setAttribute("listSocios", socioList);
                RequestDispatcher rd = request.getRequestDispatcher("Socios.jsp");
                rd.forward(request, response);
            } else if ("ingresar".equals(accion)) {
                RequestDispatcher rd = request.getRequestDispatcher("Ingreso.jsp");
                rd.forward(request, response);
            }

            if ("detalle".equals(accion)) {

                Socio socio = oService.socioId(idSocio);
                List<Membresia> historial = oService.getHistorialMembresias(Integer.parseInt(idSocio));

                request.setAttribute("socio", socio);
                request.setAttribute("historial", historial);
                RequestDispatcher rd = request.getRequestDispatcher("DetalleSocio.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error al cargar la página: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accionRegistrar = request.getParameter("Registrar");
        String accionEditar = request.getParameter("Editar");
        String accionGuardar = request.getParameter("guardar");
        String accionEliminar = request.getParameter("Eliminar");
        String accionBuscar = request.getParameter("buscarSocio");
        String idSocio = request.getParameter("id");
        String idSocioEdit = request.getParameter("idEdit");

        try {
            if ("Registrar".equals(accionRegistrar)) {
                Socio oSocio = new Socio();
                oSocio.setDocumento(request.getParameter("documento"));
                oSocio.setNombres(request.getParameter("nombre"));
                oSocio.setApellidos(request.getParameter("apellido"));
                oSocio.setFecha_nacimiento(LocalDate.parse(request.getParameter("fecha_nacimiento")));
                oSocio.setCorreo(request.getParameter("correo"));
                oSocio.setTelefono(request.getParameter("telefono"));

                oService.insertarSocio(oSocio);
                response.sendRedirect("SocioControlador?accion=listar");
                return;
            }

            if ("guardar".equals(accionGuardar)) {
                int idSo = Integer.parseInt(idSocioEdit);
                Socio oSocio = new Socio();
                oSocio.setDocumento(request.getParameter("documentoEdit"));
                oSocio.setNombres(request.getParameter("nombreEdit"));
                oSocio.setApellidos(request.getParameter("apellidoEdit"));
                oSocio.setFecha_nacimiento(LocalDate.parse(request.getParameter("fecha_nacimientoEdit")));
                oSocio.setCorreo(request.getParameter("correoEdit"));
                oSocio.setTelefono(request.getParameter("telefonoEdit"));

                oService.editarSocio(oSocio, idSo);
                response.sendRedirect("SocioControlador?accion=listar");
                return;
            }

            if ("editar".equals(accionEditar)) {
                Socio oSocio = oService.socioId(idSocio);
                request.setAttribute("idEdit", oSocio.getId_socio());
                request.setAttribute("nombreEdit", oSocio.getNombres());
                request.setAttribute("apellidoEdit", oSocio.getApellidos());
                request.setAttribute("documentoEdit", oSocio.getDocumento());
                request.setAttribute("correoEdit", oSocio.getCorreo());
                request.setAttribute("telefonoEdit", oSocio.getTelefono());
                request.setAttribute("fecha_nacimientoEdit", oSocio.getFecha_nacimiento());
                RequestDispatcher rd = request.getRequestDispatcher("EditarSocio.jsp");
                rd.forward(request, response);
                return;
            }

            if ("eliminar".equals(accionEliminar)) {
                oService.inactivarSocio(idSocio); // Cambiado el nombre del método
                response.sendRedirect("SocioControlador?accion=listar");
                return;
            }

            if ("buscar".equals(accionBuscar)) {
                String busqueda = request.getParameter("busqueda");
                List<Socio> listSocio = oService.bucarSocio(busqueda);
                request.setAttribute("busqSocios", listSocio);
                RequestDispatcher rd = request.getRequestDispatcher("SocioEncontrado.jsp");
                rd.forward(request, response);
                return;
            }

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
            rd.forward(request, response);
        }
    }
}
