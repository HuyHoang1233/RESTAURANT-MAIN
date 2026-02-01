<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="danran.model.User" %>
<% User currentUser = (User) session.getAttribute("user"); %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt bàn giữ chỗ - Danran</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
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
                            border: '#e7dfda',
                            background: '#ffffff',
                            'text-muted': '#8d715e'
                        },
                        fontFamily: {
                            sans: ['Inter', 'sans-serif'],
                        },
                    }
                }
            }
        </script>

        <style>
            .hide-scrollbar::-webkit-scrollbar {
                display: none;
            }

            .hide-scrollbar {
                -ms-overflow-style: none;
                scrollbar-width: none;
            }

            .material-symbols-outlined.filled {
                font-variation-settings: 'FILL' 1;
            }

            /* Ticket Perforation */
            .ticket-perforation {
                position: relative;
                border-top: 1px dashed #e7dfda;
                margin: 1.5rem 0;
            }

            .ticket-perforation::before,
            .ticket-perforation::after {
                content: '';
                position: absolute;
                top: -0.5rem;
                width: 1rem;
                height: 1rem;
                background-color: white;
                border-radius: 50%;
                border: 1px solid #e7dfda;
            }

            .ticket-perforation::before {
                left: -2rem;
                border-left: 0;
            }

            .ticket-perforation::after {
                right: -2rem;
                border-right: 0;
            }

            /* Smooth inputs */
            input:focus,
            textarea:focus,
            select:focus {
                outline: none;
                border-color: #ff6a00;
                box-shadow: 0 0 0 4px rgba(255, 106, 0, 0.1);
            }

            /* Hieu ứng hiển thị tài khoản */
            .profile-menu {
                transform-origin: top right;
                transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
            }
            .profile-menu.hidden {
                transform: scale(0.95);
                opacity: 0;
                pointer-events: none;
                visibility: hidden;
            }
            .profile-menu.show {
                transform: scale(1);
                opacity: 1;
                pointer-events: auto;
                visibility: visible;
            }
        </style>
    </head>

    <body class="min-h-screen text-secondary">

        <!-- Premium Header -->
        <header class="sticky top-0 z-50 bg-white border-b border-[#e7dfda] px-4 lg:px-20 py-3">
            <div class="max-w-[1440px] mx-auto flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <a href="${pageContext.request.contextPath}/home" class="text-[#ff6a00] size-8 block">
                        <svg fill="none" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
                        <path d="M24 4C25.7818 14.2173 33.7827 22.2182 44 24C33.7827 25.7818 25.7818 33.7827 24 44C22.2182 33.7827 14.2173 25.7818 4 24C14.2173 22.2182 22.2182 14.2173 24 4Z"
                            fill="currentColor"></path>
                        </svg>
                    </a>
                    <h2 class="text-xl font-bold leading-tight tracking-tight">Danran</h2>
                </div>

            <div class="flex items-center gap-4">
                <% if (currentUser == null) { %>
                    <a href="${pageContext.request.contextPath}/login.jsp" 
                   class="bg-[#ff6a00] hover:bg-[#ff6a00]/90 text-white text-sm font-bold h-10 px-6 rounded-lg flex items-center transition-all">
                    Đăng nhập
                    </a>
                <% } else { %>
                    <div class="relative" id="profileContainer">
                        <button onclick="toggleProfileMenu()" class="focus:outline-none transition-transform active:scale-95 block">
                            <div class="size-10 rounded-full bg-[#ff6a00] text-white flex items-center justify-center font-bold text-sm border-2 border-white shadow-sm ring-1 ring-gray-100">
                                <%= (currentUser.getFullName() != null && currentUser.getFullName().length() >= 2) 
                                ? currentUser.getFullName().substring(0, 2).toUpperCase() 
                                : "U" %>
                            </div>
                        </button>

                    <div id="profileMenu" class="profile-menu hidden absolute right-0 mt-3 w-[340px] bg-white rounded-[2rem] shadow-[0_20px_60px_-15px_rgba(0,0,0,0.15)] border border-gray-100 overflow-hidden z-50 ring-1 ring-black/5">
                        
                        <div class="p-5 flex items-center gap-3 border-b border-gray-50">
                            <div class="size-12 rounded-full bg-gray-100 overflow-hidden border border-gray-100 shrink-0">
                                <img src="https://ui-avatars.com/api/?name=<%= currentUser.getFullName()%>&background=random&color=fff" class="w-full h-full object-cover">
                            </div>
                            <div class="overflow-hidden">
                                <h4 class="font-bold text-secondary text-lg truncate"><%= currentUser.getFullName() %></h4>
                                <p class="text-xs text-gray-400 font-medium truncate"><%= currentUser.getPhoneNumber() %></p>
                            </div>
                        </div>

                        <div class="px-5 py-4 pb-2">
                            <div class="bg-gradient-to-br from-[#fff8f3] to-white border border-[#ffecd9] rounded-2xl p-4 relative overflow-hidden group shadow-sm">
                                <div class="absolute -right-6 -top-6 text-[#ff6a00]/5 transition-transform group-hover:scale-110 duration-500">
                                    <span class="material-symbols-outlined text-[80px] filled">workspace_premium</span>
                                </div>

                                <div class="relative z-10">
                                        <div class="flex justify-between items-center mb-3">
                                            <div class="inline-flex items-center gap-1.5 bg-white border border-[#ffecd9] rounded-full pl-1.5 pr-2.5 py-0.5 shadow-sm">
                                                <span class="material-symbols-outlined text-[#d97706] text-[14px] filled">stars</span>
                                                <span class="text-[10px] font-black text-[#d97706] tracking-wider uppercase">Gold Member</span>
                                            </div>
                                            <div class="flex items-baseline gap-1">
                                                <span class="text-xl font-black text-secondary leading-none">1,250</span>
                                                <span class="text-[9px] font-bold text-gray-400 uppercase">Điểm</span>
                                            </div>
                                        </div>
                                        
                                        <div class="space-y-1.5">
                                            <div class="w-full h-1.5 bg-[#ffdecb] rounded-full overflow-hidden">
                                                <div class="h-full bg-gradient-to-r from-[#ff6a00] to-[#ff9500] rounded-full" style="width: 75%"></div>
                                            </div>
                                            <p class="text-[10px] text-gray-500 font-medium flex justify-between">
                                                <span>Thêm <strong class="text-[#ff6a00]">150 điểm</strong> lên Diamond</span>
                                                <span class="text-[10px]">💎</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="px-3 py-2 space-y-0.5">
                            <a href="#" class="flex items-center gap-3 p-3 rounded-xl hover:bg-gray-50 text-gray-600 hover:text-secondary transition-all group">
                                <div class="size-8 rounded-lg bg-gray-100 flex items-center justify-center text-gray-500 group-hover:bg-white group-hover:text-[#ff6a00] group-hover:shadow-sm transition-all">
                                    <span class="material-symbols-outlined text-[18px]">person</span>
                                </div>
                                <span class="text-[13px] font-bold flex-1">Thông tin cá nhân</span>
                                <span class="material-symbols-outlined text-[16px] text-gray-300 group-hover:text-[#ff6a00] group-hover:translate-x-0.5 transition-all">chevron_right</span>
                            </a>
                            <a href="#" class="flex items-center gap-3 p-3 rounded-xl hover:bg-gray-50 text-gray-600 hover:text-secondary transition-all group">
                                <div class="size-8 rounded-lg bg-gray-100 flex items-center justify-center text-gray-500 group-hover:bg-white group-hover:text-[#ff6a00] group-hover:shadow-sm transition-all">
                                    <span class="material-symbols-outlined text-[18px]">receipt_long</span>
                                </div>
                                <span class="text-[13px] font-bold flex-1">Đơn đặt món</span>
                                <span class="material-symbols-outlined text-[16px] text-gray-300 group-hover:text-[#ff6a00] group-hover:translate-x-0.5 transition-all">chevron_right</span>
                            </a>

                            <a href="#" class="flex items-center gap-3 p-3 rounded-xl hover:bg-gray-50 text-gray-600 hover:text-secondary transition-all group">
                                <div class="size-8 rounded-lg bg-gray-100 flex items-center justify-center text-gray-500 group-hover:bg-white group-hover:text-[#ff6a00] group-hover:shadow-sm transition-all">
                                    <span class="material-symbols-outlined text-[18px]">lock</span>
                                </div>
                                <span class="text-[13px] font-bold flex-1">Mật khẩu & Bảo mật</span>
                                <span class="material-symbols-outlined text-[16px] text-gray-300 group-hover:text-[#ff6a00] group-hover:translate-x-0.5 transition-all">chevron_right</span>
                            </a>
                        </div>

                        <div class="p-4 border-t border-gray-50 bg-gray-50/50">
                            <a href="${pageContext.request.contextPath}/logout" class="flex items-center justify-center gap-2 w-full p-3 rounded-xl hover:bg-red-50 text-red-500 hover:text-red-600 font-bold text-sm transition-colors">
                                <span class="material-symbols-outlined text-[20px]">logout</span>
                                Đăng xuất
                            </a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
        </header>

        <main class="max-w-[1440px] mx-auto flex flex-col lg:flex-row lg:h-[calc(100vh-65px)]">

            <!-- Left Section: Booking Form -->
            <section class="flex-1 overflow-y-auto px-4 lg:px-20 py-10 hide-scrollbar">
                <div class="max-w-[640px] mx-auto lg:ml-0">
                    <div class="mb-10">
                        <h1 class="text-4xl font-black leading-tight tracking-tight mb-2">Đặt bàn giữ chỗ
                        </h1>
                        <p class="text-[#8d715e] text-lg font-medium">Nhanh chóng, linh hoạt, không cần đặt cọc</p>
                    </div>

                    <form id="bookingForm" action="${pageContext.request.contextPath}/booking" method="POST"
                          class="space-y-8">

                        <!-- Branch Selection (Cards retained for UX) -->
                        <div>
                            <label class="block text-base font-bold mb-3">Chọn chi nhánh</label>
                            <div class="space-y-3">
                                <label class="branch-option block p-4 border rounded-xl cursor-pointer transition-all border-primary bg-primary/5 relative overflow-hidden group">
                                    <input type="radio" name="branch" value="quan1" class="hidden" checked>
                                    <div class="flex items-center justify-between relative z-10">
                                        <div>
                                            <p class="font-bold text-secondary">Danran - Ngũ Hành Sơn</p>
                                            <p class="text-sm text-gray-500 mt-1"> 497 Võ Nguyên Giáp, Ngũ Hành Sơn, Đà Nẵng</p>
                                        </div>
                                        <div class="text-right check-icon opacity-100 transition-opacity">
                                            <div class="size-6 bg-primary rounded-full flex items-center justify-center ml-auto shadow-md shadow-primary/30">
                                                <span class="material-symbols-outlined text-white text-[16px]">check</span>
                                            </div>
                                        </div>
                                    </div>
                                </label>

                                <label class="branch-option block p-4 border border-[#e7dfda] hover:border-primary/50 rounded-xl cursor-pointer transition-all relative overflow-hidden group">
                                    <input type="radio" name="branch" value="quan3" class="hidden">
                                    <div class="flex items-center justify-between relative z-10">
                                        <div>
                                            <p class="font-bold text-secondary">Danran - Hải Châu</p>
                                            <p class="text-sm text-gray-500 mt-1">407 Núi Thành, Hải Châu, Đà Nẵng</p>
                                        </div>
                                        <div class="text-right opacity-0 check-icon transition-opacity">
                                            <div class="size-6 bg-primary rounded-full flex items-center justify-center ml-auto shadow-md shadow-primary/30">
                                                <span class="material-symbols-outlined text-white text-[16px]">check</span>
                                            </div>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <!-- Số người -->
                        <div>
                            <label class="block text-base font-bold mb-3">Số người</label>
                            <div class="flex flex-wrap gap-3">
                                <c:forEach begin="1" end="6" var="i">
                                    <label class="cursor-pointer">
                                        <input type="radio" name="partySize" value="${i < 6 ? i : '6+'}"
                                       class="hidden pax-input" ${i==2 ? 'checked' : '' }>
                                        <div class="pax-btn w-12 h-12 flex items-center justify-center rounded-full border-2 border-[#e7dfda] text-secondary font-bold hover:border-primary transition-all">
                                            ${i < 6 ? i : '6+' } </div>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Ngày đến -->
                        <div>
                            <label class="block text-base font-bold mb-3">Ngày đến</label>
                            <div class="flex gap-2 overflow-x-auto pb-2 hide-scrollbar" id="dateContainer">
                            </div>
                            <input type="hidden" name="date" id="selectedDate">
                        </div>

                        <!-- Giờ nhận bàn -->
                        <div class="mb-8">
                            <label class="block text-base font-bold mb-3">Giờ nhận bàn</label>
                            <div class="bg-white p-6 rounded-[1.5rem] border border-[#e7dfda] shadow-sm">
                            <div class="flex items-center gap-3">
                                <!-- Chọn giờ -->
                                <div class="flex-1 relative group">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[10px] font-bold text-[#8d715e] uppercase tracking-wider">Giờ</label>
                                    <select name="hour" id="hourSelect" class="w-full h-14 pl-4 pr-10 bg-white border border-[#e7dfda] rounded-xl text-lg font-bold text-secondary appearance-none cursor-pointer focus:border-[#ff6a00] focus:ring-1 focus:ring-[#ff6a00] transition-all outline-none">
                                        <option value="" disabled selected>--</option>
                                        <c:forEach begin="10" end="21" var="h">
                                            <option value="${h}">${h} Giờ</option>
                                        </c:forEach>
                                    </select>
                                    <div class="absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-[#8d715e]">
                                        <span class="material-symbols-outlined">schedule</span>
                                    </div>
                                </div>
<!--                                 Minute Selection 
                                <div class="text-2xl text-[#e7dfda] font-light pb-1">:</div>-->
                                <!-- Chọn phút -->
                                <div class="flex-1 relative group">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[10px] font-bold text-[#8d715e] uppercase tracking-wider">Phút</label>
                                    <select name="minute" id="minuteSelect" class="w-full h-14 pl-4 pr-10 bg-white border border-[#e7dfda] rounded-xl text-lg font-bold text-secondary appearance-none cursor-pointer focus:border-[#ff6a00] focus:ring-1 focus:ring-[#ff6a00] transition-all outline-none">
                                        <option value="" disabled selected>--</option>
                                        <option value="00">00 phút</option>
                                        <option value="15">15 phút</option>
                                        <option value="30">30 phút</option>
                                        <option value="45">45 phút</option>
                                    </select>
                                    <div class="absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-[#8d715e]">
                                        <span class="material-symbols-outlined">expand_more</span>
                                    </div>
                                </div>

                            </div>

                                <div class="flex items-center gap-2 mt-4 text-xs text-gray-400 font-medium">
                                    <span class="material-symbols-outlined text-[16px]">info</span>
                                    <p>Nhà hàng mở cửa từ 10:00 - 21:00 hàng ngày.</p>
                                </div>

                                <input type="hidden" name="time" id="selectedTime">
                            </div>
                        </div>

                        <!-- User Info -->
                        <div class="space-y-4 pt-6 border-t border-[#e7dfda]">
                            <label class="block text-base font-bold">Thông tin liên hệ</label>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <input type="text" name="fullName" id="fullName" placeholder="Họ và tên"
                                required value="<%= currentUser != null ? currentUser.getFullName() : ""%>"
                                class="h-12 rounded-xl border border-[#e7dfda] px-4 focus:ring-2 focus:ring-[#ff6a00] focus:border-[#ff6a00] outline-none transition-all">
                                <input type="tel" name="phone" id="phone" placeholder="Số điện thoại"
                                required value="<%= currentUser != null ? currentUser.getPhoneNumber() : ""%>"
                                class="h-12 rounded-xl border border-[#e7dfda] px-4 focus:ring-2 focus:ring-[#ff6a00] focus:border-[#ff6a00] outline-none transition-all">
                            </div>
                            <textarea name="notes" placeholder="Ghi chú (Ví dụ: Sinh nhật, Ghế trẻ em...)" rows="3"
                               class="w-full rounded-xl border border-[#e7dfda] p-4 focus:ring-2 focus:ring-[#ff6a00] focus:border-[#ff6a00] outline-none transition-all resize-none"></textarea>
                        </div>

                    </form>
                </div>
            </section>

            <!-- Summary & Ticket -->
            <aside class="w-full lg:w-[450px] bg-white lg:bg-transparent border-t lg:border-t-0 lg:border-l border-[#e7dfda] p-6 lg:p-10 flex flex-col gap-6 lg:h-full lg:sticky lg:top-0">
                <!-- Map Card -->
                <div class="w-full h-48 rounded-2xl overflow-hidden bg-gray-200 relative group shrink-0">
                    <div class="absolute inset-0 bg-cover bg-center transition-transform duration-700 group-hover:scale-105"
                         style="background-image: url('https://lh3.googleusercontent.com/p/AF1QipNaaaK6j7X4Kk4q2g2z7Zq7w5C5q5q5q5q5q5q5=s1360-w1360-h1020');">
                    </div>
                    <div class="absolute inset-0 bg-black/5 flex items-center justify-center">
                        <div class="bg-white px-5 py-2 rounded-full shadow-2xl flex items-center gap-2 border border-[#e7dfda]">
                            <span class="material-symbols-outlined text-[#ff6a00]">location_on</span>
                            <span class="text-sm font-bold" id="mapBranchName">Danran - Ngũ Hành Sơn</span>
                        </div>
                    </div>
                </div>

                <!-- Chi tiết đặt bàn(Vé đặt) -->
                <div class="flex-1 flex flex-col">
                    <div class="bg-white rounded-2xl border border-[#e7dfda] shadow-sm relative overflow-hidden flex flex-col h-full">
                        <div class="bg-[#ff6a00] h-2 w-full shrink-0"></div>

                        <div class="p-6 flex-1 flex flex-col">
                            <h3 class="text-lg font-bold mb-6 flex items-center justify-between text-[#181410]">
                                Chi tiết đặt bàn
                                <span class="material-symbols-outlined text-[#8d715e] filled">confirmation_number</span>
                            </h3>

                            <div class="space-y-5">
                                <div class="flex items-start gap-4">
                                    <span class="material-symbols-outlined text-[#ff6a00]">restaurant</span>
                                    <div>
                                        <p class="text-[10px] text-[#8d715e] font-bold uppercase tracking-wider mb-0.5">
                                            Chi nhánh</p>
                                        <p class="font-semibold text-[#181410]" id="summaryBranch">
                                            Danran - Ngũ Hành Sơn (497 Võ Nguyên Giáp)</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-4">
                                    <span class="material-symbols-outlined text-[#ff6a00]">group</span>
                                    <div>
                                        <p class="text-[10px] text-[#8d715e] font-bold uppercase tracking-wider mb-0.5">
                                            Số người</p>
                                        <p class="font-semibold text-[#181410]" id="summaryPax">02 người</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-4">
                                    <span class="material-symbols-outlined text-[#ff6a00]">calendar_month</span>
                                    <div>
                                        <p class="text-[10px] text-[#8d715e] font-bold uppercase tracking-wider mb-0.5">
                                            Thời gian</p>
                                        <p class="font-semibold text-[#181410]">
                                            <span id="summaryTime">--:--</span> <span id="summaryDate">
                                                Hôm nay</span>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Perforation -->
                            <div class="ticket-perforation"></div>

                            <div class="text-center space-y-5 mt-auto">
                                <p class="text-[11px] text-[#8d715e] px-4 leading-relaxed font-medium italic">
                                    Quý khách có thể thay đổi hoặc hủy bàn trước 30 phút mà không tốn phí.
                                </p>
                                <button type="submit" form="bookingForm"
                                 class="w-full bg-[#ff6a00] hover:bg-[#e65f00] text-white h-14 rounded-xl font-black text-lg shadow-lg shadow-[#ff6a00]/25 transition-all active:scale-[0.98] transform">
                                    Xác nhận đặt bàn
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-2 shrink-0">
                    <p class="text-sm text-[#8d715e] flex items-center justify-center gap-2">
                        <span class="material-symbols-outlined text-base">support_agent</span>
                        Hỗ trợ đặt bàn: <a class="font-bold text-[#ff6a00]" href="tel:19001234">
                            19001234</a>
                    </p>
                </div>
            </aside>
        </main>

        <script>
            function toggleProfileMenu() {
                const menu = document.getElementById('profileMenu');
                // Toggle class để hiện/ẩn
                if (menu.classList.contains('hidden')) {
                    menu.classList.remove('hidden');
                    // Timeout nhỏ để CSS transition bắt được sự thay đổi
                    setTimeout(() => menu.classList.add('show'), 10);
                } else {
                    menu.classList.remove('show');
                    setTimeout(() => menu.classList.add('hidden'), 200); // Chờ animation tắt xong mới ẩn
                }
            }
            // Đóng menu khi click ra ngoài
            document.addEventListener('click', function(event) {
                const container = document.getElementById('profileContainer');
                const menu = document.getElementById('profileMenu');
    
                // click không nằm trong container và menu đang mở
                if (container && !container.contains(event.target) && !menu.classList.contains('hidden')) {
                    menu.classList.remove('show');
                    setTimeout(() => menu.classList.add('hidden'), 200);
                }
             });
             
            // Constants & Data
            const branches = {
                'quan1': {name: 'Danran - Ngũ Hành Sơn', address: '497 Võ Nguyên Giáp'},
                'quan3': {name: 'Danran - Hải Châu', address: '407 Núi Thành'}
            };
            
            // 1. Branch Selection
            document.querySelectorAll('input[name="branch"]').forEach(input => {
                input.addEventListener('change', (e) => {
                    // Style update
                    document.querySelectorAll('.branch-option').forEach(opt => {
                        opt.classList.remove('border-primary', 'bg-primary/5');
                        opt.classList.add('border-[#e7dfda]');
                        opt.querySelector('.check-icon')?.classList.add('opacity-0');
                        opt.querySelector('.check-icon')?.classList.remove('opacity-100');

                        // Specific fix for the first option (active by default logic)
                        if (opt.querySelector('input').checked) {
                            opt.classList.add('border-primary', 'bg-primary/5');
                            opt.classList.remove('border-[#e7dfda]');
                            opt.querySelector('.check-icon')?.classList.remove('opacity-0');
                            opt.querySelector('.check-icon')?.classList.add('opacity-100');
                        }
                    });

                    // Update Summary
                    const b = branches[e.target.value];
                    document.getElementById('mapBranchName').textContent = b.name;
                    document.getElementById('summaryBranch').textContent = b.name + ' (' + b.address + ')';
                });
            });

            // 2. Chọn chi nhánh
            document.querySelectorAll('.pax-input').forEach(input => {
                input.addEventListener('change', (e) => {
                    document.querySelectorAll('.pax-btn').forEach(btn => {
                        btn.classList.remove('border-[#ff6a00]', 'bg-[#ff6a00]', 'text-white', 'shadow-lg');
                        btn.classList.add('border-[#e7dfda]', 'text-secondary');
                    });

                    const btn = e.target.nextElementSibling;
                    btn.classList.remove('border-[#e7dfda]', 'text-secondary');
                    btn.classList.add('border-[#ff6a00]', 'bg-[#ff6a00]', 'text-white', 'shadow-lg');

                    document.getElementById('summaryPax').textContent = e.target.value.padStart(2, '0') + ' người';
                });
            });

            // 3. Ngày đến
            const dateContainer = document.getElementById('dateContainer');
            const today = new Date();
            const dayNames = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];
            const dayNamesFull = ['CHỦ NHẬT', 'THỨ 2', 'THỨ 3', 'THỨ 4', 'THỨ 5', 'THỨ 6', 'THỨ 7'];
            let selectedDateCard = null;

            for (let i = 0; i < 7; i++) {
                const d = new Date(today);
                d.setDate(today.getDate() + i);

                const dateStr = d.toLocaleDateString('vi-VN');
                const dayNum = d.getDate();
                const dayOfWeek = d.getDay();
                const dayLabel = dayNamesFull[dayOfWeek];
                const dayShort = dayNames[dayOfWeek];

                const btn = document.createElement('button');
                btn.type = 'button';
                btn.className = 'flex flex-col items-center justify-center min-w-[70px] px-4 py-3 rounded-lg border-2 transition-all ' +
                        (i === 0 ? 'border-primary bg-white shadow-sm' : 'border-[#e7dfda] bg-white hover:border-primary/50');

                const span = document.createElement('span');
                span.className = 'text-[10px] font-bold uppercase tracking-wider ' + (i === 0 ? 'text-primary' : 'text-[#8d715e]');
                span.textContent = dayShort;
                btn.appendChild(span);

                if (i === 0) {
                    selectedDateCard = btn;
                    document.getElementById('selectedDate').value = dateStr;
                    document.getElementById('summaryDate').textContent = dayLabel + ',' + dateStr;
                }

                btn.addEventListener('click', () => {
                    if (selectedDateCard) {
                        selectedDateCard.className = 'flex flex-col items-center justify-center min-w-[70px] px-4 py-3 rounded-lg border-2 border-[#e7dfda] bg-white hover:border-primary/50 transition-all';
                        selectedDateCard.querySelector('span').className = 'text-[10px] font-bold uppercase tracking-wider text-[#8d715e]';
                    }

                    btn.className = 'flex flex-col items-center justify-center min-w-[70px] px-4 py-3 rounded-lg border-2 border-primary bg-white shadow-sm transition-all';
                    btn.querySelector('span').className = 'text-[10px] font-bold uppercase tracking-wider text-primary';

                    selectedDateCard = btn;
                    document.getElementById('selectedDate').value = dateStr;
                    document.getElementById('summaryDate').textContent = dayLabel + ',' + dateStr;

                    // Reset time when date changes
                    document.querySelectorAll('.time-btn').forEach(b => b.classList.remove('bg-[#ff6a00]', 'text-white', 'border-[#ff6a00]', 'font-bold'));
                    document.getElementById('selectedTime').value = '';
                    document.getElementById('summaryTime').textContent = '--:--';
                });

                dateContainer.appendChild(btn);
            }

            // 4.Giờ nhận bàn
            const hourSelect = document.getElementById('hourSelect');
            const minuteSelect = document.getElementById('minuteSelect');
            const selectedTimeInput = document.getElementById('selectedTime');
            const summaryTimeDisplay = document.getElementById('summaryTime');
            function updateTimeDisplay(){
                const h = hourSelect.value;
                const m = minuteSelect.value;
                
                if(h && m){
                    const formattedTime = h.padStart(2, '0') + ':' + m;
                    
                    //cập nhật input ẩn và hiển thị trên vé
                    selectedTimeInput.value = formattedTime;
                    summaryTimeDisplay.textContent = formattedTime;
                    
                    summaryTimeDisplay.classList.add('text-[#ff6a00]');
                }else {
                    summaryTimeDisplay.textContent = '--:--';
                    summaryTimeDisplay.classList.remove('text-[#ff6a00]');
                }
            }
            //Thay đổi
            hourSelect.addEventListener('change', updateTimeDisplay);
            minuteSelect.addEventListener('change', updateTimeDisplay);

            // 5. Validation
            document.getElementById('bookingForm').addEventListener('submit', (e) => {
                if (!hourSelect.value) {
                    e.preventDefault();
                    alert('Vui lòng chọn giờ!');
                    hourSelect.focus();
                    return;
                }

                if (!minuteSelect.value) {
                    e.preventDefault();
                    alert('Vui lòng chọn phút!');
                    minuteSelect.focus();
                    return;
                }
            });

            // Initialize Styles for Pax 2 (Checked by default)
            document.querySelector('input[name="partySize"][value="2"]').nextElementSibling.classList.remove('border-[#e7dfda]', 'text-secondary');
            document.querySelector('input[name="partySize"][value="2"]').nextElementSibling.classList.add('border-[#ff6a00]', 'bg-[#ff6a00]', 'text-white', 'shadow-lg');

        </script>
    </body>

</html>