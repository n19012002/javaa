package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import dal.PostDAO;
import model.Comment;
import model.Post;

@WebServlet("/postDetail")
public class PostDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PostDetailServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        PostDAO postDAO = new PostDAO();
        try {
            Post post = postDAO.getPostById(postId);
            List<Comment> comments = postDAO.getCommentsByPostId(postId);
            request.setAttribute("post", post);
            request.setAttribute("comments", comments);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/views/home/blogs/detail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}