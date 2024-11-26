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

        httpResponse.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self' https://apis.google.com;");

        chain.doFilter(request, response);
    }
}
