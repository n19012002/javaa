package dal.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dal.DBContext;
import model.Product;

public class AdminProductDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAll() throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, pc.name as category_name, b.name as brand_name, cl.name as color_name " +
                    "FROM product p " +
                    "LEFT JOIN product_category pc ON p.category_id = pc.id " +
                    "LEFT JOIN brand b ON p.brand_id = b.id " +
                    "LEFT JOIN color cl ON p.color_id = cl.id " +
                    "ORDER BY p.id DESC";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscountPrice(rs.getDouble("discount_price"));
                product.setImage(rs.getString("image"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setBrandId(rs.getInt("brand_id"));
                product.setColorId(rs.getInt("color_id"));
                // Thêm thông tin phụ
                product.setCategoryName(rs.getString("category_name"));
                product.setBrandName(rs.getString("brand_name"));
                product.setColorName(rs.getString("color_name"));
                list.add(product);
            }
        } finally {
            closeResources();
        }
        return list;
    }

    public Product getById(int id) throws SQLException {
        String sql = "SELECT p.*, pc.name as category_name, b.name as brand_name, cl.name as color_name " +
                    "FROM product p " +
                    "LEFT JOIN product_category pc ON p.category_id = pc.id " +
                    "LEFT JOIN brand b ON p.brand_id = b.id " +
                    "LEFT JOIN color cl ON p.color_id = cl.id " +
                    "WHERE p.id = ?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscountPrice(rs.getDouble("discount_price"));
                product.setImage(rs.getString("image"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setBrandId(rs.getInt("brand_id"));
                product.setColorId(rs.getInt("color_id"));
                product.setCategoryName(rs.getString("category_name"));
                product.setBrandName(rs.getString("brand_name"));
                product.setColorName(rs.getString("color_name"));
                return product;
            }
        } finally {
            closeResources();
        }
        return null;
    }

    public void insert(Product product) throws SQLException {
        String sql = "INSERT INTO product (name, description, price, discount_price, image, category_id, brand_id, color_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setDouble(4, product.getDiscountPrice());
            ps.setString(5, product.getImage());
            ps.setInt(6, product.getCategoryId());
            ps.setInt(7, product.getBrandId());
            ps.setInt(8, product.getColorId());
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public void update(Product product) throws SQLException {
        String sql = "UPDATE product SET name=?, description=?, price=?, discount_price=?, " +
                    "image=?, category_id=?, brand_id=?, color_id=? WHERE id=?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setDouble(4, product.getDiscountPrice());
            ps.setString(5, product.getImage());
            ps.setInt(6, product.getCategoryId());
            ps.setInt(7, product.getBrandId());
            ps.setInt(8, product.getColorId());
            ps.setInt(9, product.getId());
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public void delete(int id) throws SQLException {
        // Xóa các bản ghi liên quan trong các bảng khác trước
        String[] relatedTables = {"cart_items", "order_details", "inventory", "review"};
        for (String table : relatedTables) {
            String sql = "DELETE FROM " + table + " WHERE product_id = ?";
            try {
                conn = DBContext.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
            } finally {
                closeResources();
            }
        }
        
        // Sau đó xóa sản phẩm
        String sql = "DELETE FROM product WHERE id = ?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public List<Product> search(String keyword) throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, b.name as brand_name, cl.name as color_name " +
                    "FROM product p " +
                    "LEFT JOIN category c ON p.category_id = c.id " +
                    "LEFT JOIN brand b ON p.brand_id = b.id " +
                    "LEFT JOIN color cl ON p.color_id = cl.id " +
                    "WHERE p.name LIKE ? OR p.description LIKE ? " +
                    "ORDER BY p.id DESC";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscountPrice(rs.getDouble("discount_price"));
                product.setImage(rs.getString("image"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setBrandId(rs.getInt("brand_id"));
                product.setColorId(rs.getInt("color_id"));
                product.setCategoryName(rs.getString("category_name"));
                product.setBrandName(rs.getString("brand_name"));
                product.setColorName(rs.getString("color_name"));
                list.add(product);
            }
        } finally {
            closeResources();
        }
        return list;
    }
}