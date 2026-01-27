<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Danran</title>
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
                        colors: {primary: '#ff6a00', secondary: '#181410'}
                    }
                }
            }
        </script>
    </head>

    <body class="bg-gray-50 font-sans">

        <!-- Kiểm tra đăng nhập -->
        <% if (session.getAttribute("userPhone") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            danran.model.User currentUser = (danran.model.User) session.getAttribute("user");%>

        <div class="flex h-screen overflow-hidden">
            <!-- Sidebar -->
            <aside class="w-64 bg-secondary text-white flex flex-col">
                <div class="p-6 flex items-center gap-2">
                    <span class="material-symbols-outlined text-primary">soup_kitchen</span>
                    <span class="text-xl font-bold">Danran</span>
                </div>
                <nav class="flex-1 px-4 space-y-2 mt-4">
                    <a href="#" class="flex items-center gap-3 p-3 bg-primary rounded-xl text-white font-bold">
                        <span class="material-symbols-outlined">dashboard</span> Dashboard
                    </a>
                    <a href="admin/menu"
                       class="flex items-center gap-3 p-3 hover:bg-white/5 rounded-xl transition-colors">
                        <span class="material-symbols-outlined">restaurant_menu</span> Thực đơn
                    </a>
                    <a href="#" class="flex items-center gap-3 p-3 hover:bg-white/5 rounded-xl transition-colors">
                        <span class="material-symbols-outlined">inventory_2</span> Kho hàng
                    </a>
                    <a href="#" class="flex items-center gap-3 p-3 hover:bg-white/5 rounded-xl transition-colors">
                        <span class="material-symbols-outlined">analytics</span> Báo cáo
                    </a>
                </nav>
                <div class="p-4 border-t border-white/10">
                    <a href="logout"
                       class="flex items-center gap-3 p-3 text-red-400 hover:bg-red-400/10 rounded-xl transition-colors">
                        <span class="material-symbols-outlined">logout</span> Đăng xuất
                    </a>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="flex-1 flex flex-col overflow-hidden">
                <!-- Top Header -->
                <header class="h-20 bg-white border-b border-gray-100 flex items-center justify-between px-8">
                    <h2 class="text-xl font-bold text-secondary">Tổng quan</h2>
                    <div class="flex items-center gap-4">
                        <div class="text-right">
                            <p class="text-sm font-bold">
                                <%= (currentUser != null) ? currentUser.getPhoneNumber()
                                            : session.getAttribute("userPhone")%>
                            </p>
                            <p class="text-[10px] text-gray-400 uppercase font-black">
                                <%= (currentUser != null && currentUser.getRoleName() != null)
                                            ? currentUser.getRoleName() : "Người dùng"%>
                            </p>
                        </div>
                    </div>
                </header>

                <!-- Scrollable Content -->
                <div class="flex-1 overflow-y-auto p-8 space-y-10">
                    <!-- Welcome Section -->
                    <div>
                        <h3 class="text-3xl font-black text-secondary leading-tight">
                            Chào buổi tối, <span class="text-primary">
                                <%= (currentUser != null) ? currentUser.getFullName() : "Chủ quán"%>
                            </span>! 👋
                        </h3>
                        <p class="text-gray-400 font-medium mt-1">Dưới đây là tình hình kinh doanh của <span
                                class="text-secondary font-bold">nhà hàng</span> hôm nay.</p>
                    </div>

                    <!-- Stats Grid -->
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        <!-- Card 1 -->
                        <div
                            class="bg-white p-6 rounded-[2rem] border border-gray-100 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group">
                            <div
                                class="w-12 h-12 rounded-2xl bg-orange-50 text-primary flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined">payments</span>
                            </div>
                            <p class="text-gray-400 text-[10px] font-black uppercase tracking-widest mb-1">Doanh thu
                            </p>
                            <h4 class="text-2xl font-black text-secondary">0 <span
                                    class="text-sm font-bold text-gray-300">VNĐ</span></h4>
                        </div>
                        <!-- Card 2 -->
                        <div
                            class="bg-white p-6 rounded-[2rem] border border-gray-100 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group">
                            <div
                                class="w-12 h-12 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined">receipt_long</span>
                            </div>
                            <p class="text-gray-400 text-[10px] font-black uppercase tracking-widest mb-1">Đơn hàng
                            </p>
                            <h4 class="text-2xl font-black text-secondary">0 <span
                                    class="text-sm font-bold text-gray-300">Đơn</span></h4>
                        </div>
                        <!-- Card 3 -->
                        <div
                            class="bg-white p-6 rounded-[2rem] border border-gray-100 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group">
                            <div
                                class="w-12 h-12 rounded-2xl bg-green-50 text-green-600 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined">groups</span>
                            </div>
                            <p class="text-gray-400 text-[10px] font-black uppercase tracking-widest mb-1">Khách
                                hàng</p>
                            <h4 class="text-2xl font-black text-secondary">0 <span
                                    class="text-sm font-bold text-gray-300">Người</span></h4>
                        </div>
                        <!-- Card 4 -->
                        <div
                            class="bg-white p-6 rounded-[2rem] border border-gray-100 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group">
                            <div
                                class="w-12 h-12 rounded-2xl bg-purple-50 text-purple-600 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined">star</span>
                            </div>
                            <p class="text-gray-400 text-[10px] font-black uppercase tracking-widest mb-1">Đánh giá
                                tốt</p>
                            <h4 class="text-2xl font-black text-secondary">100 <span
                                    class="text-sm font-bold text-gray-300">%</span></h4>
                        </div>
                    </div>

                    <!-- Action Section -->
                    <div
                        class="bg-white rounded-[3rem] border border-gray-100 p-12 text-center relative overflow-hidden group">
                        <div
                            class="absolute top-0 right-0 w-64 h-64 bg-primary/5 rounded-full -mr-32 -mt-32 blur-3xl group-hover:bg-primary/10 transition-all duration-700">
                        </div>
                        <div class="relative z-10 flex flex-col items-center">
                            <div
                                class="w-24 h-24 bg-gray-50 rounded-full flex items-center justify-center mb-8 shadow-inner">
                                <span
                                    class="material-symbols-outlined text-5xl text-gray-300">restaurant_menu</span>
                            </div>
                            <h4 class="text-2xl font-black text-secondary mb-4">Mời bạn tạo thực đơn!</h4>
                            <p class="text-text-secondary max-w-sm mb-10 leading-relaxed">
                                Thêm các món ăn đặc sắc của quán để bắt đầu nhận những đơn hàng đầu tiên từ khách
                                hàng nhé.
                            </p>
                            <button
                                class="bg-primary hover:bg-primary-hover text-white font-black py-4 px-12 rounded-full shadow-2xl shadow-primary/30 transform transition-all hover:scale-105 active:scale-95 flex items-center gap-2">
                                <span class="material-symbols-outlined">add_circle</span>
                                Thiết lập thực đơn
                            </button>
                        </div>
                    </div>
                </div>
            </main>
        </div>

    </body>

</html>