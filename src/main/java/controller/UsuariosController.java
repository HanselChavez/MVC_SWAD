/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.UsuarioDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author Estudiante
 */
@WebServlet(name = "Usuarios", urlPatterns = {"/Usuarios", "/Usuarios/add", "/Usuarios/edit", "/Usuarios/delete"})
public class UsuariosController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Usuarios/add":
                handleAddUser(request, response);
                break;
            case "/Usuarios/edit":
                handleEditUser(request, response);
                break;
            case "/Usuarios/delete":
                handlDeleteUser(request, response);
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
            case "/Usuarios/add":
            case "/Usuarios/edit":
            case "/Usuarios/delete":
                request.getRequestDispatcher("/admin?pagina=usuario").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void handleAddUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Aquí se maneja la lógica para agregar un usuario
        // Los parámetros se obtienen del request como en tu código original
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String apellidoMat = request.getParameter("apeMaterno");
        String tel = request.getParameter("telefono");
        String apellidoPat = request.getParameter("apePaterno");
        int idrol = Integer.parseInt(request.getParameter("rol"));
        System.out.println("***************AQUI ANTES DE CREAR***************");
        UsuarioDAO cli = new UsuarioDAO();

        cli.createUser(dni, nombre, correo, password, apellidoPat, apellidoMat, tel, idrol, 1);
        System.out.println("***************DESPUES DE CREAR***************");
        response.sendRedirect("/admin?pagina=usuario");
    }

    private void handlDeleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        Usuario cli = new Usuario();
        // cli.deleteUser(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        request.getRequestDispatcher("/admin?pagina=usuario").forward(request, response);
    }

    private void handleEditUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String apellidoMat = request.getParameter("apeMaterno");
        String tel = request.getParameter("telefono");
        String apellidoPat = request.getParameter("apePaterno");
        int idrol = 1;
        try {
            idrol = Integer.parseInt(request.getParameter("rol"));
        } catch (NumberFormatException e) {
            System.out.println("Error al parsear el rol: " + e.getMessage());
            response.sendRedirect("errorPage.jsp?error=Invalid+role+value");
            return;
        }
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        Usuario cli = new Usuario();
        //cli.editUser(id, dni, nombre, fechanac, username, correo, password, apellidoMat, apellidoPat, null, idrol, tel);
        System.out.println("***************DESPUES DE EDITAR***************");
        request.getRequestDispatcher("/admin?pagina=usuario").forward(request, response);
    }
}
