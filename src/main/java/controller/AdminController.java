package controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "/admin", urlPatterns = {"/admin", "/admin/"})
public class AdminController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getParameter("pagina");
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null && "1".equals(sesion.getAttribute("userlog").toString())) {
            String view = "index.jsp";
            if (pagina != null) {
                switch (pagina) {
                    case "dashboard":
                        view = "dashboard/index.jsp";
                        break;
                    case "usuario":
                        view = "user/list.jsp";
                        break;
                    case "rol":
                        view = "rol/list.jsp";
                        break;
                    case "cliente":
                        view = "client/list.jsp";
                        if (accion != null && accion.equals("add")) {
                            view = "client/add.jsp";
                        } else if (accion != null && accion.equals("delete")) {
                            view = "client/delete.jsp";
                        } else if (accion != null && accion.equals("details")) {
                            view = "client/details.jsp";
                        } else if (accion != null && accion.equals("edit")) {
                            view = "client/edit.jsp";
                        }
                        break;
                    case "almacen":
                        view = "almacen/list.jsp";
                        break;
                    case "detalle":
                        view = "detalleProducto.jsp";
                        break;
                    case "proveedor":
                        view = "proveedor/list.jsp";
                        break;
                    case "transporte":
                        view = "transporte/list.jsp";
                        break;
                    case "categoria":
                        view = "category/list.jsp";
                        if (accion != null && accion.equals("add")) {
                            view = "category/add.jsp";
                        } else if (accion != null && accion.equals("delete")) {
                            view = "category/delete.jsp";
                        } else if (accion != null && accion.equals("details")) {
                            view = "category/details.jsp";
                        } else if (accion != null && accion.equals("edit")) {
                            view = "category/edit.jsp";
                        }
                        break;
                    case "producto":
                        view = "product/list.jsp";
                        if (accion != null && accion.equals("add")) {
                            view = "product/add.jsp";
                        } else if (accion != null && accion.equals("delete")) {
                            view = "product/delete.jsp";
                        } else if (accion != null && accion.equals("details")) {
                            view = "product/details.jsp";
                        } else if (accion != null && accion.equals("edit")) {
                            view = "product/edit.jsp";
                        }
                        break;
                    case "venta":
                        if (accion != null && accion.equals("vender")) {
                            view = "venta/vender.jsp";
                        } else {
                            view = "venta/list.jsp";
                        }
                        break;
                    case "compra":
                        view = "compra/list.jsp";
                        break;
                    case "envio":
                        view = "envio/list.jsp";
                        break;
                    default:
                        view = "index.jsp";
                        break;
                }
            }
            request.setAttribute("view", view);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/index.jsp");
            dispatcher.forward(request, response); // Forward to the specific view
        } else {
            response.sendRedirect("../auth/error401.jsp");
        }
    }
}
