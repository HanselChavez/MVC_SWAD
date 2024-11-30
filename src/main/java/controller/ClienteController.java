package controller;

import dao.ClienteDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Cliente", urlPatterns = {"/Cliente", "/Cliente/add", "/Cliente/edit", "/Cliente/delete"})
public class ClienteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/Cliente/add":
                handleAddCliente(request, response);
                break;
            case "/Cliente/edit":
                handleEditCliente(request, response);
                break;
            case "/Cliente/delete":
                handleDeleteCliente(request, response);
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
            case "/Cliente/add":
                request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
                break;
            case "/Cliente/edit":
                request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
                break;
            case "/Cliente/delete":
                request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void handleAddCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String apellPaterno = request.getParameter("apaterno");
        String apellMaterno = request.getParameter("amaterno");
        String telf = request.getParameter("telefono");
        String dni = request.getParameter("dni");
        String contra = request.getParameter("contra");
        String correo = request.getParameter("correo");
        System.out.println("***************AQUI ANTES DE CREAR***************");
        ClienteDAO cl = new ClienteDAO();
        cl.createCliente(dni, nombre, correo, "Abcd1234$", apellPaterno, apellMaterno, telf, 1);
        System.out.println("DNI: " + dni
                + " NOMBRE: " + nombre
                + " CORREO: " + correo
                + " CONTRASEÑA: " + contra
                + " APELLIDO PATERNO: " + apellPaterno
                + " APELLIDO MATERNO: " + apellMaterno
                + " TELÉFONO: " + telf
                + " OTRO DATO: " + 1);
        System.out.println("***************DESPUES DE CREAR***************");
        response.sendRedirect("/admin?pagina=cliente");
    }

    private void handleDeleteCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        ClienteDAO cl = new ClienteDAO();
        cl.deleteCliente(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        response.sendRedirect("/admin?pagina=cliente");
    }

    private void handleEditCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellPaterno = request.getParameter("apaterno");
        String apellMaterno = request.getParameter("amaterno");
        String telf = request.getParameter("telefono");
        String direc = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String contra = request.getParameter("contra");
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        ClienteDAO cl = new ClienteDAO();
        cl.editCliente(id, nombre, apellPaterno, apellMaterno, telf, direc, dni, contra);
        System.out.println("***************DESPUES DE EDITAR***************");
        response.sendRedirect("/admin?pagina=cliente");
    }
}
