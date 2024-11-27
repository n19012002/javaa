
package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    private static final String[] PUBLIC_URLS = {
        "/login", 
        "/register",
        "/HomeServlet",
        "/css/",
        "/js/",
        "/images/",
        "/logout",
        "/products",
        "/product-detail",
        "/ProductServlet",
        "/DetailProductServlet",
        "/BlogServlet",
        "/postDetail"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
            
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        
        String url = req.getServletPath();
        
        // Kiểm tra URL có thuộc public không
        if (isPublicUrl(url)) {
            chain.doFilter(request, response);
            return;
        }

        // Kiểm tra session
        HttpSession session = req.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        // Kiểm tra quyền truy cập admin
        if (url.startsWith("/admin")) {
            if (user == null || !user.hasRole("ADMIN")) {
                resp.sendRedirect(req.getContextPath() + "/login?error=unauthorized");
                return;
            }
        }
        
        // Kiểm tra các trang yêu cầu đăng nhập
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login?next=" + url);
            return;
        }

        chain.doFilter(request, response);
    }

    private boolean isPublicUrl(String url) {
        for (String publicUrl : PUBLIC_URLS) {
            if (url.startsWith(publicUrl)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void destroy() {
    }
}