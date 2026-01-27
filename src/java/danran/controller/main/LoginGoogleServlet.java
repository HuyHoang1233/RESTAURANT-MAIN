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

            // 2. Lấy thông tin User
            GoogleUser googleUser = GoogleUtils.getUserInfo(accessToken);

            if (googleUser != null) {
                String email = googleUser.getEmail();
                UserDAO dao = new UserDAO();
                User user = dao.getUserByEmail(email);

                // 3. Logic Đăng ký/Đăng nhập
                if (user == null) {
                    user = new User();
                    user.setEmail(email);
                    user.setUsername(email);
                    user.setFullName(googleUser.getName());
                    user.setPasswordHash("GOOGLE_LOGIN");
                    user.setRoleId(2);
                    user.setIsActive(true);

                    // Lưu ý: Hàm register cần trả về User hoặc ID để dùng tiếp
                    dao.register(user);

                    // Lấy lại user sau khi insert để đảm bảo có đầy đủ ID
                    user = dao.getUserByEmail(email);
                }

                // 4. Tạo Session
                HttpSession session = request.getSession();
                session.setAttribute("account", user);
                response.sendRedirect("home.jsp");
            } else {
                // Trường hợp có token nhưng không lấy được info
                response.sendRedirect("login.jsp?error=GoogleInfoEmpty");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xem log server để biết lỗi gì
            // Chuyển hướng về trang login kèm thông báo lỗi
            response.sendRedirect("login.jsp?error=GoogleLoginFailed");
        }
    }
}
