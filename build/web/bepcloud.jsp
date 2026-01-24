<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bếp Cloud - Quản lý nhà hàng nhàn tênh</title>
            <meta name="description"
                content="Hệ sinh thái công nghệ hàng đầu cho ngành F&B Việt Nam. Giúp nhà hàng vận hành chuyên nghiệp và hiệu quả hơn.">

            <!-- Tailwind CSS -->
            <script src="https://cdn.tailwindcss.com"></script>

            <!-- Google Fonts -->
            <link
                href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Noto+Sans:wght@400;500;700&display=swap"
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
                                'text-sub': '#4A5568',
                            },
                            fontFamily: {
                                sans: ['Inter', 'Noto Sans', 'sans-serif'],
                            },
                        }
                    }
                }
            </script>

            <style>
                /* Glass Header Effect */
                .glass-header {
                    background: rgba(255, 255, 255, 0.8);
                    backdrop-filter: blur(12px);
                    -webkit-backdrop-filter: blur(12px);
                }

                /* Float Animations */
                @keyframes float {

                    0%,
                    100% {
                        transform: translateY(0px);
                    }

                    50% {
                        transform: translateY(-10px);
                    }
                }

                .animate-float {
                    animation: float 4s ease-in-out infinite;
                }

                .animate-float-delayed {
                    animation: float 5s ease-in-out infinite;
                    animation-delay: 1s;
                }

                /* Fade In Animation */
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

                .fade-in-up {
                    animation: fadeInUp 0.5s ease-out forwards;
                }

                /* Pulse Animation */
                @keyframes pulse {

                    0%,
                    100% {
                        opacity: 1;
                    }

                    50% {
                        opacity: 0.5;
                    }
                }

                .animate-pulse {
                    animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
                }
            </style>
        </head>

        <body class="bg-[#F7FAFC] text-[#181410] font-sans min-h-screen">

            <%@ include file="WEB-INF/fragments/header.jspf" %>

                <main>
                    <!-- ==================== HERO SECTION ==================== -->
                    <section class="relative pt-32 pb-20 lg:pt-48 lg:pb-32 overflow-hidden bg-white">
                        <div class="container mx-auto px-4 grid lg:grid-cols-2 gap-16 items-center">
                            <!-- Hero Content -->
                            <div class="z-10">
                                <div
                                    class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 text-primary text-xs font-bold uppercase tracking-wider mb-8">
                                    <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                    Giải pháp F&B toàn diện
                                </div>
                                <h1
                                    class="text-5xl lg:text-7xl font-black text-secondary leading-[1.1] mb-6 tracking-tight">
                                    Quản lý nhà hàng <br />
                                    <span
                                        class="text-transparent bg-clip-text bg-gradient-to-r from-primary to-orange-400">nhàn
                                        tênh</span> chỉ với 1 chạm
                                </h1>
                                <p class="text-lg text-text-sub mb-10 max-w-lg leading-relaxed">
                                    Tối ưu quy trình order, kiểm soát thất thoát nguyên liệu và tăng doanh thu lên đến
                                    30%
                                    với giải pháp công nghệ tin cậy.
                                </p>

                                <!-- Phone Input Form -->
                                <div class="max-w-md">
                                    <form action="${pageContext.request.contextPath}/contact" method="POST"
                                        class="relative group">
                                        <span
                                            class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-gray-400">call</span>
                                        <input type="tel" name="phone" placeholder="Nhập số điện thoại của bạn"
                                            class="w-full h-16 pl-12 pr-44 bg-gray-50 border border-gray-200 rounded-full focus:ring-4 focus:ring-primary/20 focus:border-primary outline-none transition-all"
                                            required />
                                        <button type="submit"
                                            class="absolute right-1.5 top-1.5 h-[52px] px-8 bg-primary hover:bg-primary-hover text-white font-bold rounded-full transition-all shadow-md flex items-center gap-2">
                                            Dùng thử ngay
                                            <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                                        </button>
                                    </form>
                                    <p class="mt-4 text-xs text-gray-400 pl-4 italic">* Miễn phí trải nghiệm 14 ngày,
                                        không
                                        cần thẻ tín dụng.</p>
                                </div>

                                <!-- Success/Error Messages from Servlet -->
                                <c:if test="${not empty successMessage}">
                                    <div class="mt-4 p-4 bg-green-100 text-green-700 rounded-xl">
                                        ${successMessage}
                                    </div>
                                </c:if>
                                <c:if test="${not empty errorMessage}">
                                    <div class="mt-4 p-4 bg-red-100 text-red-700 rounded-xl">
                                        ${errorMessage}
                                    </div>
                                </c:if>
                            </div>

                            <!-- Hero Image -->
                            <div class="relative">
                                <!-- Background Blurs -->
                                <div
                                    class="absolute -top-20 -right-20 w-80 h-80 bg-blue-100 rounded-full blur-3xl opacity-50">
                                </div>
                                <div
                                    class="absolute -bottom-20 -left-20 w-80 h-80 bg-orange-100 rounded-full blur-3xl opacity-50">
                                </div>

                                <!-- Dashboard Preview -->
                                <div
                                    class="relative rounded-[2.5rem] shadow-2xl overflow-hidden border-8 border-white bg-gray-100 transform lg:rotate-3 hover:rotate-0 transition-transform duration-700 aspect-[4/3]">
                                    <img src="https://picsum.photos/seed/dashboard/1200/900" alt="Bếp Cloud Dashboard"
                                        class="w-full h-full object-cover" />

                                    <!-- Floating Widget - Revenue -->
                                    <div
                                        class="absolute top-10 -left-6 bg-white p-4 rounded-2xl shadow-xl flex items-center gap-3 animate-float">
                                        <div
                                            class="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600">
                                            <span class="material-symbols-outlined">trending_up</span>
                                        </div>
                                        <div>
                                            <p class="text-[10px] text-gray-400 font-bold uppercase">Doanh thu hôm nay
                                            </p>
                                            <p class="text-sm font-bold text-gray-900">+ 12,500,000đ</p>
                                        </div>
                                    </div>

                                    <!-- Floating Widget - Orders -->
                                    <div
                                        class="absolute bottom-10 -right-6 bg-white p-4 rounded-2xl shadow-xl flex items-center gap-3 animate-float-delayed">
                                        <div
                                            class="w-10 h-10 rounded-full bg-orange-100 flex items-center justify-center text-primary">
                                            <span class="material-symbols-outlined">restaurant</span>
                                        </div>
                                        <div>
                                            <p class="text-[10px] text-gray-400 font-bold uppercase">Đơn bếp mới</p>
                                            <p class="text-sm font-bold text-gray-900">5 Đơn chờ</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- ==================== SOCIAL PROOF ==================== -->
                    <section class="py-12 bg-gray-50 border-y border-gray-100">
                        <div class="container mx-auto px-4">
                            <p class="text-center text-xs font-bold text-gray-400 uppercase tracking-[0.2em] mb-8">Được
                                tin
                                dùng bởi hơn 2000+ nhà hàng</p>
                            <div
                                class="flex flex-wrap justify-center items-center gap-8 md:gap-16 opacity-40 hover:opacity-100 transition-opacity duration-500">
                                <!-- Partner 1 -->
                                <div
                                    class="flex items-center gap-2 grayscale hover:grayscale-0 transition-all cursor-default">
                                    <span class="material-symbols-outlined text-2xl text-gray-700">coffee</span>
                                    <span class="text-xl font-black text-gray-700 tracking-tighter">COFFEEHOUSE</span>
                                </div>
                                <!-- Partner 2 -->
                                <div
                                    class="flex items-center gap-2 grayscale hover:grayscale-0 transition-all cursor-default">
                                    <span class="material-symbols-outlined text-2xl text-gray-700">bakery_dining</span>
                                    <span class="text-xl font-black text-gray-700 tracking-tighter">BAKERY</span>
                                </div>
                                <!-- Partner 3 -->
                                <div
                                    class="flex items-center gap-2 grayscale hover:grayscale-0 transition-all cursor-default">
                                    <span class="material-symbols-outlined text-2xl text-gray-700">ramen_dining</span>
                                    <span class="text-xl font-black text-gray-700 tracking-tighter">NOODLE</span>
                                </div>
                                <!-- Partner 4 -->
                                <div
                                    class="flex items-center gap-2 grayscale hover:grayscale-0 transition-all cursor-default">
                                    <span class="material-symbols-outlined text-2xl text-gray-700">local_pizza</span>
                                    <span class="text-xl font-black text-gray-700 tracking-tighter">PIZZABOX</span>
                                </div>
                                <!-- Partner 5 -->
                                <div
                                    class="flex items-center gap-2 grayscale hover:grayscale-0 transition-all cursor-default">
                                    <span class="material-symbols-outlined text-2xl text-gray-700">local_bar</span>
                                    <span class="text-xl font-black text-gray-700 tracking-tighter">PUB & BAR</span>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- ==================== FEATURES SECTION ==================== -->
                    <section id="features" class="py-24 bg-white">
                        <div class="container mx-auto px-4">
                            <!-- Section Header -->
                            <div class="text-center max-w-2xl mx-auto mb-16">
                                <h2 class="text-4xl font-black text-secondary mb-4 tracking-tight">Tính năng vượt trội
                                    cho
                                    F&B</h2>
                                <p class="text-text-sub text-lg">Mọi thứ bạn cần để vận hành trơn tru từ phòng bàn, bếp
                                    bar
                                    đến báo cáo quản trị.</p>
                            </div>

                            <!-- Features Grid -->
                            <div class="grid md:grid-cols-3 gap-8">
                                <!-- Feature 1 - QR Order -->
                                <div
                                    class="p-10 rounded-[2.5rem] bg-[#F7FAFC] hover:bg-white border border-transparent hover:border-gray-100 hover:shadow-2xl transition-all duration-300 group">
                                    <div
                                        class="w-16 h-16 rounded-2xl flex items-center justify-center mb-8 group-hover:scale-110 transition-transform duration-300 bg-blue-50 text-blue-600">
                                        <span class="material-symbols-outlined text-3xl">qr_code_scanner</span>
                                    </div>
                                    <h3 class="text-xl font-extrabold text-secondary mb-4">Order QR tại bàn</h3>
                                    <p class="text-text-sub leading-relaxed">Khách hàng tự quét mã gọi món, đơn hàng
                                        chuyển
                                        thẳng xuống bếp. Giảm 90% sai sót và tiết kiệm chi phí nhân sự phục vụ.</p>
                                </div>

                                <!-- Feature 2 - KDS -->
                                <div
                                    class="p-10 rounded-[2.5rem] bg-[#F7FAFC] hover:bg-white border border-transparent hover:border-gray-100 hover:shadow-2xl transition-all duration-300 group">
                                    <div
                                        class="w-16 h-16 rounded-2xl flex items-center justify-center mb-8 group-hover:scale-110 transition-transform duration-300 bg-orange-50 text-primary">
                                        <span class="material-symbols-outlined text-3xl">skillet</span>
                                    </div>
                                    <h3 class="text-xl font-extrabold text-secondary mb-4">Hệ thống Bếp (KDS)</h3>
                                    <p class="text-text-sub leading-relaxed">Màn hình hiển thị món trực quan, sắp xếp
                                        khoa
                                        học theo thời gian thực. Giúp đầu bếp chế biến đúng thứ tự, không sót món.</p>
                                </div>

                                <!-- Feature 3 - Reports -->
                                <div
                                    class="p-10 rounded-[2.5rem] bg-[#F7FAFC] hover:bg-white border border-transparent hover:border-gray-100 hover:shadow-2xl transition-all duration-300 group">
                                    <div
                                        class="w-16 h-16 rounded-2xl flex items-center justify-center mb-8 group-hover:scale-110 transition-transform duration-300 bg-green-50 text-green-600">
                                        <span class="material-symbols-outlined text-3xl">bar_chart</span>
                                    </div>
                                    <h3 class="text-xl font-extrabold text-secondary mb-4">Báo cáo Real-time</h3>
                                    <p class="text-text-sub leading-relaxed">Nắm bắt doanh thu, lợi nhuận, tồn kho mọi
                                        lúc
                                        mọi nơi trên điện thoại. Ra quyết định kinh doanh chính xác dựa trên số liệu.
                                    </p>
                                </div>
                            </div>

                            <!-- View All Button -->
                            <div class="mt-16 text-center">
                                <a href="${pageContext.request.contextPath}/features"
                                    class="inline-flex items-center gap-2 text-primary font-bold hover:gap-4 transition-all group">
                                    Xem tất cả tính năng
                                    <span class="material-symbols-outlined">arrow_forward</span>
                                </a>
                            </div>
                        </div>
                    </section>

                    <!-- ==================== AI CONSULTANT SECTION ==================== -->
                    <section class="py-24 bg-secondary text-white relative overflow-hidden">
                        <div class="absolute top-0 right-0 w-1/3 h-full bg-primary/10 blur-[120px]"></div>
                        <div class="container mx-auto px-4 relative z-10">
                            <div
                                class="max-w-4xl mx-auto bg-white/5 border border-white/10 backdrop-blur-md rounded-[3rem] p-8 md:p-12">
                                <div class="flex flex-col md:flex-row gap-12 items-center">
                                    <!-- Form Section -->
                                    <div class="flex-1">
                                        <h2 class="text-3xl font-black mb-6">Tư vấn AI thông minh</h2>
                                        <p class="text-gray-400 mb-8 leading-relaxed">Bạn gặp khó khăn gì trong quản lý?
                                            Hãy
                                            hỏi AI Assistant của Bếp Cloud để nhận giải pháp tối ưu ngay lập tức.</p>

                                        <form id="aiConsultForm" class="space-y-4">
                                            <!-- Business Type -->
                                            <div>
                                                <label class="block text-xs font-bold text-gray-500 uppercase mb-2">Loại
                                                    hình kinh doanh</label>
                                                <select id="businessType"
                                                    class="w-full h-14 px-4 bg-white/10 border border-white/20 rounded-2xl focus:ring-2 focus:ring-primary outline-none text-white">
                                                    <option class="text-black" value="Quán Cafe">Quán Cafe</option>
                                                    <option class="text-black" value="Nhà hàng lẩu">Nhà hàng lẩu
                                                    </option>
                                                    <option class="text-black" value="Tiệm bánh">Tiệm bánh</option>
                                                    <option class="text-black" value="Bar/Pub">Bar/Pub</option>
                                                </select>
                                            </div>

                                            <!-- Challenge Input -->
                                            <div>
                                                <label class="block text-xs font-bold text-gray-500 uppercase mb-2">Vấn
                                                    đề
                                                    bạn đang gặp</label>
                                                <textarea id="challengeInput"
                                                    placeholder="VD: Khách hàng hay phàn nàn về việc chờ món lâu..."
                                                    class="w-full h-32 p-4 bg-white/10 border border-white/20 rounded-2xl focus:ring-2 focus:ring-primary outline-none text-white resize-none"></textarea>
                                            </div>

                                            <!-- Submit Button -->
                                            <button type="submit" id="aiSubmitBtn"
                                                class="w-full h-14 bg-primary hover:bg-primary-hover text-white font-bold rounded-2xl transition-all flex items-center justify-center gap-2 disabled:opacity-50">
                                                <span id="btnText">Nhận tư vấn ngay</span>
                                                <span id="btnIcon" class="material-symbols-outlined">auto_awesome</span>
                                            </button>
                                        </form>
                                    </div>

                                    <!-- AI Response Panel -->
                                    <div
                                        class="w-full md:w-80 h-[400px] bg-white/10 rounded-[2rem] p-6 border border-white/10 overflow-y-auto">
                                        <div class="flex items-center gap-2 mb-4 border-b border-white/10 pb-4">
                                            <span class="w-2 h-2 rounded-full bg-green-500 animate-pulse"></span>
                                            <span class="text-sm font-bold">AI Assistant</span>
                                        </div>

                                        <!-- Default State -->
                                        <div id="aiDefaultState"
                                            class="h-full flex flex-col items-center justify-center text-center opacity-50">
                                            <span class="material-symbols-outlined text-4xl mb-2">robot_2</span>
                                            <p class="text-sm">Điền thông tin bên trái để bắt đầu cuộc hội thoại.</p>
                                        </div>

                                        <!-- Response State (Hidden by default) -->
                                        <div id="aiResponseState" class="hidden space-y-4 fade-in-up">
                                            <p id="aiResponseText"
                                                class="text-gray-200 text-sm leading-relaxed whitespace-pre-wrap"></p>
                                            <div class="p-3 bg-primary/20 rounded-xl border border-primary/30">
                                                <p class="text-[10px] uppercase font-bold text-primary mb-1">Gợi ý tính
                                                    năng
                                                </p>
                                                <p class="text-xs font-semibold">Thử ngay Order QR tại bàn để giảm 50%
                                                    thời
                                                    gian phục vụ!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </main>

                <%@ include file="WEB-INF/fragments/footer.jspf" %>

                    <!-- ==================== JAVASCRIPT ==================== -->
                    <script>
                        // AI Consultant Form Handler with AJAX
                        document.getElementById('aiConsultForm').addEventListener('submit', function (e) {
                            e.preventDefault();

                            const businessType = document.getElementById('businessType').value;
                            const challenge = document.getElementById('challengeInput').value;
                            const btnText = document.getElementById('btnText');
                            const btnIcon = document.getElementById('btnIcon');
                            const submitBtn = document.getElementById('aiSubmitBtn');
                            const defaultState = document.getElementById('aiDefaultState');
                            const responseState = document.getElementById('aiResponseState');
                            const responseText = document.getElementById('aiResponseText');

                            if (!challenge.trim()) {
                                alert('Vui lòng nhập vấn đề bạn đang gặp phải');
                                return;
                            }

                            // Show loading state
                            submitBtn.disabled = true;
                            btnText.textContent = 'Đang phân tích...';
                            btnIcon.style.display = 'none';

                            // AJAX call to servlet (update URL to match your servlet mapping)
                            fetch('${pageContext.request.contextPath}/api/ai-consult', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded',
                                },
                                body: 'businessType=' + encodeURIComponent(businessType) + '&challenge=' + encodeURIComponent(challenge)
                            })
                                .then(response => response.json())
                                .then(data => {
                                    // Show response
                                    defaultState.classList.add('hidden');
                                    responseState.classList.remove('hidden');
                                    responseText.textContent = data.advice || data.message;

                                    // Reset button
                                    submitBtn.disabled = false;
                                    btnText.textContent = 'Nhận tư vấn ngay';
                                    btnIcon.style.display = 'inline';
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    // Fallback: Generate sample response locally
                                    let response = generateLocalResponse(businessType, challenge);

                                    defaultState.classList.add('hidden');
                                    responseState.classList.remove('hidden');
                                    responseText.textContent = response;

                                    submitBtn.disabled = false;
                                    btnText.textContent = 'Nhận tư vấn ngay';
                                    btnIcon.style.display = 'inline';
                                });
                        });

                        // Fallback local response generator
                        function generateLocalResponse(businessType, challenge) {
                            let response = '';

                            switch (businessType) {
                                case 'Quán Cafe':
                                    response = 'Với quán Cafe, vấn đề "' + challenge + '" có thể được giải quyết bằng:\n\n1. Order QR tại bàn: Giảm thời gian chờ và sai sót khi gọi món\n\n2. Hệ thống KDS: Đồng bộ đơn hàng với bar pha chế\n\n3. Báo cáo Real-time: Theo dõi nguyên liệu và doanh thu theo giờ cao điểm';
                                    break;
                                case 'Nhà hàng lẩu':
                                    response = 'Với nhà hàng lẩu, vấn đề "' + challenge + '" có thể được giải quyết bằng:\n\n1. Quản lý bàn thông minh: Tối ưu sức chứa và thời gian phục vụ\n\n2. Order QR: Gọi thêm nguyên liệu nhanh chóng\n\n3. Kiểm soát kho: Theo dõi định lượng nguyên liệu theo từng suất';
                                    break;
                                case 'Tiệm bánh':
                                    response = 'Với tiệm bánh, vấn đề "' + challenge + '" có thể được giải quyết bằng:\n\n1. Quản lý kho nguyên liệu: Theo dõi hạn sử dụng và số lượng\n\n2. Đặt hàng trước: Hệ thống đặt bánh online\n\n3. Báo cáo bán hàng: Phân tích sản phẩm bán chạy';
                                    break;
                                case 'Bar/Pub':
                                    response = 'Với Bar/Pub, vấn đề "' + challenge + '" có thể được giải quyết bằng:\n\n1. Order QR: Phục vụ nhanh trong không gian đông đúc\n\n2. Hệ thống KDS cho Bar: Quản lý đơn pha chế hiệu quả\n\n3. Quản lý inventory: Kiểm soát rượu bia tồn kho';
                                    break;
                                default:
                                    response = 'Cảm ơn bạn đã chia sẻ. Bếp Cloud có thể giúp bạn giải quyết vấn đề "' + challenge + '" với các tính năng Order QR, KDS và Báo cáo Real-time.';
                            }

                            return response;
                        }
                    </script>
        </body>

        </html>