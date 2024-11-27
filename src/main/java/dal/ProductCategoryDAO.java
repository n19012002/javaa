package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ProductCategory;

public class ProductCategoryDAO {
    public List<ProductCategory> getAllCategoriesWithProductCount() throws SQLException {
        List<ProductCategory> categories = new ArrayList<>();
        String query = "SELECT c.id, c.name, COUNT(p.id) AS product_count " +
                       "FROM product_category c LEFT JOIN product p ON c.id = p.category_id " +
                       "GROUP BY c.id, c.name";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductCategory category = new ProductCategory();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setProductCount(rs.getInt("product_count"));
                categories.add(category);
            }
        }
        return categories;
    }
}