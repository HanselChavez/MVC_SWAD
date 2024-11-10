/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author Gian&&Hansel
 */
@WebServlet(name = "Auth", urlPatterns = {"/auth", "/auth/"})
public class Autentica extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("llega POST LOGIN");
        switch (accion) {
            case "validar":
                validar(request, response);
                break;
            case "cerrar":
                cerrar(request, response);
                break;
            case "registrar":
                registrar(request, response);
            default:
                break;
        }

    }

    public void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String nombres = request.getParameter("nombre");
        String apePat = request.getParameter("apellidos").split("-")[0];
        String apeMat = request.getParameter("apellidos").split(" ")[1];
        String correo = request.getParameter("email");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

      
        if (!validateRecaptcha(gRecaptchaResponse)) {
            request.setAttribute("error", "Captcha no válido. Intenta nuevamente.");
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
            return;
        }

        UsuarioDAO usuario = new UsuarioDAO();
        int resultado = usuario.createUser(dni, nombres, correo, password, apePat, apeMat, telefono, 1, 0); 

        if (resultado > 0) {
            request.setAttribute("success", "Usuario registrado correctamente.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se pudo registrar el usuario. Verifica los datos.");
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }
    }

    public void validar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        String ipCliente = request.getHeader("X-Forwarded-For");

        if (ipCliente == null || ipCliente.isEmpty() || "unknown".equalsIgnoreCase(ipCliente)) {
            ipCliente = request.getRemoteAddr();
        }

        if ("0:0:0:0:0:0:0:1".equals(ipCliente)) {
            ipCliente = "127.0.0.1";
        }

       HttpSession sesion = request.getSession();
         /*Integer intentosFallidos = (Integer) sesion.getAttribute("intentosFallidos");

        // Si se han alcanzado los intentos máximos, bloquea el acceso
        if (intentosFallidos != null && intentosFallidos >= 3) {
            request.setAttribute("error", "Demasiados intentos fallidos. Por favor, intenta más tarde.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            return;
        }*/

         /*
         
        if (!validateRecaptcha(gRecaptchaResponse)) {
            request.setAttribute("error", "Captcha no válido. Intenta nuevamente.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            return;
        }
         */
        Usuario cli = new UsuarioDAO().authenticate(correo, password, ipCliente);

        if (cli != null && cli.getRol().getId() > 0) { // Si el usuario está autenticado
            sesion.setAttribute("userlog", cli.getRol().getId().toString());
            sesion.setAttribute("idUsuario", cli.getId());
            sesion.setAttribute("intentosFallidos", 0); // Reinicia el contador de intentos fallidos

            switch (cli.getRol().getId().toString()) {
                case "1":
                    response.sendRedirect(request.getContextPath() + "/admin?pagina=dashboard");
                    break;
                case "2":
                    response.sendRedirect(request.getContextPath() + "/vendedor?pagina=dashboard");
                    break;
                case "3":
                    response.sendRedirect(request.getContextPath() + "/transportista?pagina=dashboard");
                    break;
            }
        } else {
            // Incrementa el contador de intentos fallidos
          /*if (intentosFallidos == null) {
                intentosFallidos = 0;
            }
            intentosFallidos++;
            sesion.setAttribute("intentosFallidos", intentosFallidos);*/
            request.setAttribute("correo", correo);
            request.setAttribute("pass", password);
            if (cli == null) {
                request.setAttribute("error", "Credenciales incorrectas.");
            } else if (cli.getRol().getId() == -1) {
                request.setAttribute("error", "Credenciales incorrectas.");
            } else if (cli.getRol().getId() == -2) {
                request.setAttribute("error", "Credenciales incorrectas.");
            }else if (cli.getRol().getId() == -3) {
                request.setAttribute("error", "Acceso denegado. Demasiados intentos fallidos.");
            }
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        }
    }

    public void cerrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("userlog", null);
        session.invalidate();
        response.sendRedirect("/auth/login.jsp");
    }

    private boolean validateRecaptcha(String gRecaptchaResponse) throws IOException {
        String secretKey = "6Lege1QqAAAAACPiinSHE4qRGw4ASdfz1NCta6Bb"; // Reemplaza con tu clave secreta
        String url = "https://www.google.com/recaptcha/api/siteverify";

        String params = "secret=" + secretKey + "&response=" + gRecaptchaResponse;
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(params.getBytes());
            os.flush();
        }

        try (Scanner scanner = new Scanner(conn.getInputStream())) {
            String responseBody = scanner.useDelimiter("\\A").next();
            return responseBody.contains("\"success\": true");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.sendRedirect(request.getContextPath() + "/admin/index.jsp?pagina=dashboard");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for this route.");

    }
}
