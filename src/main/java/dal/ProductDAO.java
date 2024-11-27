package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Review;
import model.CommentProduct;

public class ProductDAO {
    public List<Product> getProducts(int page, int pageSize) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product LIMIT ?, ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);
            try (ResultSet rs = ps.executeQuery()) {
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
                    products.add(product);
                }
            }
        }
        return products;
    }

    public int getTotalProducts() throws SQLException {
        String query = "SELECT COUNT(*) FROM product";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public List<Product> getProductsByFilter(String categoryId, String brandId, String minPrice, String maxPrice, int page, int pageSize) throws SQLException {
        List<Product> products = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT * FROM product WHERE 1=1");

        if (categoryId != null && !categoryId.isEmpty()) {
            query.append(" AND category_id = ?");
        }
        if (brandId != null && !brandId.isEmpty()) {
            query.append(" AND brand_id = ?");
        }
        if (minPrice != null && !minPrice.isEmpty()) {
            query.append(" AND price >= ?");
        }
        if (maxPrice != null && !maxPrice.isEmpty()) {
            query.append(" AND price <= ?");
        }
        query.append(" LIMIT ?, ?");

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;
            if (categoryId != null && !categoryId.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(categoryId));
            }
            if (brandId != null && !brandId.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(brandId));
            }
            if (minPrice != null && !minPrice.isEmpty()) {
                ps.setDouble(paramIndex++, Double.parseDouble(minPrice));
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                ps.setDouble(paramIndex++, Double.parseDouble(maxPrice));
            }
            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex++, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
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
                    products.add(product);
                }
            }
        }
        return products;
    }

    public int getTotalProductsByFilter(String categoryId, String brandId, String minPrice, String maxPrice) throws SQLException {
        StringBuilder query = new StringBuilder("SELECT COUNT(*) FROM product WHERE 1=1");

        if (categoryId != null && !categoryId.isEmpty()) {
            query.append(" AND category_id = ?");
        }
        if (brandId != null && !brandId.isEmpty()) {
            query.append(" AND brand_id = ?");
        }
        if (minPrice != null && !minPrice.isEmpty()) {
            query.append(" AND price >= ?");
        }
        if (maxPrice != null && !maxPrice.isEmpty()) {
            query.append(" AND price <= ?");
        }

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;
            if (categoryId != null && !categoryId.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(categoryId));
            }
            if (brandId != null && !brandId.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(brandId));
            }
            if (minPrice != null && !minPrice.isEmpty()) {
                ps.setDouble(paramIndex++, Double.parseDouble(minPrice));
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                ps.setDouble(paramIndex++, Double.parseDouble(maxPrice));
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
    public Product getProductById(int productId) throws SQLException {
        String query = "SELECT * FROM product WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
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
                    return product;
                }
            }
        }
        return null;
    }

    public List<Review> getReviewsByProductId(int productId) throws SQLException {
        List<Review> reviews = new ArrayList<>();
        String query = "SELECT * FROM review WHERE product_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getInt("id"));
                    review.setProductId(rs.getInt("product_id"));
                    review.setRating(rs.getInt("rating"));
                    review.setComment(rs.getString("comment"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    public List<CommentProduct> getCommentsByProductId(int productId) throws SQLException {
        List<CommentProduct> comments = new ArrayList<>();
        String query = "SELECT * FROM comment_product WHERE product_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CommentProduct comment = new CommentProduct();
                    comment.setId(rs.getInt("id"));
                    comment.setProductId(rs.getInt("product_id"));
                    comment.setAuthorName(rs.getString("author_name"));
                    comment.setContent(rs.getString("content"));
                    comment.setCreatedAt(rs.getTimestamp("created_at"));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

        public String getCategoryNameById(int categoryId) throws SQLException {
        String query = "SELECT name FROM product_category WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("name");
                }
            }
        }
        return null;
    }

    public List<Product> getLatestProducts(int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product ORDER BY created_at DESC LIMIT ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
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
                    products.add(product);
                }
            }
        }
        return products;
    }
}