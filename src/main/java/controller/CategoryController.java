package controller;

import dao.CategoriaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Categories", urlPatterns = {"/Categories", "/Categories/add", "/Categories/edit", "/Categories/delete"})
public class CategoryController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/Categories/add":
                handleAddCategory(request, response);
                break;
            case "/Categories/edit":
                handleEditCategory(request, response);
                break;
            case "/Categories/delete":
                handlDeleteCategory(request, response);
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
            case "/Categories/add":
            case "/Categories/edit":
            case "/Categories/delete":
                response.sendRedirect("/admin?pagina=categoria");
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    public void handleAddCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        System.out.println("***************AQUI ANTES DE CREAR***************");
        CategoriaDAO cat = new CategoriaDAO();
        HttpSession sesion = request.getSession();
        String idModificador = sesion.getAttribute("idUsuario").toString();
        cat.createCategory(nombre, descripcion, idModificador);
        System.out.println("***************DESPUES DE CREAR***************");
        response.sendRedirect("/admin?pagina=categoria");
    }

    private void handlDeleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        CategoriaDAO rol = new CategoriaDAO();
        rol.deleteCategory(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        response.sendRedirect("/admin?pagina=categoria");
    }

    private void handleEditCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        Long id = Long.valueOf(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        CategoriaDAO cat = new CategoriaDAO();
        cat.editCategory(id, nombre, descripcion);
        System.out.println("***************DESPUES DE EDITAR***************");
        response.sendRedirect("/admin?pagina=categoria");
    }
}
