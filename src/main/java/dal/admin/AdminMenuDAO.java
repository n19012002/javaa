// dal/admin/AdminMenuDAO.java
package dal.admin;

import dal.DBContext;
import model.Menu;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminMenuDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public List<Menu> getAll() throws SQLException {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu ORDER BY sort_order";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("id"));
                menu.setName(rs.getString("name"));
                menu.setUrl(rs.getString("url"));
                menu.setParentId(rs.getInt("parent_id"));
                menu.setSortOrder(rs.getInt("sort_order"));
                menu.setActive(rs.getBoolean("is_active"));
                list.add(menu);
            }
        } finally {
            closeResources();
        }
        return list;
    }

    public Menu getById(int id) throws SQLException {
        String sql = "SELECT * FROM menu WHERE id = ?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("id"));
                menu.setName(rs.getString("name"));
                menu.setUrl(rs.getString("url"));
                menu.setParentId(rs.getInt("parent_id")); 
                menu.setSortOrder(rs.getInt("sort_order"));
                menu.setActive(rs.getBoolean("is_active"));
                return menu;
            }
        } finally {
            closeResources();
        }
        return null;
    }

    public void insert(Menu menu) throws SQLException {
        String sql = "INSERT INTO menu (name, url, parent_id, sort_order, is_active) VALUES (?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, menu.getName());
            ps.setString(2, menu.getUrl());
            ps.setInt(3, menu.getParentId());
            ps.setInt(4, menu.getSortOrder());
            ps.setBoolean(5, menu.isActive());
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public void update(Menu menu) throws SQLException {
        String sql = "UPDATE menu SET name=?, url=?, parent_id=?, sort_order=?, is_active=? WHERE id=?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, menu.getName());
            ps.setString(2, menu.getUrl());
            ps.setInt(3, menu.getParentId());
            ps.setInt(4, menu.getSortOrder());
            ps.setBoolean(5, menu.isActive());
            ps.setInt(6, menu.getId());
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM menu WHERE id = ?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    private void closeResources() {
        try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Menu> getParentMenus() throws SQLException {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu ORDER BY sort_order";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("id"));
                menu.setName(rs.getString("name"));
                menu.setUrl(rs.getString("url"));
                menu.setParentId(rs.getInt("parent_id"));
                menu.setSortOrder(rs.getInt("sort_order")); 
                menu.setActive(rs.getBoolean("is_active"));
                list.add(menu);
            }
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Menu> getParentMenusExcept(int menuId) throws SQLException {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE id != ? ORDER BY sort_order";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, menuId);
            rs = ps.executeQuery();
            while(rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("id"));
                menu.setName(rs.getString("name"));
                menu.setUrl(rs.getString("url"));
                menu.setParentId(rs.getInt("parent_id"));
                menu.setSortOrder(rs.getInt("sort_order")); 
                menu.setActive(rs.getBoolean("is_active"));
                list.add(menu);
            }
        } finally {
            closeResources();
        }
        return list;
    }
}