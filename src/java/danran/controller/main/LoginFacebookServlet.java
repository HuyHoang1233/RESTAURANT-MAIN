package danran.controller.main;

import danran.dao.UserDAO;
import danran.model.User;
import danran.util.FacebookUtils;
import danran.util.GoogleUser; // Dùng chung model với Google cho tiện
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginFacebookServlet", urlPatterns = {"/login-facebook"})
public class LoginFacebookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String accessToken = FacebookUtils.getToken(code);
            GoogleUser fbUser = FacebookUtils.getUserInfo(accessToken);

            if (fbUser != null) {
                String email = fbUser.getEmail();
                UserDAO dao = new UserDAO();
                User user = dao.getUserByEmail(email);

                if (user == null) {
                    // Tự động đăng ký nếu chưa có
                    user = new User();
                    user.setEmail(email);
                    user.setUsername(email);
                    user.setFullName(fbUser.getName());
                    user.setPasswordHash("FACEBOOK_LOGIN");
                    user.setRoleId(2);
                    user.setIsActive(true);

                    dao.register(user);
                    user = dao.getUserByEmail(email);
                }

                HttpSession session = request.getSession();
                session.setAttribute("account", user);
                response.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=FacebookLoginFailed");
        }
    }
}
