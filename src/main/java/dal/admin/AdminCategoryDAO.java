package dal.admin;

import dal.DBContext;
import model.ProductCategory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminCategoryDAO {
    public List<ProductCategory> getAll() throws SQLException {
        List<ProductCategory> list = new ArrayList<>();
        String sql = "SELECT c.id, c.name, COUNT(p.id) AS product_count " +
                     "FROM product_category c " +
                     "LEFT JOIN product p ON c.id = p.category_id " +
                     "GROUP BY c.id, c.name";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductCategory category = new ProductCategory();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setProductCount(rs.getInt("product_count"));
                list.add(category);
            }
        }
        return list;
    }
}