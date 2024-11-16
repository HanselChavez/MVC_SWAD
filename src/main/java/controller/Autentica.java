package controller;

import dao.ClienteDAO;
import dao.UsuarioDAO;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.CompletableFuture;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JWT.JWTUtils;
import javax.servlet.http.Cookie;
import model.Usuario;

@WebServlet(name = "Auth", urlPatterns = {"/auth", "/auth/"})
public class Autentica extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
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
        String apePat = request.getParameter("apellidos").split(" ")[0];
        String apeMat = request.getParameter("apellidos").split(" ")[1];
        String correo = request.getParameter("email");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        if (!validateRecaptcha(gRecaptchaResponse)) {
            request.setAttribute("error", "Captcha no válido. Intenta nuevamente.");
            guardarDatosEnRequest(request, dni, nombres, apePat + " " + apeMat, correo, telefono);
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
            return;
        }
        ClienteDAO usuario = new ClienteDAO();
        int resultado = usuario.createCliente(dni, nombres, correo, password, apePat, apeMat, telefono, 1);
        if (resultado > 0) {
            request.setAttribute("success", "Usuario registrado correctamente.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        } else if (resultado < 0) {
            request.setAttribute("error", "Correo ya registrado.");
            guardarDatosEnRequest(request, dni, nombres, apePat + " " + apeMat, correo, telefono);
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se pudo registrar el usuario. Verifica los datos.");
            guardarDatosEnRequest(request, dni, nombres, apePat + " " + apeMat, correo, telefono);
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }
    }

    private void guardarDatosEnRequest(HttpServletRequest request, String dni, String nombres, String apellidos, String correo, String telefono) {
        request.setAttribute("dni", dni);
        request.setAttribute("nombre", nombres);
        request.setAttribute("apellidos", apellidos);
        request.setAttribute("email", correo);
        request.setAttribute("telefono", telefono);
    }

    public CompletableFuture<String> obtenerIpPublicaAsync() {
        return CompletableFuture.supplyAsync(() -> {
            StringBuilder result = new StringBuilder();
            try {
                URL url = new URL("http://api.ipify.org");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        result.append(line);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return result.toString();
        });
    }

    public void validar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        String ipCliente = obtenerIpPublicaAsync().join();
        System.out.println("IPCLIENTE:  " + ipCliente);

        if (!validateRecaptcha(gRecaptchaResponse)) {
            request.setAttribute("error", "Captcha no válido. Intenta nuevamente.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            return;
        }

        Usuario cli = new UsuarioDAO().authenticate(correo, password, ipCliente);
        if (cli != null && cli.getRol().getId() >= 0) { // Usuario autenticado

            String token = JWTUtils.generateToken(correo);
            System.out.println(token);

            response.setHeader("Authorization", "Bearer " + token);
            if (getRedirectUrl(cli) != "/") {
                new UsuarioDAO().saveSession(cli.getId(), "Bearer " + token, ipCliente);
            }
            HttpSession sesion = request.getSession();
            sesion.setAttribute("Authorization", "Bearer " + token);
            sesion.setAttribute("userlog", cli.getRol().getId().toString());
            sesion.setAttribute("idUsuario", cli.getId());
            response.sendRedirect(getRedirectUrl(cli));

        } else {
            request.setAttribute("error", getErrorMessage(cli));
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        }
    }

    private String getRedirectUrl(Usuario cli) {
        switch (cli.getRol().getId().toString()) {
            case "1":
                return "/admin?pagina=dashboard";
            case "2":
                return "/vendedor?pagina=dashboard";
            case "3":
                return "/transportista?pagina=dashboard";
            default:
                return "/";
        }
    }

    private String getErrorMessage(Usuario cli) {
        if (cli == null || cli.getRol().getId() < 0) {
            return "Credenciales incorrectas.";
        }
        switch (cli.getRol().getId().intValue()) {
            case -1:
            case -2:
                return "Credenciales incorrectas.";
            case -3:
                return "Acceso denegado. Demasiados intentos fallidos.";
            default:
                return "Error desconocido.";
        }
    }

    public void cerrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("userlog", null);
        session.setAttribute("Authorization", null);
        session.setAttribute("idUsuario", null);
        session.invalidate();
        response.sendRedirect("/");
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for this route.");

    }
}
