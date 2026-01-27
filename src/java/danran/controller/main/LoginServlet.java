package danran.controller.main;

import danran.dao.UserDAO;
import danran.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If user is already logged in, redirect to home or dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getRoleId() == 1) {
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/home.jsp");
            }
            return;
        }

        // Forward to login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String phone = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        System.out.println("LoginServlet: Attempting to login with phone: " + phone);

        UserDAO dao = new UserDAO();
        User user = dao.login(phone, password);

        System.out.println("LoginServlet: DB Result for user: " + (user != null ? user.getUsername() : "NULL"));

        if (user != null) {
            // Login success
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // Fix: dashboard.jsp checks for "userPhone" to allow access
            session.setAttribute("userPhone", user.getPhoneNumber());
            session.setAttribute("roleId", user.getRoleId());

            session.setMaxInactiveInterval(60 * 60 * 24); // 24 hours

            // Redirect based on role
            if (user.getRoleId() == 1) { // Admin/Manager
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
            } else { // Customer/Employee
                response.sendRedirect(request.getContextPath() + "/home.jsp");
            }
        } else {
            // Login failed
            request.setAttribute("errorMessage", "Số điện thoại hoặc mật khẩu không chính xác!");
            request.setAttribute("phoneNumber", phone); // Keep input
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
