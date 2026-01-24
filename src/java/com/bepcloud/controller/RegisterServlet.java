package com.bepcloud.controller;

import com.bepcloud.dao.UserDAO;
import com.bepcloud.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form register.jsp
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String phone = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Lấy role_id từ form (1: Chủ quán, 2: Khách hàng)
        int roleId = 2; // Mặc định là khách hàng nếu có lỗi
        try {
            roleId = Integer.parseInt(request.getParameter("roleId"));
        } catch (NumberFormatException e) {
            // Log error or handle as needed
        }

        // Tạo đối tượng User với roleId đã chọn
        User user = new User(roleId, username, password, fullName, phone, email);

        UserDAO dao = new UserDAO();
        boolean isSuccess = dao.register(user);

        if (isSuccess) {
            request.setAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Số điện thoại hoặc tên đăng nhập đã tồn tại!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
