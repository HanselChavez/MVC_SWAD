package controller;

import dao.ProveedorDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

@WebServlet(name = "Proveedor", urlPatterns = { "/Proveedor", "/Proveedor/add", "/Proveedor/edit",
        "/Proveedor/delete" })
public class ProveedorController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/Proveedor/add":
                handleAddProveedor(request, response);
                break;
            case "/Proveedor/edit":
                handleEditProveedor(request, response);
                break;
            case "/Proveedor/delete":
                handleDeleteProveedor(request, response);
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
            case "/Proveedor/add":
                request.getRequestDispatcher("/admin/index.jsp?pagina=proveedor").forward(request, response);
                break;
            case "/Proveedor/edit":
                request.getRequestDispatcher("/admin/index.jsp?pagina=proveedor").forward(request, response);
                break;
            case "/Proveedor/delete":
                request.getRequestDispatcher("/admin/index.jsp?pagina=proveedor").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void handleAddProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empresa = request.getParameter("razon");
        String ruc = request.getParameter("ruc");
        String direccion = request.getParameter("direccion");
        String email = request.getParameter("email");
        System.out.println("***************AQUI ANTES DE CREAR***************");
        ProveedorDAO prov = new ProveedorDAO();
        prov.createProveedor(empresa, ruc, direccion, email, email);
        System.out.println("***************DESPUES DE CREAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=proveedor").forward(request, response);
    }

    private void handleDeleteProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        ProveedorDAO prov = new ProveedorDAO();
        System.out.println("ID es: " + id);
        prov.deleteProveedor(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=proveedor").forward(request, response);
    }

    private void handleEditProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String empresa = request.getParameter("razon");
        String encargado = request.getParameter("encargado");
        String ruc = request.getParameter("ruc");
        String direccion = request.getParameter("direccion");
        String email = request.getParameter("email");
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        ProveedorDAO prov = new ProveedorDAO();
        prov.editProveedor(id, empresa, encargado, ruc, direccion, email);
        System.out.println("***************DESPUES DE EDITAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=proveedor").forward(request, response);
    }
}
