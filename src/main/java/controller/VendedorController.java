package controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "/vendedor", urlPatterns = {"/vendedor", "/vendedor/"})
public class VendedorController extends HttpServlet {
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
                case "dashboard":
                    view = "dashboard/index.jsp";
                    break;
                case "ventas":
                    System.out.println("ACCION: " + accion);
                    if (accion == null) {
                        view = "ventas/index.jsp";
                        break;
                    } else if ("vender".equals(accion)) {
                        view = "ventas/vender.jsp";
                        break;
                    }
                    break;
                case "productos":
                    view = "productos/index.jsp";
                    break;
                case "almacen":
                    view = "almacen/list.jsp";
                    break;
                case "cliente":
                    view = "client/list.jsp";
                    break;
                case "envios":
                    view = "envios/list.jsp";
                    break;
                default:
                    view = "index.jsp";
                    break;
            }
        }
        request.setAttribute("view", view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/vendedor/index.jsp");
        dispatcher.forward(request, response);
        } else {
            response.sendRedirect("../auth/error401.jsp");
        }
    }

}
