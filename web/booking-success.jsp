<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt bàn thành công - Danran</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
            rel="stylesheet" />

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: '#ff6a00',
                            secondary: '#181410',
                        },
                        fontFamily: {
                            sans: ['Inter', 'sans-serif'],
                        },
                    }
                }
            }
        </script>

        <style>
            .material-symbols-outlined.filled {
                font-variation-settings: 'FILL' 1;
            }

            @keyframes checkmark {
                0% { transform: scale(0); opacity: 0; }
                50% { transform: scale(1.2); }
                100% { transform: scale(1); opacity: 1; }
            }

            .animate-checkmark {
                animation: checkmark 0.5s ease-out forwards;
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-fade-in-up {
                animation: fadeInUp 0.5s ease-out forwards;
            }

            .delay-1 {
                animation-delay: 0.2s;
                opacity: 0;
            }

            .delay-2 {
                animation-delay: 0.4s;
                opacity: 0;
            }

            .delay-3 {
                animation-delay: 0.6s;
                opacity: 0;
            }
        </style>
    </head>

    <body class="bg-gray-50 font-sans text-secondary min-h-screen flex flex-col">

        <main class="flex-1 flex items-center justify-center p-4">
            <div class="max-w-md w-full">

                <!-- Success Icon -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center size-24 bg-green-100 rounded-full mb-4 animate-checkmark">
                        <span class="material-symbols-outlined filled text-green-500 text-[60px]">check_circle</span>
                    </div>
                    <h1 class="text-2xl font-black text-secondary animate-fade-in-up delay-1">Đặt bàn thành công!
                    </h1>
                    <p class="text-gray-500 mt-2 animate-fade-in-up delay-1">Chúng tôi đã ghi nhận yêu cầu của bạn
                    </p>
                </div>

                <!-- Booking Card -->
                <div class="bg-white rounded-3xl shadow-xl overflow-hidden animate-fade-in-up delay-2">
                    <!-- Header -->
                    <div class="bg-gradient-to-r from-primary to-orange-500 p-6 text-white text-center">
                        <p class="text-sm opacity-80 mb-1">Mã đặt bàn của bạn</p>
                        <p class="text-3xl font-black tracking-widest">${bookingCode}</p>
                    </div>

                    <!-- QR Code -->
                    <div class="p-6 border-b border-dashed border-gray-200 flex justify-center">
                        <div class="bg-white p-4 rounded-xl shadow-inner border-2 border-gray-100">
                            <!-- Placeholder QR - In production use actual QR library -->
                            <div class="size-32 bg-gray-100 rounded-lg flex items-center justify-center">
                                <img src="https://api.qrserver.com/v1/create-qr-code/?size=120x120&data=${bookingCode}"
                                     alt="QR Code" class="rounded">
                            </div>
                        </div>
                    </div>

                    <!-- Details -->
                    <div class="p-6 space-y-4">
                        <div class="flex items-center gap-4">
                            <div class="size-10 bg-primary/10 rounded-xl flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined text-primary text-[20px]">location_on</span>
                            </div>
                            <div>
                                <p class="text-xs text-gray-400">Chi nhánh</p>
                                <p class="font-semibold">Danran - ${branch eq 'quan1' ? 'Quận 1' : 'Quận 3'}</p>
                            </div>
                        </div>

                        <div class="flex items-center gap-4">
                            <div class="size-10 bg-primary/10 rounded-xl flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined text-primary text-[20px]">group</span>
                            </div>
                            <div>
                                <p class="text-xs text-gray-400">Số khách</p>
                                <p class="font-semibold">${partySize} người</p>
                            </div>
                        </div>

                        <div class="flex items-center gap-4">
                            <div class="size-10 bg-primary/10 rounded-xl flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined text-primary text-[20px]">calendar_month</span>
                            </div>
                            <div>
                                <p class="text-xs text-gray-400">Ngày & Giờ</p>
                                <p class="font-semibold">${date} - <span class="text-primary">${time}</span></p>
                            </div>
                        </div>

                        <div class="flex items-center gap-4">
                            <div class="size-10 bg-primary/10 rounded-xl flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined text-primary text-[20px]">person</span>
                            </div>
                            <div>
                                <p class="text-xs text-gray-400">Người đặt</p>
                                <p class="font-semibold">${fullName}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Note -->
                    <div class="px-6 pb-6">
                        <div class="bg-amber-50 border border-amber-200 rounded-xl p-4 text-sm text-amber-700">
                            <span class="material-symbols-outlined text-[18px] align-middle mr-1">info</span>
                            Vui lòng đến đúng giờ. Bàn sẽ được giữ trong <strong>15 phút</strong> kể từ thời gian hẹn.
                        </div>
                    </div>
                </div>

                <!-- Actions -->
                <div class="mt-6 space-y-3 animate-fade-in-up delay-3">
                    <a href="#" 
                       class="flex items-center justify-center gap-2 bg-white border-2 border-gray-200 hover:border-primary text-secondary font-semibold py-4 rounded-2xl transition-all">
                        <span class="material-symbols-outlined text-[20px]">calendar_add_on</span>
                        Thêm vào Lịch
                    </a>

                    <a href="${pageContext.request.contextPath}/menu"
                       class="flex items-center justify-center gap-2 bg-primary/10 hover:bg-primary/20 text-primary font-semibold py-4 rounded-2xl transition-all">
                        <span class="material-symbols-outlined text-[20px]">restaurant_menu</span>
                        Xem Menu & Đặt món trước
                    </a>

                    <a href="${pageContext.request.contextPath}/home"
                       class="flex items-center justify-center gap-2 text-gray-500 hover:text-secondary font-medium py-3 transition-all">
                        <span class="material-symbols-outlined text-[18px]">home</span>
                        Về trang chủ
                    </a>
                </div>

            </div>
        </main>

    </body>

</html>