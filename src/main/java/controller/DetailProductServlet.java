package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import model.Product;
import model.Review;
import model.CommentProduct;
import dal.ProductDAO;
import dal.ReviewDAO;

@WebServlet("/DetailProductServlet")
public class DetailProductServlet extends HttpServlet {
    private ProductDAO productDAO;
    private ReviewDAO reviewDAO;
    
    public void init() {
        productDAO = new ProductDAO();
        reviewDAO = new ReviewDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String productId = request.getParameter("productId");
            if (productId == null || productId.isEmpty()) {
                response.sendRedirect("index.jsp");
                return;
            }

            int id = Integer.parseInt(productId);
            Product product = productDAO.getProductById(id);
            if (product == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            // Lấy thông tin cơ bản
            String categoryName = productDAO.getCategoryNameById(product.getCategoryId());
            List<CommentProduct> comments = productDAO.getCommentsByProductId(product.getId());
            
            // Lấy thông tin đánh giá
            List<Review> reviews = reviewDAO.getReviewsByProductId(id);
            double avgRating = reviewDAO.getAverageRating(id);
            int reviewCount = reviewDAO.getReviewCount(id);
            int[] ratingDistribution = reviewDAO.getRatingDistribution(id);

            // Set attributes
            request.setAttribute("product", product);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("comments", comments);
            request.setAttribute("reviews", reviews);
            request.setAttribute("avgRating", avgRating);
            request.setAttribute("reviewCount", reviewCount);
            request.setAttribute("ratingDistribution", ratingDistribution);

            // Forward to detail page
            request.getRequestDispatcher("/views/home/shops/detail.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}