package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "PageController", urlPatterns = {"/inicio", "/nosotros", "/contactanos", "/detalle", "/productos"})
public class PageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/inicio":
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                break;
            case "/nosotros":
                request.getRequestDispatcher("/nosotros.jsp").forward(request, response);
                break;
            case "/contactanos":
                request.getRequestDispatcher("/contactanos.jsp").forward(request, response);
                break;
            case "/detalle":
                request.getRequestDispatcher("/detalleProducto.jsp").forward(request, response);
                break;
            case "/productos":
                request.getRequestDispatcher("/productos.jsp").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
}
