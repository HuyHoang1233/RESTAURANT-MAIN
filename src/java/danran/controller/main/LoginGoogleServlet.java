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
        String code = request.getParameter("code");

        // Nếu user hủy đăng nhập hoặc không có code
        if (code == null || code.isEmpty()) {
            response.sendRedirect("login.jsp?error=AccessDenied");
            return;
        }

        try {
            // 1. Lấy Access Token
            String accessToken = GoogleUtils.getToken(code);

            // 2. Lấy thông tin User từ Google
            GoogleUser googleUser = GoogleUtils.getUserInfo(accessToken);

            if (googleUser != null) {
                String email = googleUser.getEmail();
                UserDAO dao = new UserDAO();

                // Kiểm tra xem email này đã tồn tại trong DB chưa
                User user = dao.getUserByEmail(email);

                // 3. Logic Đăng ký (nếu chưa có) / Đăng nhập (nếu đã có)
                if (user == null) {
                    user = new User();
                    user.setEmail(email);
                    user.setUsername(email); // Lấy email làm username
                    user.setFullName(googleUser.getName());
                    user.setPasswordHash("GOOGLE_LOGIN"); // Mật khẩu giả định
                    user.setRoleId(2); // 2 là Role Khách hàng
                    user.setIsActive(true);

                    // Gọi hàm đăng ký
                    dao.register(user);

                    // Lấy lại thông tin user từ DB sau khi insert để có ID chính xác
                    user = dao.getUserByEmail(email);
                }

                // 4. Tạo Session và đăng nhập thành công
                HttpSession session = request.getSession();
                session.setAttribute("account", user);
                response.sendRedirect("home.jsp");
            } else {
                // Trường hợp có token nhưng không lấy được thông tin user
                response.sendRedirect("login.jsp?error=GoogleInfoEmpty");
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra log của Server để debug
            // Chuyển hướng về trang login kèm thông báo lỗi chung
            response.sendRedirect("login.jsp?error=GoogleLoginFailed");
        }
    
    }
}
