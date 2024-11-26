package Security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.FilterConfig;

@WebFilter(filterName = "CSPFilter", urlPatterns = {"/*"})
public class CSPFilter extends HttpFilter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Aquí estamos configurando las directivas CSP para permitir los scripts de los CDN necesarios
        String cspPolicy = "default-src 'self'; "
                + "script-src 'self' 'unsafe-inline' https://apis.google.com https://code.jquery.com https://cdn.datatables.net https://cdn.jsdelivr.net https://cdn.tailwindcss.com https://cdn.jsdelivr.net/npm/toastify-js https://www.google.com https://www.gstatic.com; "
                + "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://cdn.tailwindcss.com https://cdnjs.cloudflare.com https://fonts.googleapis.com https://cdn.datatables.net; "
                + "font-src 'self' https://cdnjs.cloudflare.com https://fonts.gstatic.com; "
                + "frame-src 'self' https://www.google.com https://www.gstatic.com; "
                + "img-src 'self' https://cdn.datatables.net;";
        
        
        
        
        httpResponse.setHeader("Content-Security-Policy", cspPolicy);

        // Continuar con el siguiente filtro o la respuesta
        chain.doFilter(request, response);
    }
}
