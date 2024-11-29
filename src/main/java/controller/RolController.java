package controller;

import dao.RolDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Rols", urlPatterns = {"/Rols", "/Rols/add", "/Rols/edit", "/Rols/delete"})
public class RolController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/Rols/add":
                handleAddRol(request, response);
                break;
            case "/Rols/edit":
                handleEditRol(request, response);
                break;
            case "/Rols/delete":
                handlDeleteRol(request, response);
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
            case "/Rols/add":
                request.getRequestDispatcher("/admin/index.jsp?pagina=rol").forward(request, response);
                break;
            case "/Rols/edit":
                request.getRequestDispatcher("/admin/index.jsp?pagina=rol").forward(request, response);
                break;
            case "/Rols/delete":
                request.getRequestDispatcher("/admin/index.jsp?pagina=rol").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void handleAddRol(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        System.out.println("***************AQUI ANTES DE CREAR***************");
        RolDAO rol = new RolDAO();
        rol.createRol(nombre, descripcion);
        System.out.println("***************DESPUES DE CREAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=rol").forward(request, response);
    }

    private void handlDeleteRol(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        RolDAO rol = new RolDAO();
        rol.deleteRol(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=rol").forward(request, response);
    }

    private void handleEditRol(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        RolDAO rol = new RolDAO();
        rol.editRol(id, nombre, descripcion);
        System.out.println("***************DESPUES DE EDITAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=rol").forward(request, response);
    }
}
