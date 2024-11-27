package controller.admin;

import dal.admin.AdminProductCategoryDAO;
import model.ProductCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/product-category/*")
public class AdminProductCategoryServlet extends HttpServlet {
    private AdminProductCategoryDAO categoryDAO = new AdminProductCategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        try {
            switch (action) {
                case "/list":
                    listCategories(request, response);
                    break;
                case "/add":
                    showAddForm(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/delete":
                    deleteCategory(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<ProductCategory> categories = categoryDAO.getAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/views/admin/product-category/list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/product-category/form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductCategory category = categoryDAO.getById(id);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/views/admin/product-category/form.jsp").forward(request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryDAO.delete(id);
        response.sendRedirect(request.getContextPath() + "/admin/product-category/list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        try {
            switch (action) {
                case "/add":
                    addCategory(request, response);
                    break;
                case "/edit":
                    updateCategory(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        ProductCategory category = new ProductCategory();
        category.setName(name);
        categoryDAO.insert(category);
        response.sendRedirect(request.getContextPath() + "/admin/product-category/list");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        ProductCategory category = new ProductCategory();
        category.setId(id);
        category.setName(name);
        categoryDAO.update(category);
        response.sendRedirect(request.getContextPath() + "/admin/product-category/list");
    }
}