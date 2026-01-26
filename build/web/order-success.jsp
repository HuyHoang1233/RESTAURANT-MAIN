<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đặt hàng thành công - Danran</title>
            <script src="https://cdn.tailwindcss.com"></script>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
                rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
                rel="stylesheet" />
            <style>
                body {
                    font-family: 'Inter', sans-serif;
                }
            </style>
        </head>

        <body class="bg-gray-50 flex items-center justify-center min-h-screen p-4">
            <div class="bg-white p-8 rounded-3xl shadow-xl w-full max-w-md text-center">
                <div class="w-20 h-20 bg-green-100 text-green-500 rounded-full flex items-center justify-center mx-auto mb-6">
                    <span class="material-symbols-outlined text-4xl">check_circle</span>
                </div>

                <h1 class="text-2xl font-black text-gray-900 mb-2">Đặt hàng thành công!</h1>
                <p class="text-gray-500 mb-6">Cảm ơn bạn đã đặt món tại Danran. Đơn hàng của bạn đang được chuẩn bị.</p>

                <div class="bg-gray-50 p-4 rounded-xl mb-6">
                    <p class="text-sm text-gray-500 mb-1">Tổng thanh toán</p>
                    <p class="text-xl font-bold text-primary">
                        <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
                    </p>
                </div>

                <a href="${pageContext.request.contextPath}/home"
                class="block w-full bg-[#ff6a00] hover:bg-[#e65f00] text-white font-bold py-3.5 rounded-xl transition-all shadow-lg shadow-[#ff6a00]/20">
                    Tiếp tục mua sắm
                </a>
            </div>
        </body>

        </html>