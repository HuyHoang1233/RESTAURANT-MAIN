<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên mật khẩu - Danran</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>

    <body class="bg-gray-50 flex items-center justify-center min-h-screen p-4">
        <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-md">
            <h2 class="text-2xl font-black text-center mb-6 text-[#181410]">Quên mật khẩu</h2>
            <p class="text-gray-500 text-center mb-6 text-sm">Nhập email đăng ký của bạn để nhận mã OTP.</p>

            <c:if test="${not empty errorMessage}">
                <div class="bg-red-50 text-red-500 p-3 rounded-xl text-sm mb-4 font-medium text-center">
                    ${errorMessage}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/forgot-password" method="POST" class="space-y-4">
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">Email</label>
                    <input type="email" name="email" required placeholder="example@email.com"
                      class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-[#ff6a00] outline-none">
                </div>

                <button type="submit"
                    class="w-full bg-[#ff6a00] hover:bg-[#e65f00] text-white font-bold py-3 rounded-xl transition-all shadow-lg shadow-[#ff6a00]/20">
                    Gửi mã OTP
                </button>
            </form>

            <div class="mt-6 text-center">
                <a href="${pageContext.request.contextPath}/login.jsp"
                   class="text-sm font-bold text-gray-400 hover:text-[#ff6a00]">Quay lại đăng nhập</a>
            </div>
        </div>
    </body>

</html>