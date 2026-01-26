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
                /* Match page bg if transparent */
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
        </style>
    </head>

    <body class="min-h-screen text-secondary">

        <!-- Premium Header -->
        <header class="sticky top-0 z-50 bg-white border-b border-[#e7dfda] px-4 lg:px-20 py-3">
            <div class="max-w-[1440px] mx-auto flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <a href="${pageContext.request.contextPath}/home" class="text-[#ff6a00] size-8 block">
                        <svg fill="none" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M24 4C25.7818 14.2173 33.7827 22.2182 44 24C33.7827 25.7818 25.7818 33.7827 24 44C22.2182 33.7827 14.2173 25.7818 4 24C14.2173 22.2182 22.2182 14.2173 24 4Z"
                            fill="currentColor"></path>
                        </svg>
                    </a>
                    <h2 class="text-xl font-bold leading-tight tracking-tight">Danran</h2>
                </div>
                <nav class="hidden md:flex items-center gap-9">
                    <a class="text-sm font-medium hover:text-[#ff6a00] transition-colors"
                       href="${pageContext.request.contextPath}/menu">Thực đơn</a>
                    <a class="text-sm font-medium hover:text-[#ff6a00] transition-colors" href="#">
                        Chi nhánh</a>
                    <a class="text-sm font-medium hover:text-[#ff6a00] transition-colors" href="#">
                        Khuyến mãi</a>
                    <a class="text-sm font-medium hover:text-[#ff6a00] transition-colors" href="#">
                        Về chúng tôi</a>
                </nav>
                <div class="flex items-center gap-4">
                    <% if (currentUser == null) { %>
                    <a href="${pageContext.request.contextPath}/login.jsp"
                       class="bg-[#ff6a00] hover:bg-[#ff6a00]/90 text-white text-sm font-bold h-10 px-6 rounded-lg flex items-center transition-all">
                        Đăng nhập</a>
                        <% } else {%>
                    <div class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10 border border-[#e7dfda]"
                         style="background-image: url('https://ui-avatars.com/api/?name=<%= currentUser.getFullName()%>&background=ff6a00&color=fff');">
                    </div>
                    <% }%>
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
                                            <p class="text-sm text-gray-500 mt-1">
                                                497 Võ Nguyên Giáp, Ngũ Hành Sơn, Đà Nẵng</p>
                                        </div>
                                        <div class="text-right">
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
                                            <p class="text-sm text-gray-500 mt-1">
                                                407 Núi Thành, Hải Châu, Đà Nẵng</p>
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

                        <!-- Pax Selector (Circular) -->
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

                        <!-- Date Strip (Vertical Cards) -->
                        <div>
                            <label class="block text-base font-bold mb-3">Ngày đến</label>
                            <div class="flex gap-3 overflow-x-auto pb-4 hide-scrollbar" id="dateContainer">
                            </div>
                            <input type="hidden" name="date" id="selectedDate">
                        </div>

                        <!-- Time Slots -->
                        <div>
                            <label class="block text-base font-bold mb-4">Giờ nhận bàn</label>
                            <div class="space-y-6">
                                <!-- Morning -->
                                <div>
                                    <h4 class="text-sm font-bold text-[#8d715e] uppercase mb-3 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-sm">wb_sunny</span> Sáng
                                    </h4>
                                    <div class="grid grid-cols-4 sm:grid-cols-5 gap-2" id="morningSlots">
                                    </div>
                                </div>
                                <!-- Afternoon -->
                                <div>
                                    <h4 class="text-sm font-bold text-[#8d715e] uppercase mb-3 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-sm">partly_cloudy_day</span>
                                        Chiều
                                    </h4>
                                    <div class="grid grid-cols-4 sm:grid-cols-5 gap-2" id="afternoonSlots">
                                    </div>
                                </div>
                                <!-- Evening -->
                                <div>
                                    <h4 class="text-sm font-bold text-[#8d715e] uppercase mb-3 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-sm">bedtime</span> Tối
                                    </h4>
                                    <div class="grid grid-cols-4 sm:grid-cols-5 gap-2" id="eveningSlots">
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="time" id="selectedTime">
                        </div>

                        <!-- User Info -->
                        <div class="space-y-4 pt-6 border-t border-[#e7dfda]">
                            <label class="block text-base font-bold">Thông tin liên hệ</label>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <input type="text" name="fullName" id="fullName" placeholder="Họ và tên"
                                       required
                                       value="<%= currentUser != null ? currentUser.getFullName() : ""%>"
                                       class="h-12 rounded-xl border border-[#e7dfda] px-4 focus:ring-2 focus:ring-[#ff6a00] focus:border-[#ff6a00] outline-none transition-all">
                                <input type="tel" name="phone" id="phone" placeholder="Số điện thoại"
                                       required
                                       value="<%= currentUser != null ? currentUser.getPhoneNumber() : ""%>"
                                       class="h-12 rounded-xl border border-[#e7dfda] px-4 focus:ring-2 focus:ring-[#ff6a00] focus:border-[#ff6a00] outline-none transition-all">
                            </div>
                            <textarea name="notes" placeholder="Ghi chú (Ví dụ: Sinh nhật, Ghế trẻ em...)"
                                      rows="3"
                                      class="w-full rounded-xl border border-[#e7dfda] p-4 focus:ring-2 focus:ring-[#ff6a00] focus:border-[#ff6a00] outline-none transition-all resize-none"></textarea>
                        </div>

                    </form>
                </div>
            </section>

            <!-- Right Section: Summary & Ticket -->
            <aside
                class="w-full lg:w-[450px] bg-white lg:bg-transparent border-t lg:border-t-0 lg:border-l border-[#e7dfda] p-6 lg:p-10 flex flex-col gap-6 lg:h-full lg:sticky lg:top-0">

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

                <!-- Ticket UI -->
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
                                            <span id="summaryTime">--:--</span> • <span id="summaryDate">
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
            // ==========================================
            // Constants & Data
            // ==========================================
            const branches = {
                'quan1': {name: 'Danran - Ngũ Hành Sơn', address: '497 Võ Nguyên Giáp'},
                'quan3': {name: 'Danran - Hải Châu', address: '407 Núi Thành'}
            };

            const timeSlots = {
                morning: ['10:00', '10:30', '11:00', '11:30'],
                afternoon: ['12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00'],
                evening: ['18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30']
            };

            // ==========================================
            // UI Logic
            // ==========================================

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

            // 2. Pax Selection
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

            // 3. Date Generation
            const dateContainer = document.getElementById('dateContainer');
            const today = new Date();
            const days = ['CN', 'Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy'];
            let selectedDateCard = null;

            for (let i = 0; i < 7; i++) {
                const d = new Date(today);
                d.setDate(today.getDate() + i);

                const dateStr = d.toLocaleDateString('vi-VN'); // DD/MM/YYYY
                const dayNum = d.getDate();
                const dayName = i === 0 ? 'Hôm nay' : (i === 1 ? 'Ngày mai' : days[d.getDay()]);

                const btn = document.createElement('button');
                btn.type = 'button';
                btn.className = 'flex flex-col items-center justify-center min-w-[96px] h-28 rounded-xl border transition-all p-4 ' +
                        (i === 0 ? 'border-[#ff6a00] ring-1 ring-[#ff6a00] bg-white' : 'border-[#e7dfda] bg-white hover:border-[#ff6a00]');
                btn.innerHTML = `
<span class="text-[10px] font-bold mb-1 uppercase tracking-wider ` + (i === 0 ? 'text-[#ff6a00]' : 'text-[#8d715e]') + `">${dayName}</span>
<span class="text-2xl font-black">${dayNum}</span>
<span class="text-sm font-medium opacity-60 uppercase">` + (i === 0 || i === 1 ? d.toLocaleDateString('vi-VN', {weekday: 'short'}) : dayName) + `</span>
`;

                if (i === 0) {
                    selectedDateCard = btn;
                    document.getElementById('selectedDate').value = dateStr;
                    document.getElementById('summaryDate').textContent = dateStr;
                }

                btn.addEventListener('click', () => {
                    if (selectedDateCard) {
                        selectedDateCard.className = 'flex flex-col items-center justify-center min-w-[96px] h-28 rounded-xl border border-[#e7dfda] bg-white hover:border-[#ff6a00] transition-all p-4';
                        selectedDateCard.querySelector('span:first-child').className = 'text-[10px] font-bold mb-1 uppercase tracking-wider text-[#8d715e]';
                    }

                    btn.className = 'flex flex-col items-center justify-center min-w-[96px] h-28 rounded-xl border border-[#ff6a00] ring-1 ring-[#ff6a00] bg-white transition-all p-4';
                    btn.querySelector('span:first-child').className = 'text-[10px] font-bold mb-1 uppercase tracking-wider text-[#ff6a00]';

                    selectedDateCard = btn;
                    document.getElementById('selectedDate').value = dateStr;
                    document.getElementById('summaryDate').textContent = dateStr;

                    // Reset time when date changes
                    document.querySelectorAll('.time-btn').forEach(b => b.classList.remove('bg-[#ff6a00]', 'text-white', 'border-[#ff6a00]', 'font-bold'));
                    document.getElementById('selectedTime').value = '';
                    document.getElementById('summaryTime').textContent = '--:--';
                });

                dateContainer.appendChild(btn);
            }

            // 4. Time Slots
            function renderTimeSlots() {
                Object.keys(timeSlots).forEach(key => {
                    const container = document.getElementById(key + 'Slots');
                    timeSlots[key].forEach(t => {
                        const btn = document.createElement('button');
                        btn.type = 'button';
                        btn.textContent = t;
                        btn.className = 'time-btn py-2 border border-[#e7dfda] rounded-lg text-sm font-medium hover:border-[#ff6a00] transition-all text-[#181410]';

                        btn.addEventListener('click', () => {
                            document.querySelectorAll('.time-btn').forEach(b => {
                                b.className = 'time-btn py-2 border border-[#e7dfda] rounded-lg text-sm font-medium hover:border-[#ff6a00] transition-all text-[#181410]';
                            });

                            btn.className = 'time-btn py-2 border border-[#ff6a00] bg-[#ff6a00] text-white font-bold rounded-lg text-sm transition-all shadow-md shadow-[#ff6a00]/20';
                            document.getElementById('selectedTime').value = t;
                            document.getElementById('summaryTime').textContent = t;
                        });

                        container.appendChild(btn);
                    });
                });
            }
            renderTimeSlots();

            // 5. Validation
            document.getElementById('bookingForm').addEventListener('submit', (e) => {
                if (!document.getElementById('selectedTime').value) {
                    e.preventDefault();
                    alert('Vui lòng chọn giờ nhận bàn!');
                }
            });

            // Initialize Styles for Pax 2 (Checked by default)
            document.querySelector('input[name="partySize"][value="2"]').nextElementSibling.classList.remove('border-[#e7dfda]', 'text-secondary');
            document.querySelector('input[name="partySize"][value="2"]').nextElementSibling.classList.add('border-[#ff6a00]', 'bg-[#ff6a00]', 'text-white', 'shadow-lg');

        </script>
    </body>

</html>