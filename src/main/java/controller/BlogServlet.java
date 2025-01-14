package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Post;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dal.PostDAO;

@WebServlet("/BlogServlet")
public class BlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 5;

    public BlogServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        PostDAO postDAO = new PostDAO();
        try {
            List<Post> allPosts = postDAO.getPosts(1, Integer.MAX_VALUE); 
            getServletContext().setAttribute("allPosts", allPosts);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        PostDAO postDAO = new PostDAO();
        try {
            List<Post> posts = postDAO.getPosts(page, PAGE_SIZE);
            int totalPosts = postDAO.getTotalPosts();
            int totalPages = (int) Math.ceil((double) totalPosts / PAGE_SIZE);

            request.setAttribute("posts", posts);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/views/home/blogs/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}