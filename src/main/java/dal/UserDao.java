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
}