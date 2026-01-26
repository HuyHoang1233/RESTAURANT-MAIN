<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác thực OTP - Danran</title>
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
            <h2 class="text-2xl font-black text-center mb-6 text-[#181410]">Nhập mã OTP</h2>
            <p class="text-gray-500 text-center mb-6 text-sm">Mã OTP 6 chữ số đã được gửi đến email của bạn.</p>

            <c:if test="${not empty errorMessage}">
                <div class="bg-red-50 text-red-500 p-3 rounded-xl text-sm mb-4 font-medium text-center">
                    ${errorMessage}
                </div>
            </c:if>

            <c:if test="${not empty successMessage}">
                <div class="bg-green-50 text-green-500 p-3 rounded-xl text-sm mb-4 font-medium text-center">
                    ${successMessage}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/verify-otp" method="POST" class="space-y-4">
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">Mã OTP</label>
                    <input type="text" name="otp" required maxlength="6" placeholder="000000"
                        class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-[#ff6a00] outline-none text-center text-2xl tracking-widest font-mono">
                </div>

                <button type="submit"
                    class="w-full bg-[#ff6a00] hover:bg-[#e65f00] text-white font-bold py-3 rounded-xl transition-all shadow-lg shadow-[#ff6a00]/20">
                    Xác thực
                </button>
            </form>

            <div class="mt-4 text-center">
                <form action="${pageContext.request.contextPath}/resend-otp" method="POST">
                    <p class="text-sm text-gray-500">Chưa nhận được mã?
                        <button type="submit"
                            class="text-[#ff6a00] font-bold hover:underline cursor-pointer bg-transparent border-none">
                            Gửi lại
                        </button>
                    </p>
                </form>
            </div>
        </div>
    </body>

    </html>