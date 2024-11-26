package controller;

import dao.TransporteDAO;
import model.Transporte;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Transportes", urlPatterns = {"/Transportes", "/Transportes/add", "/Transportes/edit", "/Transportes/delete"})
public class TransporteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/Transportes/add":
                handleAddTransporte(request, response);
                break;
            case "/Transportes/edit":
                handleEditTransporte(request, response);
                break;
            case "/Transportes/delete":
                handleDeleteTransporte(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/Transportes/add":
            case "/Transportes/edit":
            case "/Transportes/delete":
                response.sendRedirect("/admin?pagina=transporte");
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    // Manejar la creación de un nuevo transporte
    private void handleAddTransporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String descripcion = request.getParameter("descripcion");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String placa = request.getParameter("placa");

        TransporteDAO dao = new TransporteDAO();
        HttpSession sesion = request.getSession();
        String idCreador = sesion.getAttribute("idUsuario").toString();

        dao.createTransporte(descripcion, marca, modelo, placa, idCreador);
        System.out.println("Transporte creado exitosamente.");
        response.sendRedirect("/admin?pagina=transporte");
    }

    // Manejar la edición de un transporte existente
    private void handleEditTransporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String placa = request.getParameter("placa");

        TransporteDAO dao = new TransporteDAO();
        HttpSession sesion = request.getSession();
        String idModificador = sesion.getAttribute("idUsuario").toString();

        dao.editTransporte(id, descripcion, marca, modelo, placa, idModificador);
        System.out.println("Transporte actualizado exitosamente.");
        response.sendRedirect("/admin?pagina=transporte");
    }

    // Manejar la eliminación de un transporte
    private void handleDeleteTransporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));

        TransporteDAO dao = new TransporteDAO();
        dao.deleteTransporte(id);
        System.out.println("Transporte eliminado exitosamente.");
        response.sendRedirect("/admin?pagina=transporte");
    }
}
