package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Menu;

public class MenuDAO {
    public List<Menu> getAllMenus() throws SQLException {
        List<Menu> menus = new ArrayList<>();
        String query = "SELECT * FROM menu WHERE is_active = TRUE ORDER BY sort_order";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("id"));
                menu.setName(rs.getString("name"));
                menu.setUrl(rs.getString("url"));
                menu.setParentId(rs.getInt("parent_id"));
                menu.setSortOrder(rs.getInt("sort_order"));
                menu.setActive(rs.getBoolean("is_active"));
                menus.add(menu);
            }
        }
        return menus;
    }
}