package Security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JWT.JWTUtils;
import dao.UsuarioDAO;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "SecurityFilter", urlPatterns = {"/admin", "/vendedor", "/transportista"})
public class SecurityFilter extends HttpFilter {

    private JWTUtils JWTtUt = new JWTUtils();

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpSession sesion = req.getSession();
        String requestURI = req.getRequestURI();

        if (requestURI.equals("/auth/login")) {
            chain.doFilter(req, res);
            return;
        }

        try {
            String authorization = sesion.getAttribute("Authorization").toString();
            String idUser = sesion.getAttribute("idUsuario").toString();

            if (authorization == null || idUser == null) {
                res.sendRedirect("/auth/error401.jsp");
                return;
            }

            String dbtoken = new UsuarioDAO().getSession(idUser);
            System.out.println("AUTHORIZATION: " + authorization);
            System.out.println("DBTOKEN: " + dbtoken);

            if (!"".equals(dbtoken)) {
                if (!dbtoken.equals(authorization)) {
                    sesion.invalidate();
                    res.sendRedirect("/auth/session-invalid.jsp");
                    return;
                }
            }

            if (authorization.startsWith("Bearer ")) {
                String token = authorization.substring(7).trim();

                if (JWTtUt.validateToken(token)) {
                    chain.doFilter(req, res);
                    return;
                } else {
                    sesion.invalidate();
                    res.sendRedirect("/auth/session-invalid.jsp");
                    return;
                }
            }

            res.sendRedirect("/auth/session-invalid.jsp");

        } catch (NullPointerException e) {
            res.sendRedirect("/auth/error401.jsp");
        }
    }
}
