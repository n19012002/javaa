// dal/UserDao.java
package dal;

import java.sql.*;
import model.User;
import dal.DBContext;


public class UserDao {
    public User checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT u.*, r.name as role_name FROM users u " +
                    "LEFT JOIN user_roles ur ON u.id = ur.user_id " +
                    "LEFT JOIN roles r ON ur.role_id = r.id " +
                    "WHERE u.username = ? AND u.password = ? AND u.status = 1";
                    
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ps.setString(2, password); 
            ResultSet rs = ps.executeQuery();
            
            User user = null;
            while (rs.next()) {
                if (user == null) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setEmail(rs.getString("email"));
                    user.setFullname(rs.getString("fullname"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                    user.setStatus(rs.getBoolean("status"));
                }
                String roleName = rs.getString("role_name");
                if (roleName != null) {
                    user.getRoles().add(roleName);
                }
            }
            return user;
        }
    }

    // Thêm phương thức cập nhật thông tin người dùng
    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET fullname=?, email=?, phone=?, address=? WHERE id=?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getId());
            
            ps.executeUpdate();
        }
    }
    
    // Thêm phương thức cập nhật mật khẩu
    public void updatePassword(User user) throws SQLException {
        String sql = "UPDATE users SET password=? WHERE id=?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, user.getPassword());
            ps.setInt(2, user.getId());
            
            ps.executeUpdate();
        }
    }
    
    // Thêm phương thức lấy thông tin người dùng theo ID
    public User getUserById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id=?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getBoolean("status"));
                return user;
            }
        }
        return null;
    }
    
    // Kiểm tra username đã tồn tại
    public boolean checkUsernameExists(String username) throws SQLException {
        String query = "SELECT COUNT(*) FROM users WHERE username = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    // Kiểm tra email đã tồn tại
    public boolean checkEmailExists(String email) throws SQLException {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    // Đăng ký người dùng mới
    public boolean register(User user) throws SQLException {
        String insertUser = "INSERT INTO users (username, password, email, fullname, phone, address, status) " +
                          "VALUES (?, MD5(?), ?, ?, ?, ?, ?)";
        String insertUserRole = "INSERT INTO user_roles (user_id, role_id) VALUES (?, 2)"; // role_id = 2 là người dùng thường
        
        Connection conn = null;
        PreparedStatement psUser = null;
        PreparedStatement psRole = null;
        boolean success = false;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            // Thêm user
            psUser = conn.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS);
            psUser.setString(1, user.getUsername());
            psUser.setString(2, user.getPassword()); // MySQL sẽ tự mã hóa MD5
            psUser.setString(3, user.getEmail());
            psUser.setString(4, user.getFullname());
            psUser.setString(5, user.getPhone());
            psUser.setString(6, user.getAddress());
            psUser.setBoolean(7, user.isStatus());
            
            int affectedRows = psUser.executeUpdate();
            
            if (affectedRows > 0) {
                // Lấy id của user vừa thêm
                try (ResultSet generatedKeys = psUser.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int userId = generatedKeys.getInt(1);
                        
                        // Thêm user_role
                        psRole = conn.prepareStatement(insertUserRole);
                        psRole.setInt(1, userId);
                        psRole.executeUpdate();
                        
                        conn.commit();
                        success = true;
                    }
                }
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw e;
        } finally {
            if (psRole != null) {
                try {
                    psRole.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (psUser != null) {
                try {
                    psUser.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return success;
    }
}