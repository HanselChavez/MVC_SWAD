package controller;

import dao.ProveedorDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

;

@WebServlet(name = "Proveedor", urlPatterns = {"/Proveedor", "/Proveedor/add", "/Proveedor/edit",
    "/Proveedor/delete"})
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

    protected void handleAddProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String empresa = request.getParameter("empresa");
        String telefono = request.getParameter("telefono");
        String ruc = request.getParameter("ruc");
        String direccion = request.getParameter("direccion");
        String email = request.getParameter("email");
        String contactoNombre = request.getParameter("contactoNombre");
        String contactoTelefono = request.getParameter("contactoTelefono");

        ProveedorDAO proveedorDAO = new ProveedorDAO();

        int resultado = proveedorDAO.createProveedor(empresa, telefono, ruc, direccion, email, contactoNombre, contactoTelefono);

        if (resultado > 0) {
            System.out.println("Proveedor y contacto creados exitosamente.");
            request.setAttribute("mensaje", "Proveedor creado con éxito.");
        } else {
            System.out.println("Error al crear el proveedor y contacto.");
            request.setAttribute("mensaje", "Error al crear el proveedor.");
        }
        response.sendRedirect("/admin?pagina=proveedor");
    }

    private void handleDeleteProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        ProveedorDAO prov = new ProveedorDAO();
        int filasAfectadas = prov.deleteProveedor(id);
        if (filasAfectadas > 0) {
            System.out.println("Proveedor eliminado correctamente.");
        } else {
            System.out.println("No se pudo eliminar el proveedor.");
        }
        response.sendRedirect("/admin?pagina=proveedor");
    }

    private void handleEditProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProveedor = Integer.parseInt(request.getParameter("id"));
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String empresa = request.getParameter("empresa");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String email = request.getParameter("email");
        String ruc = request.getParameter("ruc");
        String contactoNombre = request.getParameter("contactoNombre");
        String contactoTelefono = request.getParameter("contactoTelefono");
        int idContacto = Integer.parseInt(request.getParameter("idContacto"));

        System.out.println("***************AQUI ANTES DE EDITAR***************");
        ProveedorDAO prov = new ProveedorDAO();
        int filasAfectadas = prov.updateProveedor(idProveedor, empresa, telefono, direccion, email, ruc, contactoNombre, contactoTelefono, idContacto);
        if (filasAfectadas > 0) {
            System.out.println("Proveedor actualizado correctamente.");
        } else {
            System.out.println("No se pudo actualizar el proveedor.");
        }
        response.sendRedirect("/admin?pagina=proveedor");
    }
}
