// controller/admin/AdminMenuServlet.java
package controller.admin;

import dal.admin.AdminMenuDAO;
import model.Menu;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/admin/menu/*")
public class AdminMenuServlet extends HttpServlet {
    private AdminMenuDAO menuDAO;

    public void init() {
        menuDAO = new AdminMenuDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        String action = uri.substring(uri.lastIndexOf("/"));
        
        try {
            switch (action) {
                case "/list":
                    listMenu(req, resp);
                    break;
                case "/add":
                    showAddForm(req, resp);
                    break;
                case "/edit":
                    showEditForm(req, resp);
                    break;
                case "/delete":
                    deleteMenu(req, resp);
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/admin/menu/list");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        String action = uri.substring(uri.lastIndexOf("/"));
        
        try {
            switch (action) {
                case "/add":
                    insertMenu(req, resp);
                    break;
                case "/edit":
                    updateMenu(req, resp);
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/admin/menu/list");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listMenu(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException {
        List<Menu> listMenu = menuDAO.getAll();
        Map<Integer, String> parentNames = new HashMap<>();
        
        for (Menu menu : listMenu) {
            parentNames.put(menu.getId(), menu.getName());
        }
        
        req.setAttribute("listMenu", listMenu);
        req.setAttribute("parentNames", parentNames);
        req.getRequestDispatcher("/views/admin/menu/list.jsp").forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException {
        List<Menu> parentMenus = menuDAO.getParentMenus();
        req.setAttribute("parentMenus", parentMenus);
        req.getRequestDispatcher("/views/admin/menu/form.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Menu menu = menuDAO.getById(id);
        
        List<Menu> parentMenus = menuDAO.getParentMenusExcept(id);
        
        parentMenus.removeIf(m -> m.getParentId() == id);
        
        req.setAttribute("menu", menu);
        req.setAttribute("parentMenus", parentMenus);
        req.getRequestDispatcher("/views/admin/menu/form.jsp").forward(req, resp);
    }

    private void insertMenu(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, IOException {
        Menu menu = new Menu();
        populateMenu(menu, req);
        menuDAO.insert(menu);
        resp.sendRedirect(req.getContextPath() + "/admin/menu/list");
    }

    private void updateMenu(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Menu menu = menuDAO.getById(id);
        populateMenu(menu, req);
        menuDAO.update(menu);
        resp.sendRedirect(req.getContextPath() + "/admin/menu/list");
    }

    private void deleteMenu(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        menuDAO.delete(id);
        resp.sendRedirect("list");
    }

    private void populateMenu(Menu menu, HttpServletRequest req) {
        menu.setName(req.getParameter("name"));
        menu.setUrl(req.getParameter("url"));
        String parentId = req.getParameter("parentId");
        menu.setParentId(parentId == null || parentId.isEmpty() ? 0 : Integer.parseInt(parentId));
        menu.setSortOrder(Integer.parseInt(req.getParameter("sortOrder")));
        menu.setActive(req.getParameter("isActive") != null);
    }
}