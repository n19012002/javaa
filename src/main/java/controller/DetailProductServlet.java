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
import model.CommentProduct;
import model.Review;

@WebServlet("/DetailProductServlet")
public class DetailProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DetailProductServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        ProductDAO productDAO = new ProductDAO();
        try {
            Product product = productDAO.getProductById(Integer.parseInt(productId));
            if (product == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            String categoryName = productDAO.getCategoryNameById(product.getCategoryId());
            List<CommentProduct> comments = productDAO.getCommentsByProductId(product.getId());
            List<Review> reviews = productDAO.getReviewsByProductId(product.getId());

            request.setAttribute("product", product);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("comments", comments);
            request.setAttribute("reviews", reviews);
            request.getRequestDispatcher("/views/home/shops/detail.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}