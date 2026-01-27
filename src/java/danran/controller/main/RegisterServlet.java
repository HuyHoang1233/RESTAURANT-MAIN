package danran.controller.main;

import danran.dao.UserDAO;
import danran.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String fullName = trimToNull(request.getParameter("fullName"));
            String username = trimToNull(request.getParameter("username"));
            String phoneNumber = trimToNull(request.getParameter("phoneNumber"));
            String email = trimToNull(request.getParameter("email"));
            String password = request.getParameter("password");
            String roleIdRaw = trimToNull(request.getParameter("roleId"));

            // --- 1. VALIDATION CƠ BẢN ---
            if (fullName == null || username == null || phoneNumber == null || email == null || password == null) {
                request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (password.length() < 6) {
                request.setAttribute("errorMessage", "Mật khẩu phải có ít nhất 6 ký tự.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            int roleId = 3; // Default Customer
            try {
                if (roleIdRaw != null) {
                    roleId = Integer.parseInt(roleIdRaw);
                }
            } catch (NumberFormatException ignored) {
                roleId = 3;
            }

            UserDAO dao = new UserDAO();

            // --- 2. KIỂM TRA TRÙNG LẶP (Dữ liệu có sẵn) ---
            if (dao.checkEmailExists(email)) {
                request.setAttribute("errorMessage", "Email đã tồn tại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (dao.checkPhoneExists(phoneNumber)) {
                request.setAttribute("errorMessage", "SĐT đã tồn tại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (dao.checkUsernameExists(username)) {
                request.setAttribute("errorMessage", "Username đã tồn tại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // --- 3. TẠO MODEL USER ---
            User user = new User();
            user.setFullName(fullName);
            user.setUsername(username);
            user.setPhoneNumber(phoneNumber);
            user.setEmail(email);
            user.setPasswordHash(password);
            user.setRoleId(roleId);
            user.setIsActive(true);

            // --- 4. GỌI HÀM REGISTER VÀ HỨNG LỖI ---
            // Lưu ý: Cần đảm bảo hàm dao.register() trả về String (như hướng dẫn trước)
            // Nếu dao.register() của bạn vẫn trả về boolean, code này sẽ báo đỏ.
            String result = dao.register(user);

            if ("Success".equals(result)) {
                request.setAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
                request.setAttribute("phoneNumber", phoneNumber);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // QUAN TRỌNG: Hiện chính xác lỗi SQL ra màn hình
                request.setAttribute("errorMessage", result);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi hệ thống Servlet: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private static String trimToNull(String s) {
        if (s == null) {
            return null;
        }
        String t = s.trim();
        return t.isEmpty() ? null : t;
    }
}
