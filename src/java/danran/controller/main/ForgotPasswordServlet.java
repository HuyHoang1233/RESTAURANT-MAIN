package danran.controller.main;

import danran.dao.UserDAO;
import danran.util.EmailUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgot-password"})
public class ForgotPasswordServlet extends HttpServlet {

    // 🔴 QUAN TRỌNG: Đổi thành FALSE để gửi mail thật!
    private static final boolean TESTING_MODE = false;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();

        // 1. Kiểm tra Email có tồn tại trong Database không
        if (dao.checkEmailExists(email)) {

            // 2. Tạo OTP ngẫu nhiên
            String otp = EmailUtils.getRandomOTP();

            // Nội dung email
            String subject = "Mã xác thực quên mật khẩu - Danran";
            String body = "<div style='padding: 20px; border: 1px solid #ccc; font-family: Arial, sans-serif;'>"
                    + "<h2 style='color: #333;'>Mã xác thực của bạn</h2>"
                    + "<p>Mã OTP của bạn là:</p>"
                    + "<h1 style='color: #ff6a00; letter-spacing: 5px; font-size: 32px;'>" + otp + "</h1>"
                    + "<p>Mã này sẽ hết hạn sau 5 phút.</p>"
                    + "</div>";

            boolean isSent;

            // 3. XỬ LÝ GỬI MÃ
            if (TESTING_MODE) {
                // Chế độ Test (Chỉ in ra console)
                System.out.println("👉 [TEST MODE] OTP: " + otp);
                isSent = true;
            } else {
                // --- CHẾ ĐỘ THẬT: Gửi qua mạng ---
                isSent = EmailUtils.sendEmail(email, subject, body);
            }

            // 4. Điều hướng
            if (isSent) {
                HttpSession session = request.getSession();
                session.setAttribute("otp", otp);
                session.setAttribute("email", email);
                session.setAttribute("otpTime", System.currentTimeMillis());

                request.setAttribute("successMessage", "Mã OTP đã được gửi đến email của bạn!");
                request.getRequestDispatcher("verify-otp.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Lỗi gửi mail! Vui lòng kiểm tra lại kết nối mạng hoặc Mật khẩu ứng dụng.");
                request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("errorMessage", "Email này chưa được đăng ký trong hệ thống.");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
        }
    }
}
