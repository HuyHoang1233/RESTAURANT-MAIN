<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="com.bepcloud.model.User" %>
            <% User currentUser=(User) session.getAttribute("user"); %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Đặt bàn giữ chỗ - Bếp Cloud</title>
                    <meta name="description"
                        content="Đặt bàn trực tuyến tại Bếp Cloud chỉ trong 30 giây. Không cần đặt cọc, giữ chỗ linh hoạt.">

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

                        .material-symbols-outlined.filled {
                            font-variation-settings: 'FILL' 1;
                        }

                        /* Selection states */
                        .option-chip {
                            transition: all 0.2s ease;
                        }

                        .option-chip.selected {
                            background-color: #ff6a00;
                            color: white;
                            border-color: #ff6a00;
                            box-shadow: 0 4px 14px rgba(255, 106, 0, 0.3);
                        }

                        .option-chip.disabled {
                            background-color: #f3f4f6;
                            color: #9ca3af;
                            cursor: not-allowed;
                            border-color: transparent;
                        }

                        /* Time slot grid */
                        .time-slot {
                            transition: all 0.15s ease;
                        }

                        .time-slot:not(.disabled):hover {
                            border-color: #ff6a00;
                            color: #ff6a00;
                        }

                        .time-slot.selected {
                            background-color: #ff6a00;
                            color: white;
                            border-color: #ff6a00;
                        }

                        .time-slot.disabled {
                            background-color: #f9fafb;
                            color: #d1d5db;
                            cursor: not-allowed;
                        }
                    </style>
                </head>

                <body class="bg-gray-50 font-sans text-secondary min-h-screen">

                    <!-- Header -->
                    <header class="fixed top-0 left-0 right-0 z-50 bg-white border-b border-gray-100 shadow-sm">
                        <div class="max-w-6xl mx-auto px-4">
                            <div class="flex items-center justify-between h-16">
                                <div class="flex items-center gap-4">
                                    <a href="${pageContext.request.contextPath}/home"
                                        class="size-10 rounded-full bg-gray-100 hover:bg-gray-200 flex items-center justify-center transition-colors">
                                        <span class="material-symbols-outlined">arrow_back</span>
                                    </a>
                                    <h1 class="text-lg font-bold">Đặt bàn</h1>
                                </div>
                                <a href="${pageContext.request.contextPath}/home"
                                    class="hidden lg:flex items-center gap-2">
                                    <div class="bg-primary/10 text-primary p-2 rounded-xl">
                                        <span class="material-symbols-outlined filled text-[20px]">cloud</span>
                                    </div>
                                    <span class="font-black">Bếp Cloud</span>
                                </a>
                            </div>
                        </div>
                    </header>

                    <!-- Main Content -->
                    <main class="pt-20 pb-32 lg:pb-12">
                        <div class="max-w-6xl mx-auto px-4">
                            <form id="bookingForm" action="${pageContext.request.contextPath}/booking" method="POST">

                                <div class="lg:flex lg:gap-8">
                                    <!-- Left Column: Form -->
                                    <div class="lg:flex-1 space-y-6">

                                        <!-- Section: Location -->
                                        <section class="bg-white rounded-2xl p-5 shadow-sm border border-gray-100">
                                            <h2
                                                class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-4 flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[20px]">location_on</span>
                                                Bạn muốn dùng bữa ở đâu?
                                            </h2>
                                            <div class="space-y-3">
                                                <label
                                                    class="branch-option block p-4 border-2 border-primary bg-primary/5 rounded-xl cursor-pointer transition-all">
                                                    <input type="radio" name="branch" value="quan1" class="hidden"
                                                        checked>
                                                    <div class="flex items-center justify-between">
                                                        <div>
                                                            <p class="font-bold text-secondary">Bếp Cloud - Quận 1</p>
                                                            <p class="text-sm text-gray-500 mt-1">123 Nguyễn Huệ, Phường
                                                                Bến Nghé</p>
                                                        </div>
                                                        <div class="text-right">
                                                            <span
                                                                class="text-xs font-medium text-primary bg-primary/10 px-2 py-1 rounded-full">Cách
                                                                1.2km</span>
                                                            <div
                                                                class="size-6 bg-primary rounded-full flex items-center justify-center mt-2 ml-auto">
                                                                <span
                                                                    class="material-symbols-outlined text-white text-[16px]">check</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </label>
                                                <label
                                                    class="branch-option block p-4 border-2 border-gray-200 hover:border-primary/50 rounded-xl cursor-pointer transition-all">
                                                    <input type="radio" name="branch" value="quan3" class="hidden">
                                                    <div class="flex items-center justify-between">
                                                        <div>
                                                            <p class="font-bold text-secondary">Bếp Cloud - Quận 3</p>
                                                            <p class="text-sm text-gray-500 mt-1">456 Võ Văn Tần, Phường
                                                                5</p>
                                                        </div>
                                                        <div class="text-right">
                                                            <span
                                                                class="text-xs font-medium text-gray-500 bg-gray-100 px-2 py-1 rounded-full">Cách
                                                                3.5km</span>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        </section>

                                        <!-- Section: Party Size -->
                                        <section class="bg-white rounded-2xl p-5 shadow-sm border border-gray-100">
                                            <h2
                                                class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-4 flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[20px]">group</span>
                                                Đi mấy người?
                                            </h2>
                                            <div class="flex flex-wrap gap-2">
                                                <label
                                                    class="option-chip flex-1 min-w-[60px] text-center py-3 px-4 border-2 border-gray-200 rounded-xl font-bold cursor-pointer hover:border-primary/50">
                                                    <input type="radio" name="partySize" value="1" class="hidden">
                                                    <span>1</span>
                                                </label>
                                                <label
                                                    class="option-chip selected flex-1 min-w-[60px] text-center py-3 px-4 border-2 border-gray-200 rounded-xl font-bold cursor-pointer hover:border-primary/50">
                                                    <input type="radio" name="partySize" value="2" class="hidden"
                                                        checked>
                                                    <span>2</span>
                                                </label>
                                                <label
                                                    class="option-chip flex-1 min-w-[60px] text-center py-3 px-4 border-2 border-gray-200 rounded-xl font-bold cursor-pointer hover:border-primary/50">
                                                    <input type="radio" name="partySize" value="3" class="hidden">
                                                    <span>3</span>
                                                </label>
                                                <label
                                                    class="option-chip flex-1 min-w-[60px] text-center py-3 px-4 border-2 border-gray-200 rounded-xl font-bold cursor-pointer hover:border-primary/50">
                                                    <input type="radio" name="partySize" value="4" class="hidden">
                                                    <span>4</span>
                                                </label>
                                                <label
                                                    class="option-chip flex-1 min-w-[60px] text-center py-3 px-4 border-2 border-gray-200 rounded-xl font-bold cursor-pointer hover:border-primary/50">
                                                    <input type="radio" name="partySize" value="5" class="hidden">
                                                    <span>5</span>
                                                </label>
                                                <label
                                                    class="option-chip flex-1 min-w-[60px] text-center py-3 px-4 border-2 border-gray-200 rounded-xl font-bold cursor-pointer hover:border-primary/50">
                                                    <input type="radio" name="partySize" value="6+" class="hidden">
                                                    <span>6+</span>
                                                </label>
                                            </div>
                                            <div id="largePaxNote"
                                                class="hidden mt-4 p-3 bg-amber-50 border border-amber-200 rounded-xl text-sm text-amber-700">
                                                <span
                                                    class="material-symbols-outlined text-[18px] align-middle mr-1">info</span>
                                                Đặt bàn từ 6 người trở lên, vui lòng gọi Hotline <a href="tel:19001234"
                                                    class="font-bold text-primary underline">1900 1234</a> để được hỗ
                                                trợ tốt nhất.
                                            </div>
                                        </section>

                                        <!-- Section: Date -->
                                        <section class="bg-white rounded-2xl p-5 shadow-sm border border-gray-100">
                                            <h2
                                                class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-4 flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[20px]">calendar_month</span>
                                                Vào ngày nào?
                                            </h2>
                                            <div class="flex gap-2 overflow-x-auto no-scrollbar -mx-1 px-1 pb-2"
                                                id="dateStrip">
                                                <!-- Dates will be generated by JavaScript -->
                                            </div>
                                            <input type="hidden" name="date" id="selectedDate" value="">
                                        </section>

                                        <!-- Section: Time -->
                                        <section class="bg-white rounded-2xl p-5 shadow-sm border border-gray-100">
                                            <h2
                                                class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-4 flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[20px]">schedule</span>
                                                Vào lúc mấy giờ?
                                            </h2>

                                            <!-- Morning -->
                                            <div class="mb-4">
                                                <p class="text-xs font-semibold text-gray-400 mb-2">Sáng (10:00 - 12:00)
                                                </p>
                                                <div class="grid grid-cols-4 lg:grid-cols-6 gap-2" id="morningSlots">
                                                    <!-- Slots generated by JS -->
                                                </div>
                                            </div>

                                            <!-- Afternoon -->
                                            <div class="mb-4">
                                                <p class="text-xs font-semibold text-gray-400 mb-2">Chiều (12:00 -
                                                    18:00)</p>
                                                <div class="grid grid-cols-4 lg:grid-cols-6 gap-2" id="afternoonSlots">
                                                </div>
                                            </div>

                                            <!-- Evening -->
                                            <div>
                                                <p class="text-xs font-semibold text-gray-400 mb-2">Tối (18:00 - 21:30)
                                                </p>
                                                <div class="grid grid-cols-4 lg:grid-cols-6 gap-2" id="eveningSlots">
                                                </div>
                                            </div>

                                            <input type="hidden" name="time" id="selectedTime" value="">
                                            <p id="timeError"
                                                class="hidden mt-3 text-sm text-red-500 flex items-center gap-1">
                                                <span class="material-symbols-outlined text-[16px]">error</span>
                                                Giờ này đã kín, vui lòng chọn khung giờ khác.
                                            </p>
                                        </section>

                                        <!-- Section: User Info -->
                                        <section class="bg-white rounded-2xl p-5 shadow-sm border border-gray-100">
                                            <h2
                                                class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-4 flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[20px]">person</span>
                                                Thông tin liên hệ
                                            </h2>
                                            <div class="space-y-4">
                                                <div>
                                                    <label class="block text-sm font-medium text-gray-600 mb-2">Họ và
                                                        tên <span class="text-red-500">*</span></label>
                                                    <input type="text" name="fullName" id="fullName" required
                                                        value="<%= currentUser != null ? currentUser.getFullName() : "" %>"
                                                        class="w-full border-2 border-gray-200 focus:border-primary rounded-xl px-4 py-3 text-base focus:outline-none focus:ring-4 focus:ring-primary/10 transition-all"
                                                        placeholder="Nhập họ tên của bạn">
                                                </div>
                                                <div>
                                                    <label class="block text-sm font-medium text-gray-600 mb-2">Số điện
                                                        thoại <span class="text-red-500">*</span></label>
                                                    <input type="tel" name="phone" id="phone" required
                                                        value="<%= currentUser != null ? currentUser.getPhoneNumber() : "" %>"
                                                        class="w-full border-2 border-gray-200 focus:border-primary rounded-xl px-4 py-3 text-base focus:outline-none focus:ring-4 focus:ring-primary/10 transition-all"
                                                        placeholder="0901 234 567">
                                                </div>
                                                <div>
                                                    <label class="block text-sm font-medium text-gray-600 mb-2">Ghi chú
                                                        <span class="text-gray-400">(không bắt buộc)</span></label>
                                                    <textarea name="notes" rows="2"
                                                        class="w-full border-2 border-gray-200 focus:border-primary rounded-xl px-4 py-3 text-base focus:outline-none focus:ring-4 focus:ring-primary/10 transition-all resize-none"
                                                        placeholder="VD: Sinh nhật, cần ghế trẻ em, muốn ngồi view cửa sổ..."></textarea>
                                                </div>
                                            </div>
                                        </section>

                                        <!-- Trust Signal -->
                                        <div class="flex items-center justify-center gap-2 text-sm text-gray-500 py-2">
                                            <span
                                                class="material-symbols-outlined text-green-500 text-[18px]">verified</span>
                                            <span>Chúng tôi giữ bàn cho bạn trong 15 phút kể từ giờ hẹn</span>
                                        </div>

                                    </div>

                                    <!-- Right Column: Map & Summary (Desktop only) -->
                                    <aside class="hidden lg:block w-[380px] shrink-0">
                                        <div class="sticky top-24 space-y-6">

                                            <!-- Map -->
                                            <div
                                                class="bg-white rounded-2xl overflow-hidden shadow-sm border border-gray-100">
                                                <div class="aspect-[4/3] bg-gray-200 relative">
                                                    <iframe
                                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.4946681007286!2d106.70042601531945!3d10.771607392325414!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f4670702e31%3A0xa5777fb3a5bb9972!2zMTIzIE5ndXnhu4VuIEh14buHLCBC4bq_biBOZ2jDqSwgUXXhuq1uIDEsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1234567890"
                                                        width="100%" height="100%" style="border:0;" allowfullscreen=""
                                                        loading="lazy" class="absolute inset-0">
                                                    </iframe>
                                                </div>
                                            </div>

                                            <!-- Summary Card -->
                                            <div
                                                class="bg-gradient-to-br from-secondary to-gray-800 rounded-2xl p-6 text-white shadow-lg">
                                                <div class="flex items-center gap-2 mb-4">
                                                    <span
                                                        class="material-symbols-outlined filled text-primary">receipt_long</span>
                                                    <h3 class="font-bold">Thông tin đặt bàn</h3>
                                                </div>
                                                <div class="space-y-3 text-sm">
                                                    <div class="flex justify-between">
                                                        <span class="text-gray-400">Chi nhánh</span>
                                                        <span class="font-semibold" id="summaryBranch">Quận 1</span>
                                                    </div>
                                                    <div class="flex justify-between">
                                                        <span class="text-gray-400">Số khách</span>
                                                        <span class="font-semibold" id="summaryPax">2 người</span>
                                                    </div>
                                                    <div class="flex justify-between">
                                                        <span class="text-gray-400">Ngày</span>
                                                        <span class="font-semibold" id="summaryDate">--</span>
                                                    </div>
                                                    <div class="flex justify-between">
                                                        <span class="text-gray-400">Giờ</span>
                                                        <span class="font-semibold text-primary"
                                                            id="summaryTime">--</span>
                                                    </div>
                                                </div>
                                                <hr class="border-gray-600 my-4">
                                                <button type="submit"
                                                    class="w-full bg-primary hover:bg-primary-hover text-white font-bold py-4 rounded-xl shadow-lg shadow-primary/30 transition-all active:scale-[0.98]">
                                                    Xác nhận đặt bàn
                                                </button>
                                                <p class="text-xs text-gray-400 text-center mt-3">Miễn phí hủy bàn trước
                                                    2 giờ</p>
                                            </div>
                                        </div>
                                    </aside>
                                </div>
                            </form>
                        </div>
                    </main>

                    <!-- Mobile Fixed Footer -->
                    <div
                        class="lg:hidden fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-4 shadow-[0_-4px_20px_rgba(0,0,0,0.08)]">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-sm">
                                <span class="text-gray-500">Đặt bàn cho</span>
                                <span class="font-bold text-secondary" id="mobileSum">2 người</span>
                            </div>
                            <div class="text-right text-sm">
                                <span id="mobileDate" class="font-semibold">--</span>
                                <span class="text-primary font-bold" id="mobileTime">--</span>
                            </div>
                        </div>
                        <button type="submit" form="bookingForm"
                            class="w-full bg-primary hover:bg-primary-hover text-white font-bold py-4 rounded-xl shadow-lg shadow-primary/30 transition-all active:scale-[0.98]">
                            Xác nhận đặt bàn
                        </button>
                    </div>

                    <script>
                        // ============================================
                        // DATE GENERATION
                        // ============================================
                        const dateStrip = document.getElementById('dateStrip');
                        const selectedDateInput = document.getElementById('selectedDate');
                        const today = new Date();
                        const daysOfWeek = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];

                        // Generate next 14 days
                        for (let i = 0; i < 14; i++) {
                            const date = new Date(today);
                            date.setDate(today.getDate() + i);

                            const dayOfWeek = daysOfWeek[date.getDay()];
                            const day = date.getDate();
                            const month = date.getMonth() + 1;
                            const dateStr = `${date.getFullYear()}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`;

                            let label = `${dayOfWeek}, ${day}/${month}`;
                            if (i === 0) label = 'Hôm nay';
                            if (i === 1) label = 'Ngày mai';

                            const isSelected = i === 0;

                            const chip = document.createElement('label');
                            chip.className = `date-chip shrink-0 px-4 py-3 border-2 rounded-xl text-center cursor-pointer transition-all min-w-[90px] ${isSelected ? 'border-primary bg-primary text-white' : 'border-gray-200 bg-white hover:border-primary/50'}`;
                            chip.innerHTML = `
                <input type="radio" name="dateRadio" value="${dateStr}" class="hidden" ${isSelected ? 'checked' : ''}>
                <p class="text-xs ${isSelected ? 'text-white/80' : 'text-gray-400'}">${i <= 1 ? '' : dayOfWeek}</p>
                <p class="font-bold text-sm">${label}</p>
            `;
                            dateStrip.appendChild(chip);

                            if (isSelected) selectedDateInput.value = dateStr;
                        }

                        // Date selection handler
                        document.querySelectorAll('.date-chip').forEach(chip => {
                            chip.addEventListener('click', function () {
                                document.querySelectorAll('.date-chip').forEach(c => {
                                    c.classList.remove('border-primary', 'bg-primary', 'text-white');
                                    c.classList.add('border-gray-200', 'bg-white');
                                    c.querySelector('p:first-child').classList.remove('text-white/80');
                                    c.querySelector('p:first-child').classList.add('text-gray-400');
                                });
                                this.classList.remove('border-gray-200', 'bg-white');
                                this.classList.add('border-primary', 'bg-primary', 'text-white');
                                this.querySelector('p:first-child').classList.remove('text-gray-400');
                                this.querySelector('p:first-child').classList.add('text-white/80');

                                selectedDateInput.value = this.querySelector('input').value;
                                updateTimeSlots();
                                updateSummary();
                            });
                        });

                        // ============================================
                        // TIME SLOTS GENERATION
                        // ============================================
                        const morningSlots = document.getElementById('morningSlots');
                        const afternoonSlots = document.getElementById('afternoonSlots');
                        const eveningSlots = document.getElementById('eveningSlots');
                        const selectedTimeInput = document.getElementById('selectedTime');

                        const morningTimes = ['10:00', '10:30', '11:00', '11:30'];
                        const afternoonTimes = ['12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30'];
                        const eveningTimes = ['18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30'];

                        // Simulated booked slots (In production, fetch from server)
                        const bookedSlots = ['12:00', '19:00', '19:30'];

                        function generateTimeSlots(container, times) {
                            container.innerHTML = '';
                            const now = new Date();
                            const isToday = selectedDateInput.value === `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

                            times.forEach(time => {
                                const [hours, mins] = time.split(':').map(Number);
                                const isPast = isToday && (hours < now.getHours() || (hours === now.getHours() && mins <= now.getMinutes()));
                                const isBooked = bookedSlots.includes(time);
                                const isDisabled = isPast || isBooked;

                                const slot = document.createElement('button');
                                slot.type = 'button';
                                slot.className = `time-slot py-2.5 px-3 border-2 rounded-xl text-sm font-semibold text-center ${isDisabled ? 'disabled bg-gray-50 text-gray-300 border-transparent cursor-not-allowed' : 'border-gray-200 hover:border-primary hover:text-primary'}`;
                                slot.textContent = time;
                                slot.dataset.time = time;

                                if (!isDisabled) {
                                    slot.addEventListener('click', () => selectTimeSlot(slot, time));
                                }

                                container.appendChild(slot);
                            });
                        }

                        function selectTimeSlot(element, time) {
                            document.querySelectorAll('.time-slot').forEach(s => {
                                s.classList.remove('selected', 'bg-primary', 'text-white', 'border-primary');
                                if (!s.classList.contains('disabled')) {
                                    s.classList.add('border-gray-200');
                                }
                            });
                            element.classList.remove('border-gray-200');
                            element.classList.add('selected', 'bg-primary', 'text-white', 'border-primary');
                            selectedTimeInput.value = time;
                            updateSummary();
                        }

                        function updateTimeSlots() {
                            generateTimeSlots(morningSlots, morningTimes);
                            generateTimeSlots(afternoonSlots, afternoonTimes);
                            generateTimeSlots(eveningSlots, eveningTimes);
                            selectedTimeInput.value = '';
                        }

                        // Initial generation
                        updateTimeSlots();

                        // ============================================
                        // PARTY SIZE SELECTION
                        // ============================================
                        document.querySelectorAll('.option-chip').forEach(chip => {
                            chip.addEventListener('click', function () {
                                document.querySelectorAll('.option-chip').forEach(c => c.classList.remove('selected'));
                                this.classList.add('selected');

                                const value = this.querySelector('input').value;
                                document.getElementById('largePaxNote').classList.toggle('hidden', value !== '6+');
                                updateSummary();
                            });
                        });

                        // ============================================
                        // BRANCH SELECTION
                        // ============================================
                        document.querySelectorAll('.branch-option').forEach(option => {
                            option.addEventListener('click', function () {
                                document.querySelectorAll('.branch-option').forEach(o => {
                                    o.classList.remove('border-primary', 'bg-primary/5');
                                    o.classList.add('border-gray-200');
                                    const check = o.querySelector('.bg-primary');
                                    if (check) check.remove();
                                });
                                this.classList.remove('border-gray-200');
                                this.classList.add('border-primary', 'bg-primary/5');

                                // Add check icon
                                const rightDiv = this.querySelector('.text-right');
                                if (!rightDiv.querySelector('.bg-primary')) {
                                    const check = document.createElement('div');
                                    check.className = 'size-6 bg-primary rounded-full flex items-center justify-center mt-2 ml-auto';
                                    check.innerHTML = '<span class="material-symbols-outlined text-white text-[16px]">check</span>';
                                    rightDiv.appendChild(check);
                                }
                                updateSummary();
                            });
                        });

                        // ============================================
                        // UPDATE SUMMARY
                        // ============================================
                        function updateSummary() {
                            // Branch
                            const selectedBranch = document.querySelector('input[name="branch"]:checked');
                            const branchName = selectedBranch?.value === 'quan1' ? 'Quận 1' : 'Quận 3';
                            document.getElementById('summaryBranch').textContent = branchName;

                            // Party size
                            const selectedPax = document.querySelector('.option-chip.selected input')?.value || '2';
                            const paxText = selectedPax + ' người';
                            document.getElementById('summaryPax').textContent = paxText;
                            document.getElementById('mobileSum').textContent = paxText;

                            // Date
                            const dateVal = selectedDateInput.value;
                            if (dateVal) {
                                const [y, m, d] = dateVal.split('-');
                                const dateText = `${d}/${m}/${y}`;
                                document.getElementById('summaryDate').textContent = dateText;
                                document.getElementById('mobileDate').textContent = dateText;
                            }

                            // Time
                            const timeVal = selectedTimeInput.value;
                            if (timeVal) {
                                document.getElementById('summaryTime').textContent = timeVal;
                                document.getElementById('mobileTime').textContent = timeVal;
                            } else {
                                document.getElementById('summaryTime').textContent = '--';
                                document.getElementById('mobileTime').textContent = '--';
                            }
                        }

                        // Initial summary update
                        updateSummary();

                        // ============================================
                        // FORM VALIDATION
                        // ============================================
                        document.getElementById('bookingForm').addEventListener('submit', function (e) {
                            const time = selectedTimeInput.value;
                            const date = selectedDateInput.value;
                            const name = document.getElementById('fullName').value;
                            const phone = document.getElementById('phone').value;

                            if (!date || !time) {
                                e.preventDefault();
                                alert('Vui lòng chọn ngày và giờ đặt bàn');
                                return;
                            }

                            if (!name.trim() || !phone.trim()) {
                                e.preventDefault();
                                alert('Vui lòng nhập đầy đủ thông tin liên hệ');
                                return;
                            }
                        });
                    </script>
                </body>

                </html>