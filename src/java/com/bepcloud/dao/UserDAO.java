package com.bepcloud.dao;

import com.bepcloud.dal.DBContext;
import com.bepcloud.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * UserDAO handles database operations for the Users table.
 */
public class UserDAO extends DBContext {

    /**
     * Authenticate user by phone number and password hash.
     * Note: In a real app, use BCrypt or similar for password hashing.
     */
    public User login(String phone, String password) {
        String sql = "SELECT u.*, r.role_name FROM Users u " +
                "JOIN Roles r ON u.role_id = r.role_id " +
                "WHERE u.phone_number = ? AND u.password_hash = ? AND u.is_active = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setRoleId(rs.getInt("role_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setPhoneNumber(rs.getString("phone_number"));
                u.setEmail(rs.getString("email"));
                u.setIsActive(rs.getBoolean("is_active"));
                u.setRoleName(rs.getString("role_name")); // Lấy role_name từ câu lệnh JOIN
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Register a new user in the database.
     */
    public boolean register(User user) {
        if (connection == null) {
            System.err.println("UserDAO Error: Connection is NULL. Please check DBContext credentials.");
            return false;
        }

        String sql = "INSERT INTO Users (role_id, username, password_hash, full_name, phone_number, email) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user.getRoleId());
            st.setString(2, user.getUsername());
            st.setString(3, user.getPasswordHash());
            st.setString(4, user.getFullName());
            st.setString(5, user.getPhoneNumber());
            st.setString(6, user.getEmail());

            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            // In lỗi chi tiết ra console của NetBeans/Tomcat
            System.err.println("UserDAO Register Error: " + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
}
