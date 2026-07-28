/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Membresia;
import Modelo.Plan;
import Modelo.Socio;
import Servicios.MembresiaService;
import Servicios.PlanService;
import Servicios.SocioService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MembresiaControlador", urlPatterns = {"/MembresiaControlador"})
public class MembresiaControlador extends HttpServlet {

    private MembresiaService oServiceM = new MembresiaService();
    private PlanService oServiceP = new PlanService();
    private SocioService oServiceS = new SocioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        try {

            if ("nuevo".equals(accion)) {

                List<Plan> listaPlanes = oServiceP.listarPlanes();
                List<Socio> listaSocios = oServiceS.ListarSocios();

                request.setAttribute("listPlan", listaPlanes);
                request.setAttribute("listaSocios", listaSocios);

                RequestDispatcher rd = request.getRequestDispatcher("VenderMembresia.jsp");
                rd.forward(request, response);

            } else if ("listar".equals(accion)) {

                List<Membresia> lista = oServiceM.listarMembresias();

                request.setAttribute("listaMembresias", lista);

                RequestDispatcher rd = request.getRequestDispatcher("MembresiaListar.jsp");
                rd.forward(request, response);

            } else if ("porVencer".equals(accion)) {

                List<Membresia> lista = oServiceM.listarPorVencer();

                request.setAttribute("listaPorVencer", lista);

                RequestDispatcher rd
                        = request.getRequestDispatcher("MembresiaPorVencer.jsp");

                rd.forward(request, response);
            }

            if ("renovar".equals(accion)) {
                try {
                    int id = Integer.parseInt(request.getParameter("id"));

                    Membresia m = oServiceM.membresiaId(id);

                    if (m == null) {
                        request.setAttribute("error", "La membresía no existe");
                        request.getRequestDispatcher("MembresiaListar.jsp").forward(request, response);
                        return;
                    }

                    int idPlan = m.getId_plan();
                    int idSocio = m.getId_socio();

                    Membresia membresiaVigente = oServiceM.consultarMembresiaSocio(idSocio);

                    if (membresiaVigente != null) {
                        LocalDate hoy = LocalDate.now();
                        if (!membresiaVigente.getFecha_fin().isBefore(hoy)) {
                            request.setAttribute("error", "El socio ya tiene una membresía vigente hasta "
                                    + membresiaVigente.getFecha_fin() + ". No se puede renovar.");
                            request.getRequestDispatcher("MembresiaListar.jsp").forward(request, response);
                            return;
                        }
                    }

                    oServiceM.renovarMembresia(idSocio, idPlan);

                    request.setAttribute("mensajeExito", "Membresía renovada exitosamente");
                    response.sendRedirect("MembresiaControlador?accion=listar");

                } catch (Exception e) {
                    request.setAttribute("error", "Error al renovar: " + e.getMessage());
                    request.getRequestDispatcher("MembresiaListar.jsp").forward(request, response);
                    System.out.println("Error al renovar: " + e.getMessage());
                }
                return;
            }

        } catch (Exception e) {

            System.out.println("Error " + e.getMessage());

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("registrar".equals(accion)) {

            try {

                Membresia oMembresia = new Membresia();

                oMembresia.setId_socio(
                        Integer.parseInt(request.getParameter("id_socio")));

                oMembresia.setId_plan(
                        Integer.parseInt(request.getParameter("id_plan")));

                oMembresia.setFecha_inicio(LocalDate.now());

                oServiceM.venderMembresia(oMembresia);

                response.sendRedirect("MembresiaControlador?accion=listar");

            } catch (Exception e) {

                request.setAttribute("error", e.getMessage());

                try {
                    request.setAttribute("listPlan", oServiceP.listarPlanes());
                    request.setAttribute("listaSocios", oServiceS.ListarSocios());
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }

                request.getRequestDispatcher("VenderMembresia.jsp").forward(request, response);
            }

        }

    }

}
