package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import dal.MenuDAO;
import model.Menu;

@WebFilter("/*")
public class MenuFilter implements Filter {

    public void init(FilterConfig fConfig) throws ServletException {
        // Initialization code, if needed
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        MenuDAO menuDAO = new MenuDAO();
        try {
            List<Menu> menus = menuDAO.getAllMenus();
            request.setAttribute("menus", menus);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        chain.doFilter(request, response);
    }

    public void destroy() {
        
    }
}