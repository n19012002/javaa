package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Comment;
import model.Post;

public class PostDAO {
    public List<Post> getPosts(int page, int pageSize) throws SQLException {
        List<Post> posts = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String query = "SELECT p.*, a.name AS author_name, c.name AS category_name FROM post p " +
                       "JOIN author a ON p.author_id = a.id " +
                       "JOIN category c ON p.category_id = c.id " +
                       "ORDER BY p.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setContent(rs.getString("content"));
                    post.setImage(rs.getString("image"));
                    post.setAuthorId(rs.getInt("author_id"));
                    post.setAuthorName(rs.getString("author_name"));
                    post.setCategoryId(rs.getInt("category_id"));
                    post.setCategoryName(rs.getString("category_name"));
                    post.setCreatedAt(rs.getTimestamp("created_at"));
                    post.setViews(rs.getInt("views"));
                    post.setCommentsCount(rs.getInt("comments_count"));
                    posts.add(post);
                }
            }
        }
        return posts;
    }

    public int getTotalPosts() throws SQLException {
        String query = "SELECT COUNT(*) FROM post";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public Post getPostById(int postId) throws SQLException {
        String query = "SELECT p.*, a.name AS author_name, c.name AS category_name FROM post p " +
                       "JOIN author a ON p.author_id = a.id " +
                       "JOIN category c ON p.category_id = c.id " +
                       "WHERE p.id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setContent(rs.getString("content"));
                    post.setImage(rs.getString("image"));
                    post.setAuthorId(rs.getInt("author_id"));
                    post.setAuthorName(rs.getString("author_name"));
                    post.setCategoryId(rs.getInt("category_id"));
                    post.setCategoryName(rs.getString("category_name"));
                    post.setCreatedAt(rs.getTimestamp("created_at"));
                    post.setViews(rs.getInt("views"));
                    post.setCommentsCount(rs.getInt("comments_count"));
                    return post;
                }
            }
        }
        return null;
    }

    public List<Comment> getCommentsByPostId(int postId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM comment WHERE post_id = ? ORDER BY created_at DESC";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment();
                    comment.setId(rs.getInt("id"));
                    comment.setPostId(rs.getInt("post_id"));
                    comment.setAuthorName(rs.getString("author_name"));
                    comment.setContent(rs.getString("content"));
                    comment.setCreatedAt(rs.getTimestamp("created_at"));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    public List<Post> getPostsByCategory(int categoryId, int page, int pageSize) throws SQLException {
        List<Post> posts = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String query = "SELECT p.*, a.name AS author_name, c.name AS category_name FROM post p " +
                       "JOIN author a ON p.author_id = a.id " +
                       "JOIN category c ON p.category_id = c.id " +
                       "WHERE p.category_id = ? " +
                       "ORDER BY p.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            ps.setInt(2, pageSize);
            ps.setInt(3, offset);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setContent(rs.getString("content"));
                    post.setImage(rs.getString("image"));
                    post.setAuthorId(rs.getInt("author_id"));
                    post.setAuthorName(rs.getString("author_name"));
                    post.setCategoryId(rs.getInt("category_id"));
                    post.setCategoryName(rs.getString("category_name"));
                    post.setCreatedAt(rs.getTimestamp("created_at"));
                    post.setViews(rs.getInt("views"));
                    post.setCommentsCount(rs.getInt("comments_count"));
                    posts.add(post);
                }
            }
        }
        return posts;
    }

    public List<Post> getPostsByTag(int tagId, int page, int pageSize) throws SQLException {
        List<Post> posts = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String query = "SELECT p.*, a.name AS author_name, c.name AS category_name FROM post p " +
                       "JOIN author a ON p.author_id = a.id " +
                       "JOIN category c ON p.category_id = c.id " +
                       "JOIN post_tag pt ON p.id = pt.post_id " +
                       "WHERE pt.tag_id = ? " +
                       "ORDER BY p.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, tagId);
            ps.setInt(2, pageSize);
            ps.setInt(3, offset);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setContent(rs.getString("content"));
                    post.setImage(rs.getString("image"));
                    post.setAuthorId(rs.getInt("author_id"));
                    post.setAuthorName(rs.getString("author_name"));
                    post.setCategoryId(rs.getInt("category_id"));
                    post.setCategoryName(rs.getString("category_name"));
                    post.setCreatedAt(rs.getTimestamp("created_at"));
                    post.setViews(rs.getInt("views"));
                    post.setCommentsCount(rs.getInt("comments_count"));
                    posts.add(post);
                }
            }
        }
        return posts;
    }
    public int getTotalPostsByTag(int tagId) throws SQLException {
    String query = "SELECT COUNT(*) FROM post p JOIN post_tag pt ON p.id = pt.post_id WHERE pt.tag_id = ?";
    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setInt(1, tagId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    }
    return 0;
}

    public int getTotalPostsByCategory(int categoryId) throws SQLException {
        String query = "SELECT COUNT(*) FROM post WHERE category_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
}