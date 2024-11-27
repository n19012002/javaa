package dal.admin;

import dal.DBContext;
import model.ProductCategory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminProductCategoryDAO {
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

    public ProductCategory getById(int id) throws SQLException {
        String sql = "SELECT c.id, c.name, COUNT(p.id) AS product_count " +
                    "FROM product_category c " +
                    "LEFT JOIN product p ON c.id = p.category_id " +
                    "WHERE c.id = ? " +
                    "GROUP BY c.id, c.name";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ProductCategory category = new ProductCategory();
                    category.setId(rs.getInt("id"));
                    category.setName(rs.getString("name"));
                    category.setProductCount(rs.getInt("product_count"));
                    return category;
                }
            }
        }
        return null;
    }

    public void insert(ProductCategory category) throws SQLException {
        String sql = "INSERT INTO product_category (name) VALUES (?)";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getName());
            ps.executeUpdate();
        }
    }

    public void update(ProductCategory category) throws SQLException {
        String sql = "UPDATE product_category SET name = ? WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getName());
            ps.setInt(2, category.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        // Kiểm tra xem danh mục có sản phẩm không
        String checkSql = "SELECT COUNT(*) FROM product WHERE category_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement checkPs = conn.prepareStatement(checkSql)) {
            checkPs.setInt(1, id);
            try (ResultSet rs = checkPs.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    throw new SQLException("Không thể xóa danh mục này vì có sản phẩm đang sử dụng!");
                }
            }
        }

        // Nếu không có sản phẩm, thực hiện xóa
        String sql = "DELETE FROM product_category WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}