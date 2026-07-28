/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Plan;
import Servicios.PlanService;
import java.util.List;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author arang
 */
@WebServlet(name = "PlanControlador", urlPatterns = {"/PlanControlador"})
public class PlanControlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    private PlanService oServiceP = new PlanService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        System.out.println(accion);

        try {
            if ("listarPlan".equals(accion)) {
                List<Plan> oListP = oServiceP.listarPlanes();

                System.out.println("Numero de planes " + oListP.size());

                request.setAttribute("listPlan", oListP);
                RequestDispatcher rd = request.getRequestDispatcher("PlanListar.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error al listar planes " + e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");

        if ("registrar".equals(accion)) {
            Plan oPlan = new Plan();
            oPlan.setNombre(request.getParameter("nombre_plan"));
            System.out.println("Nombre del Plan" + oPlan.getNombre());

            oPlan.setDuracion_dias(Integer.parseInt(request.getParameter("duracion_dias")));
            oPlan.setValor(Double.parseDouble(request.getParameter("valor")));
            oPlan.setActivo(true);

            try {
                oServiceP.crearPlan(oPlan);
                response.sendRedirect("PlanControlador?accion=listarPlan");
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                System.out.println("Error a crear el Plan " + e);
            }
        } else if ("editar".equals(accion)) {

            try {
                String idPlan = request.getParameter("id");

                Plan oPlan = oServiceP.PlanId(idPlan);
                request.setAttribute("idEdit", oPlan.getId_Plan());
                request.setAttribute("nombreEdit", oPlan.getNombre());
                request.setAttribute("duracionEdit", oPlan.getDuracion_dias());
                request.setAttribute("valorEdit", oPlan.getValor());
                RequestDispatcher rd = request.getRequestDispatcher("EditarPlan.jsp");
                rd.forward(request, response);

            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
                request.getRequestDispatcher("form.jps").forward(request, response);
                System.out.println(e);
            }
        } else if ("guardar".equals(accion)) {
            Plan oPlan = new Plan();

            oPlan.setNombre(request.getParameter("nombreEdit"));
            oPlan.setDuracion_dias(Integer.parseInt(request.getParameter("duracionEdit")));
            oPlan.setValor(Double.parseDouble(request.getParameter("valorEdit")));

            String planId = request.getParameter("idEdit");

            int idPlan = Integer.parseInt(planId);

            try {

                oServiceP.editarPlan(oPlan, idPlan);
                response.sendRedirect("PlanControlador?accion=listarPlan");
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("form.jsp").forward(request, response);
                System.out.println(e);
            }

        } else if ("eliminar".equals(accion)) {
            String idPlan = request.getParameter("id");

            try {
                oServiceP.eliminarPlan(idPlan);
                response.sendRedirect("PlanControlador?accion=listarPlan");
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("form.jsp").forward(request, response);
                System.out.println(e);
            }
        } else if ("buscar".equals(accion)) {

            String busqueda = request.getParameter("busqueda");

            try {
                List<Plan> listPlan = oServiceP.buscarPlan(busqueda);
                request.setAttribute("busqPlan", listPlan);

                RequestDispatcher rd = request.getRequestDispatcher("PlanEncontrado.jsp");

                rd.forward(request, response);
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("form.jsp").forward(request, response);
                System.out.println(e);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
