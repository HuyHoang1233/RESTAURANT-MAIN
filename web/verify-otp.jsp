<%-- QUAN TRỌNG: Dòng này bắt buộc phải ở đầu tiên để hiển thị Tiếng Việt --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác thực OTP</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 16px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.05);
                text-align: center;
                width: 100%;
                max-width: 400px;
            }

            h2 {
                color: #333;
                font-weight: 700;
                margin-bottom: 10px;
            }

            p.subtitle {
                color: #666;
                font-size: 14px;
                margin-bottom: 30px;
            }

            .otp-input {
                width: 100%;
                padding: 15px;
                font-size: 24px;
                text-align: center;
                letter-spacing: 8px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                margin-bottom: 25px;
                box-sizing: border-box;
                transition: border-color 0.3s;
            }

            .otp-input:focus {
                border-color: #ff6b00;
                outline: none;
            }

            .btn-verify {
                width: 100%;
                padding: 15px;
                border: none;
                border-radius: 8px;
                background: linear-gradient(to right, #ff8c00, #ff6b00);
                color: white;
                font-size: 18px;
                font-weight: 600;
                cursor: pointer;
                transition: transform 0.2s, box-shadow 0.2s;
            }

            .btn-verify:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 107, 0, 0.3);
            }

            .resend-link {
                margin-top: 20px;
                font-size: 14px;
                color: #666;
            }

            .resend-link a {
                color: #ff6b00;
                text-decoration: none;
                font-weight: 600;
            }

            .resend-link a:hover {
                text-decoration: underline;
            }

            .error-msg {
                color: red;
                margin-bottom: 15px;
                font-weight: 500;
            }
            .success-msg {
                color: green;
                margin-bottom: 15px;
                font-weight: 500;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Nhập mã OTP</h2>
            <p class="subtitle">Vui lòng nhập mã 6 số đã được gửi đến bạn.</p>

            <%-- Hiển thị thông báo lỗi hoặc thành công từ Servlet --%>
            <c:if test="${not empty errorMessage}">
                <p class="error-msg">${errorMessage}</p>
            </c:if>
            <c:if test="${not empty successMessage}">
                <p class="success-msg">${successMessage}</p>
            </c:if>

            <form action="verify-otp" method="post">
                <input type="text" name="otp" class="otp-input" placeholder="000000" required maxlength="6" pattern="\d{6}" title="Vui lòng nhập 6 chữ số">
                <button type="submit" class="btn-verify">Xác thực</button>
            </form>

            <div class="resend-link">
                Chưa nhận được mã? <a href="forgot-password.jsp">Gửi lại</a>
            </div>

            <div class="resend-link" style="margin-top: 10px;">
                <a href="login.jsp" style="color: #999; font-weight: normal;">Quay lại đăng nhập</a>
            </div>
        </div>

    </body>
</html>