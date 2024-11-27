package dal.admin;

import dal.DBContext;
import model.Color;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminColorDAO {
    public List<Color> getAll() throws SQLException {
        List<Color> list = new ArrayList<>();
        String sql = "SELECT * FROM color";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Color color = new Color();
                color.setId(rs.getInt("id"));
                color.setName(rs.getString("name"));
                list.add(color);
            }
        }
        return list;
    }
}