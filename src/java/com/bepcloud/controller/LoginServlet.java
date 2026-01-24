package com.bepcloud.controller;

import com.bepcloud.dao.UserDAO;
import com.bepcloud.model.User;
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
        // Nếu người dùng truy cập trực tiếp bằng link /login, chuyển về trang login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form login.jsp
        
        String phone = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        // Logic using UserDAO
        UserDAO dao = new UserDAO();
        User user = dao.login(phone, password);

        if (user != null) {
            // Đăng nhập thành công
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userPhone", user.getPhoneNumber());

            // Phân quyền chuyển hướng dựa trên role_id
            if (user.getRoleId() == 1) {
                // Nếu là Chủ quán (Admin) -> qua trang Dashboard
                response.sendRedirect("dashboard.jsp");
            } else if (user.getRoleId() == 3) {
                // Nếu là Khách hàng (Customer) -> qua trang Home (HomeServlet)
                response.sendRedirect("home");
            } else {
                // Các role khác (ví dụ Staff) tạm thời cho về home hoặc dashboard tùy ý
                response.sendRedirect("home");
            }
        } else {
            // Đăng nhập thất bại
            request.setAttribute("errorMessage", "Số điện thoại hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
