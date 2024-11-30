/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "/transportista", urlPatterns = {"/transportista", "/transportista/"})
public class TransportistaController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Servlet Invoked");
        String pagina = request.getParameter("pagina");
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
        System.out.println("llego request");
        if (sesion.getAttribute("userlog") != null) {
            String view = "index.jsp";
            if (pagina != null) {
                switch (pagina) {
                    case "clientes":
                        if (accion != null && accion.equals("details")) {
                            view = "clientes/details.jsp";
                        } else {
                            view = "clientes/list.jsp";
                        }
                        break;
                    case "envios":
                        if (accion != null && accion.equals("details")) {
                            view = "envios/details.jsp";
                        } else {
                            view = "envios/list.jsp";                    
                        }
                        break;
                    case "reportes":
                        view = "reportes/list.jsp";
                        break;
                    case "rutas":
                        view = "rutas/list.jsp";
                        break;
                    case "trasnporte":
                        view = "trasnporte/list.jsp";
                        break;
                    case "dashboard":
                        view = "dashboard/index.jsp";
                        break;
                    default:
                        view = "index.jsp";
                        break;
                }
            }
            request.setAttribute("view", view);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/transportista/index.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("../auth/error401.jsp");
        }
    }
}
