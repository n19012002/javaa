package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO {
    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT c.id, c.name, COUNT(p.id) AS post_count " +
                       "FROM category c LEFT JOIN post p ON c.id = p.category_id " +
                       "GROUP BY c.id, c.name";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setPostCount(rs.getInt("post_count"));
                categories.add(category);
            }
        }
        return categories;
    }
}