<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Giỏ hàng - Danran</title>    
                <script src="https://cdn.tailwindcss.com"></script>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
                    rel="stylesheet">
                <link
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
                    rel="stylesheet" />
                <script>
                    tailwind.config = {
                        theme: {
                            extend: {
                                colors: {
                                    primary: '#ff6a00',
                                    'primary-hover': '#e65f00',
                                    secondary: '#181410',
                                    'background-light': '#F7FAFC',
                                },
                                fontFamily: {
                                    sans: ['Inter', 'sans-serif'],
                                },
                            }
                        }
                    }
                </script>
                <style>
                    .no-scrollbar::-webkit-scrollbar {
                        display: none;
                    }

                    .no-scrollbar {
                        -ms-overflow-style: none;
                        scrollbar-width: none;
                    }
                </style>
            </head>

            <body class="bg-gray-100 flex items-center justify-center min-h-screen p-0 sm:p-4">

                <!-- Mobile Frame -->
                <div
                    class="relative w-full max-w-[480px] h-screen sm:h-[90vh] bg-background-light shadow-2xl rounded-none sm:rounded-[2.5rem] overflow-hidden flex flex-col border-none sm:border sm:border-white/20 ring-0 sm:ring-8 ring-black/5">

                    <!-- Header -->
                    <header class="flex items-center justify-between px-5 py-4 bg-white shrink-0 z-10">
                        <a href="${pageContext.request.contextPath}/menu"
                            class="flex items-center justify-center w-10 h-10 rounded-full hover:bg-gray-100 transition-colors text-gray-800">
                            <span class="material-symbols-outlined text-2xl">arrow_back_ios_new</span>
                        </a>
                        <h1 class="text-xl font-bold text-gray-900">Giỏ hàng</h1>
                        <form action="cart" method="POST" style="display:inline;">
                            <input type="hidden" name="action" value="clear">
                            <button type="submit"
                                class="text-sm font-semibold text-gray-500 hover:text-primary transition-colors">
                                Xóa tất cả
                            </button>
                        </form>
                    </header>

                    <!-- Content -->
                    <main class="flex-1 overflow-y-auto no-scrollbar pb-32">
                        <!-- Simple Banner -->
                        <div class="bg-[#FFF6ED] px-5 py-3 mb-2 flex items-center gap-3">
                            <div class="w-8 h-8 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined text-primary text-lg">local_shipping</span>
                            </div>
                            <p class="text-primary text-sm font-bold leading-tight">
                                Miễn phí giao hàng cho mọi đơn hàng!
                            </p>
                        </div>

                        <!-- Items List -->
                        <div class="px-5 py-2 space-y-4">
                            <c:if test="${empty sessionScope.cart}">
                                <div class="py-10 text-center flex flex-col items-center">
                                    <span
                                        class="material-symbols-outlined text-6xl text-gray-300 mb-2">shopping_basket</span>
                                    <p class="text-gray-400 font-medium">Giỏ hàng của bạn đang trống</p>
                                </div>
                            </c:if>

                            <c:forEach var="item" items="${sessionScope.cart}">
                                <div class="flex gap-4 bg-white p-3 rounded-2xl shadow-sm border border-gray-100">
                                    <!-- Image -->
                                    <div class="w-20 h-20 rounded-xl overflow-hidden shrink-0">
                                        <img src="${item.imageUrl}" alt="${item.name}"
                                            class="w-full h-full object-cover">
                                    </div>

                                    <!-- Details -->
                                    <div class="flex-1 flex flex-col justify-between">
                                        <div class="flex justify-between items-start">
                                            <h3 class="font-bold text-gray-900 line-clamp-1 text-sm">${item.name}</h3>
                                            <form action="cart" method="POST">
                                                <input type="hidden" name="action" value="remove">
                                                <input type="hidden" name="id" value="${item.id}">
                                                <button type="submit" class="text-gray-400 hover:text-red-500">
                                                    <span class="material-symbols-outlined text-lg">close</span>
                                                </button>
                                            </form>
                                        </div>
                                        <p class="text-xs text-gray-500 line-clamp-1 mt-0.5">${item.description}</p>

                                        <div class="flex justify-between items-end mt-2">
                                            <span class="font-bold text-[#181410]">
                                                <fmt:formatNumber value="${item.price}" type="currency"
                                                    currencySymbol="đ" maxFractionDigits="0" />
                                            </span>

                                            <!-- Qty Control -->
                                            <div class="flex items-center gap-3 bg-gray-50 rounded-full px-2 py-1">
                                                <form action="cart" method="POST" style="display: flex;">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="id" value="${item.id}">
                                                    <input type="hidden" name="delta" value="-1">
                                                    <button type="submit"
                                                        class="w-6 h-6 rounded-full bg-white shadow flex items-center justify-center hover:bg-gray-100 text-gray-600">
                                                        <span
                                                            class="material-symbols-outlined text-sm font-bold">remove</span>
                                                    </button>
                                                </form>

                                                <span
                                                    class="text-sm font-bold text-gray-900 w-4 text-center">${item.quantity}</span>

                                                <form action="cart" method="POST" style="display: flex;">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="id" value="${item.id}">
                                                    <input type="hidden" name="delta" value="1">
                                                    <button type="submit"
                                                        class="w-6 h-6 rounded-full bg-primary text-white shadow flex items-center justify-center hover:bg-primary-hover">
                                                        <span
                                                            class="material-symbols-outlined text-sm font-bold">add</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Upsell -->
                        <div class="mt-6 pl-5 pb-6">
                            <div class="flex items-center gap-2 mb-3 pr-5">
                                <span class="material-symbols-outlined text-primary text-xl">recommend</span>
                                <h3 class="text-gray-900 text-lg font-bold">Bạn có muốn thêm?</h3>
                            </div>
                            <div class="flex gap-3 overflow-x-auto no-scrollbar pb-2 pr-5">
                                <c:forEach var="uItem" items="${upsellItems}">
                                    <div
                                        class="min-w-[140px] bg-white p-3 rounded-2xl shadow-sm border border-gray-100 flex flex-col">
                                        <div class="w-full h-24 rounded-xl overflow-hidden mb-3 relative group">
                                            <img src="${uItem.imageUrl}"
                                                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                                            <form action="cart" method="POST" class="absolute bottom-2 right-2">
                                                <input type="hidden" name="action" value="addUpsell">
                                                <input type="hidden" name="upsellId" value="${uItem.id}">
                                                <button type="submit"
                                                    class="w-8 h-8 rounded-full bg-white/90 backdrop-blur text-primary hover:bg-primary hover:text-white shadow-lg flex items-center justify-center transition-all">
                                                    <span class="material-symbols-outlined text-lg font-bold">add</span>
                                                </button>
                                            </form>
                                        </div>
                                        <h4 class="text-sm font-bold text-gray-900 line-clamp-1 mb-1">${uItem.name}</h4>
                                        <p class="text-xs font-bold text-primary">
                                            <fmt:formatNumber value="${uItem.price}" type="currency" currencySymbol="đ"
                                                maxFractionDigits="0" />
                                        </p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Summary Breakdown -->
                        <div class="bg-white mx-5 p-5 rounded-2xl mb-8 space-y-3 shadow-sm border border-gray-100">
                            <div class="flex justify-between items-center text-sm">
                                <span class="text-gray-500">Tạm tính</span>
                                <span class="text-gray-900 font-medium">
                                    <fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </span>
                            </div>
                            <div class="flex justify-between items-center text-sm">
                                <span class="text-gray-500">Phí giao hàng</span>
                                <span class="text-gray-900 font-medium">Miễn phí</span>
                            </div>

                            <!-- Voucher Section -->
                            <div class="py-2">
                                <c:choose>
                                    <c:when test="${voucherDiscount > 0}">
                                        <div class="flex justify-between items-center text-sm mb-2">
                                            <span class="text-gray-500">Voucher</span>
                                            <span class="text-primary font-medium">-
                                                <fmt:formatNumber value="${voucherDiscount}" type="currency"
                                                    currencySymbol="đ" maxFractionDigits="0" />
                                            </span>
                                        </div>
                                        <div
                                            class="flex items-center gap-2 bg-green-50 px-3 py-2 rounded-xl border border-green-100">
                                            <span
                                                class="material-symbols-outlined text-green-600 text-lg">check_circle</span>
                                            <span class="text-xs font-bold text-green-700 flex-1">Đã dùng:
                                                ${sessionScope.voucherCode}</span>
                                            <form action="cart" method="POST">
                                                <input type="hidden" name="action" value="removeVoucher">
                                                <button type="submit" class="text-gray-400 hover:text-red-500">
                                                    <span class="material-symbols-outlined text-base">close</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="cart" method="POST" class="flex gap-2">
                                            <input type="hidden" name="action" value="applyVoucher">
                                            <input type="text" name="voucherCode" placeholder="Mã giảm giá (DANRAN2024)"
                                                class="flex-1 bg-gray-50 border border-gray-200 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-primary/50">
                                            <button type="submit"
                                                class="bg-secondary text-white px-4 py-2 rounded-xl text-xs font-bold hover:bg-primary transition-colors">
                                                Áp dụng
                                            </button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="border-b border-dashed border-gray-200 pt-1"></div>
                            <div class="flex justify-between items-center pt-1">
                                <span class="text-gray-900 font-bold text-base">Tổng thanh toán</span>
                                <span class="text-primary font-bold text-xl">
                                    <fmt:formatNumber value="${total}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </span>
                            </div>
                        </div>
                    </main>

                    <!-- Footer -->
                    <footer
                        class="absolute bottom-0 w-full bg-white/80 backdrop-blur-md border-t border-gray-100 p-5 pb-8 z-50">
                        <div class="flex items-center justify-between gap-4">
                            <div class="flex flex-col">
                                <span class="text-xs text-gray-500 font-medium">Tổng cộng</span>
                                <span class="text-gray-900 text-xl font-bold leading-tight">
                                    <fmt:formatNumber value="${total}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </span>
                            </div>
                            <form action="checkout" method="POST" class="flex-1 flex">
                                <button type="submit"
                                    class="flex-1 font-bold text-base py-3.5 px-6 rounded-full shadow-lg transition-all flex items-center justify-center gap-2 active:scale-[0.98] ${not empty sessionScope.cart ? 'bg-primary text-white shadow-primary/30 hover:bg-primary/90' : 'bg-gray-200 text-gray-400 cursor-not-allowed'}"
                                    ${empty sessionScope.cart ? 'disabled' : '' }>
                                    <span>Đặt món</span>
                                    <span class="material-symbols-outlined text-lg">arrow_forward</span>
                                </button>
                            </form>
                        </div>
                        <!-- iOS Home Indicator -->
                        <div class="w-full h-1 mt-4 flex justify-center">
                            <div class="w-1/3 h-1.5 bg-gray-200 rounded-full"></div>
                        </div>
                    </footer>

                </div>
            </body>

            </html>