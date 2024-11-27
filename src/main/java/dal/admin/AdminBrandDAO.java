package dal.admin;

import dal.DBContext;
import model.Brand;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminBrandDAO {
    public List<Brand> getAll() throws SQLException {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT * FROM brand";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("id"));
                brand.setName(rs.getString("name"));
                list.add(brand);
            }
        }
        return list;
    }
}