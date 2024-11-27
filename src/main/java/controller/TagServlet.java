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
import dal.TagDAO;
import model.Post;
import model.Tag;

@WebServlet("/tag")
public class TagServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 5;

    public TagServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tag ID is missing");
            return;
        }

        int tagId;
        try {
            tagId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Tag ID");
            return;
        }

        int page = 1;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid page number");
                return;
            }
        }

        PostDAO postDAO = new PostDAO();
        TagDAO tagDAO = new TagDAO();
        try {
            List<Post> posts = postDAO.getPostsByTag(tagId, page, PAGE_SIZE);
            int totalPosts = postDAO.getTotalPostsByTag(tagId);
            int totalPages = (int) Math.ceil((double) totalPosts / PAGE_SIZE);
            List<Tag> tags = tagDAO.getAllTags();

            request.setAttribute("posts", posts);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("tags", tags);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
            return;
        }
        request.getRequestDispatcher("/views/home/blogs/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}