<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý đơn hàng - Admin</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>

    <body class="bg-gray-50 min-h-screen">

        <div class="max-w-6xl mx-auto p-6">
            <header class="flex justify-between items-center mb-8">
                <h1 class="text-3xl font-black text-gray-900">Quản lý đơn hàng</h1>
                <a href="${pageContext.request.contextPath}/dashboard.jsp"
                   class="text-sm font-bold text-gray-500 hover:text-primary">
                    Quay lại Dashboard
                </a>
            </header>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Order List -->
                <div class="lg:col-span-2 space-y-4">
                    <c:if test="${empty orders}">
                        <div class="bg-white p-10 rounded-2xl text-center text-gray-400">
                            Chưa có đơn hàng nào.
                        </div>
                    </c:if>

                    <c:forEach var="o" items="${orders}">
                        <a href="?id=${o.orderId}"
                           class="block bg-white p-5 rounded-2xl shadow-sm border border-gray-100 hover:border-primary/50 transition-all ${selectedOrderId == o.orderId ? 'ring-2 ring-primary' : ''}">
                            <div class="flex justify-between items-start mb-2">
                                <div>
                                    <span
                                        class="bg-primary/10 text-primary px-2 py-1 rounded-lg text-xs font-bold">#${o.orderId}</span>
                                    <span class="ml-2 font-bold text-gray-900">${o.customerName}</span>
                                </div>
                                <span class="text-sm text-gray-400">
                                    <fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                </span>
                            </div>
                            <div class="flex justify-between items-center">
                                <span class="text-sm font-medium text-gray-500">${o.status}</span>
                                <span class="text-lg font-bold text-[#181410]">
                                    <fmt:formatNumber value="${o.totalAmount}" type="currency"
                                                      currencySymbol="đ" maxFractionDigits="0" />
                                </span>
                            </div>
                        </a>
                    </c:forEach>
                </div>

                <!-- Order Details Panel -->
                <div class="lg:col-span-1">
                    <div class="bg-white p-6 rounded-2xl shadow-lg sticky top-6">
                        <c:choose>
                            <c:when test="${not empty selectedOrderDetails}">
                                <h2 class="text-xl font-bold text-gray-900 mb-4">Chi tiết đơn
                                    #${selectedOrderId}</h2>
                                <div class="space-y-4 max-h-[60vh] overflow-y-auto pr-2">
                                    <c:forEach var="d" items="${selectedOrderDetails}">
                                        <div class="flex gap-3">
                                            <div class="w-12 h-12 rounded-lg bg-gray-100 overflow-hidden shrink-0">
                                                <img src="${d.imageUrl}" class="w-full h-full object-cover">
                                            </div>
                                            <div class="flex-1">
                                                <p class="text-sm font-bold text-gray-900 text-sm line-clamp-2">
                                                    ${d.productName}</p>
                                                <div class="flex justify-between text-xs mt-1">
                                                    <span class="text-gray-500">x${d.quantity}</span>
                                                    <span class="font-medium">
                                                        <fmt:formatNumber value="${d.totalPrice}"
                                                                          type="currency" currencySymbol="đ"
                                                                          maxFractionDigits="0" />
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Action Buttons Placeholders -->
                                <div class="mt-6 pt-4 border-t border-gray-100 flex gap-2">
                                    <button class="flex-1 bg-green-500 text-white font-bold py-2 rounded-xl text-sm">
                                        Hoàn thành</button>
                                    <button class="flex-1 bg-red-100 text-red-500 font-bold py-2 rounded-xl text-sm">Hủy</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-10 text-gray-400">
                                    <p>Chọn một đơn hàng để xem chi tiết</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>