package danran.dao;

import danran.dal.DBContext;
import danran.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DBContext {

    // --- 1. XỬ LÝ ĐĂNG NHẬP ---
    public User login(String phone, String password) {
        // Lưu ý: Code này đang dùng cột 'password_hash'
        String sql = "SELECT u.*, r.role_name FROM Users u "
                + "JOIN Roles r ON u.role_id = r.role_id "
                + "WHERE u.phone_number = ? AND u.password_hash = ? AND u.is_active = 1";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, phone);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getInt("user_id"));
                    u.setRoleId(rs.getInt("role_id"));
                    u.setUsername(rs.getString("username"));
                    u.setFullName(rs.getString("full_name"));
                    u.setPhoneNumber(rs.getString("phone_number"));
                    u.setEmail(rs.getString("email"));
                    u.setIsActive(rs.getBoolean("is_active"));
                    u.setRoleName(rs.getString("role_name"));
                    return u;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    // --- 2. CÁC HÀM KIỂM TRA TỒN TẠI ---
    public boolean checkEmailExists(String email) {
        String sql = "SELECT user_id FROM Users WHERE email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean checkPhoneExists(String phoneNumber) {
        String sql = "SELECT user_id FROM Users WHERE phone_number = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, phoneNumber);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean checkUsernameExists(String username) {
        String sql = "SELECT user_id FROM Users WHERE username = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // --- 3. CẬP NHẬT MẬT KHẨU (Dùng cho Forgot Password) ---
    // ✅ Đã sửa lại code này để dùng connection có sẵn và đúng tên cột password_hash
    public boolean updatePassword(String email, String newPassword) {
        // QUAN TRỌNG: Tên cột phải là password_hash để khớp với hàm login bên trên
        String sql = "UPDATE Users SET password_hash = ? WHERE email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Nếu bạn có dùng mã hóa (MD5/SHA) thì nhớ mã hóa newPassword ở Controller trước khi truyền vào đây
            st.setString(1, newPassword);
            st.setString(2, email);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu update thành công
        } catch (SQLException ex) {
            System.err.println("Lỗi updatePassword: " + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    // --- 4. ĐĂNG KÝ ---
    public String register(User user) {
        if (connection == null) {
            return "Lỗi Kết Nối: DBContext chưa kết nối được SQL.";
        }
        String sql = "INSERT INTO Users (role_id, username, password_hash, full_name, phone_number, email, is_active) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, user.getRoleId());
            st.setString(2, user.getUsername());
            st.setString(3, user.getPasswordHash());
            st.setString(4, user.getFullName());
            st.setString(5, user.getPhoneNumber());
            st.setString(6, user.getEmail());
            st.setBoolean(7, user.isIsActive());
            int result = st.executeUpdate();
            return result > 0 ? "Success" : "Thất bại: Không thêm được dòng nào.";
        } catch (SQLException ex) {
            ex.printStackTrace();
            return "Lỗi SQL: " + ex.getMessage();
        }
    }

    // --- 5. LẤY THÔNG TIN USER BẰNG EMAIL (Dùng cho Google Login) ---
    public User getUserByEmail(String email) {
        String sql = "SELECT u.*, r.role_name FROM Users u "
                + "JOIN Roles r ON u.role_id = r.role_id "
                + "WHERE u.email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getInt("user_id"));
                    u.setRoleId(rs.getInt("role_id"));
                    u.setUsername(rs.getString("username"));
                    u.setFullName(rs.getString("full_name"));
                    u.setPhoneNumber(rs.getString("phone_number"));
                    u.setEmail(rs.getString("email"));
                    u.setIsActive(rs.getBoolean("is_active"));
                    u.setRoleName(rs.getString("role_name"));
                    return u;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy
    }
}
