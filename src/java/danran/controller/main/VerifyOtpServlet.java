package danran.controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "VerifyOtpServlet", urlPatterns = {"/verify-otp"})
public class VerifyOtpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu ai đó cố tình truy cập link trực tiếp, chuyển họ về trang nhập mã
        request.getRequestDispatcher("verify-otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Lấy mã người dùng nhập từ form
            String userOtp = request.getParameter("otp");

            // 2. Lấy mã OTP thực tế đang lưu trong Session
            HttpSession session = request.getSession();
            String sessionOtp = (String) session.getAttribute("otp");
            Long otpTime = (Long) session.getAttribute("otpTime");

            // 3. Kiểm tra Session có còn tồn tại không
            // (Lỗi "Phiên giao dịch hết hạn" sinh ra ở đây nếu bạn Clean & Build lại)
            if (userOtp == null || sessionOtp == null || otpTime == null) {
                request.setAttribute("errorMessage", "Phiên giao dịch hết hạn hoặc mã không tồn tại. Vui lòng lấy mã mới.");
                request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
                return;
            }

            // 4. Kiểm tra thời gian hết hạn (Ví dụ: quá 5 phút)
            long currentTime = System.currentTimeMillis();
            if (currentTime - otpTime > 5 * 60 * 1000) { // 5 phút
                session.removeAttribute("otp"); // Xóa mã cũ
                request.setAttribute("errorMessage", "Mã OTP đã hết hạn! Vui lòng gửi lại mã mới.");
                request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
                return;
            }

            // 5. SO SÁNH MÃ
            if (userOtp.trim().equals(sessionOtp)) {

                // ✅ THÀNH CÔNG: Xóa OTP khỏi session để bảo mật
                session.removeAttribute("otp");
                session.removeAttribute("otpTime");

                // Chuyển sang trang đổi mật khẩu mới (Bạn cần có file reset-password.jsp)
                response.sendRedirect("reset-password.jsp");

            } else {
                // ❌ THẤT BẠI: Mã sai
                request.setAttribute("errorMessage", "Mã OTP không chính xác! Vui lòng thử lại.");
                request.getRequestDispatcher("verify-otp.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi hệ thống!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
        }
    }
}
