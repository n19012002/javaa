package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import dal.ProductDAO;
import model.Product;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 6;

    public ProductServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        int page = 1;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid page number");
                return;
            }
        }

        try {
            List<Product> products;
            int totalProducts;
            if (categoryId != null || brandId != null || minPrice != null || maxPrice != null) {
                products = productDAO.getProductsByFilter(categoryId, brandId, minPrice, maxPrice, page, PAGE_SIZE);
                totalProducts = productDAO.getTotalProductsByFilter(categoryId, brandId, minPrice, maxPrice);
            } else {
                products = productDAO.getProducts(page, PAGE_SIZE);
                totalProducts = productDAO.getTotalProducts();
            }
            int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);

            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("/views/home/shops/index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}