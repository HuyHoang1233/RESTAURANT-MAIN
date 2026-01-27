package danran.controller.main;

import danran.dao.UserDAO;
import danran.model.User;
import danran.util.GoogleUser;
import danran.util.GoogleUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/login-google"})
public class LoginGoogleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Google trả về tham số "code"
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            // Nếu hủy đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 1. Lấy token
            String accessToken = GoogleUtils.getToken(code);
            // 2. Lấy thông tin người dùng
            GoogleUser googleUser = GoogleUtils.getUserInfo(accessToken);

            if (googleUser != null) {
                String email = googleUser.getEmail();
                UserDAO dao = new UserDAO();
                User user = dao.getUserByEmail(email); // Bạn cần viết thêm hàm này trong UserDAO

                // 3. Xử lý đăng nhập
                if (user == null) {
                    // Nếu chưa có tài khoản -> Tự động Đăng ký
                    user = new User();
                    user.setEmail(email);
                    user.setUsername(email); // Lấy email làm username tạm
                    user.setFullName(googleUser.getName());
                    user.setPasswordHash("GOOGLE_LOGIN"); // Mật khẩu giả
                    user.setRoleId(2); // Mặc định là Khách hàng
                    user.setIsActive(true);

                    dao.register(user); // Gọi hàm đăng ký có sẵn

                    // Lấy lại thông tin sau khi đăng ký để có UserID
                    user = dao.getUserByEmail(email);
                }

                // 4. Lưu vào Session
                HttpSession session = request.getSession();
                session.setAttribute("account", user); // Đặt tên attribute giống login thường
                response.sendRedirect("home.jsp"); // Chuyển về trang chủ

            } else {
                request.setAttribute("errorMessage", "Không lấy được thông tin từ Google!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=GoogleLoginFailed");
        }
    }
}
