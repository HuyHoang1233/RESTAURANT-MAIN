package danran.controller.main;

import danran.dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/reset-password"})
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng sang trang JSP giao diện
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // 1. Kiểm tra session (tránh truy cập trái phép)
        if (email == null) {
            response.sendRedirect("forgot-password.jsp");
            return;
        }

        // 2. Kiểm tra mật khẩu nhập vào
        if (!newPass.equals(confirmPass)) {
            request.setAttribute("errorMessage", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            return;
        }

        // 3. Cập nhật vào Database
        UserDAO dao = new UserDAO();
        boolean isUpdated = dao.updatePassword(email, newPass);

        if (isUpdated) {
            // Xóa session để an toàn
            session.removeAttribute("email");
            session.removeAttribute("otp");

            // Chuyển về trang đăng nhập và báo thành công
            request.setAttribute("successMessage", "Đổi mật khẩu thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Lỗi hệ thống! Không thể đổi mật khẩu.");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }
}
