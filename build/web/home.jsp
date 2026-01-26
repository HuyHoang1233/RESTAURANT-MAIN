<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="danran.model.User" %>
<% User currentUser = (User) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danran - Food Delivery</title>

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
                            border: '#f5f2f0',
                            'background-light': '#fAf9f8',
                        },
                        fontFamily: {
                            sans: ['Inter', 'Noto Sans', 'sans-serif'],
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

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(10px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-fade-in {
                animation: fadeIn 0.4s ease-out forwards;
            }
        </style>
    </head>

    <body class="bg-background-light font-sans text-secondary">
        <div class="flex w-full min-h-screen">

            <!-- Sidebar Left -->
            <aside class="w-1/4 min-w-[280px] max-w-[320px] bg-white border-r border-gray-100 sticky top-0 h-screen overflow-y-auto hidden lg:flex flex-col justify-between p-8">
                <div class="flex flex-col gap-10">
                    <!-- Branding -->
                    <div class="flex gap-3 items-center px-2">
                        <div class="bg-primary/10 text-primary p-2 rounded-2xl">
                            <span class="material-symbols-outlined text-[28px] filled">cloud</span>
                        </div>
                        <div class="flex flex-col">
                            <h1 class="text-secondary text-xl font-black tracking-tight leading-none">Danran
                            </h1>
                            <p class="text-primary text-[10px] font-bold uppercase tracking-widest mt-1">
                                Food Delivery</p>
                        </div>
                    </div>

                    <!-- Main Nav -->
                    <nav class="flex flex-col gap-3">
                        <a href="#"
                           class="flex items-center gap-4 px-4 py-3.5 rounded-2xl bg-primary/10 text-primary transition-all group">
                            <span class="material-symbols-outlined filled">home</span>
                            <p class="text-sm font-bold tracking-wide">Trang chủ</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/booking"
                           class="flex items-center gap-4 px-4 py-3.5 rounded-2xl text-gray-400 hover:bg-gray-50 hover:text-secondary transition-all group">
                            <span class="material-symbols-outlined">table_restaurant</span>
                            <p class="text-sm font-semibold tracking-wide">Đặt bàn</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/menu"
                           class="flex items-center gap-4 px-4 py-3.5 rounded-2xl text-gray-400 hover:bg-gray-50 hover:text-secondary transition-all group">
                            <span class="material-symbols-outlined">restaurant_menu</span>
                            <p class="text-sm font-semibold tracking-wide">Menu</p>
                        </a>
                        <a href="#"
                           class="flex items-center gap-4 px-4 py-3.5 rounded-2xl text-gray-400 hover:bg-gray-50 hover:text-secondary transition-all group">
                            <span class="material-symbols-outlined">favorite</span>
                            <p class="text-sm font-semibold tracking-wide">Bán chạy</p>
                        </a>
                        <a href="#"
                           class="flex items-center gap-4 px-4 py-3.5 rounded-2xl text-gray-400 hover:bg-gray-50 hover:text-secondary transition-all group">
                            <span class="material-symbols-outlined">receipt_long</span>
                            <p class="text-sm font-semibold tracking-wide">Đơn hàng</p>
                        </a>
                    </nav>

                    <!-- Categories -->
                    <div class="flex flex-col gap-5">
                        <h3 class="px-4 text-[10px] font-black uppercase tracking-[0.2em] text-gray-300">
                            Danh mục</h3>
                        <div class="flex flex-col gap-2">
                            <div class="flex items-center gap-4 px-4 py-3 rounded-2xl hover:bg-gray-50 cursor-pointer group transition-all">
                                <div class="bg-gray-100 p-2.5 rounded-xl text-gray-500 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                    <span class="material-symbols-outlined text-[20px]">local_pizza</span>
                                </div>
                                <p class="text-sm font-bold text-gray-600 group-hover:text-secondary">Pizza
                                    & Pasta</p>
                            </div>
                            <div class="flex items-center gap-4 px-4 py-3 rounded-2xl hover:bg-gray-50 cursor-pointer group transition-all">
                                <div class="bg-gray-100 p-2.5 rounded-xl text-gray-500 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                    <span class="material-symbols-outlined text-[20px]">lunch_dining</span>
                                </div>
                                <p class="text-sm font-bold text-gray-600 group-hover:text-secondary">Burger
                                    & Fast Food</p>
                            </div>
                            <div class="flex items-center gap-4 px-4 py-3 rounded-2xl hover:bg-gray-50 cursor-pointer group transition-all">
                                <div class="bg-primary/10 p-2.5 rounded-xl text-primary">
                                    <span class="material-symbols-outlined text-[20px]">coffee</span>
                                </div>
                                <p class="text-sm font-bold text-secondary">Cà phê & Trà sữa</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Profile Summary -->
                <div class="mt-auto pt-8 border-t border-gray-100">
                    <div class="flex items-center gap-3 p-3 rounded-2xl hover:bg-gray-50 cursor-pointer transition-all border border-transparent hover:border-gray-100">
                        <div class="size-11 rounded-full bg-gradient-to-tr from-primary to-orange-300 flex items-center justify-center text-white font-black text-lg shadow-md shadow-primary/20">
                            <%= (currentUser != null) ? currentUser.getFullName().substring(0, 1) : "A"%>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm font-black text-secondary tracking-tight">
                                <%= (currentUser != null) ? currentUser.getFullName() : "Alex Nguyen"%>
                            </span>
                            <span class="text-[10px] font-bold text-primary uppercase tracking-tighter">
                                <%= (currentUser != null) ? currentUser.getRoleName() : "Thành viên Vàng"%>
                            </span>
                        </div>
                        <span class="material-symbols-outlined ml-auto text-gray-300">more_vert</span>
                    </div>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="flex-1 flex flex-col min-w-0 p-6 md:p-8 lg:p-12 gap-10 overflow-y-auto">
                <!-- Header & Search -->
                <div class="flex flex-col md:flex-row md:items-center justify-between gap-6">
                    <div class="flex flex-col gap-1">
                        <h2 class="text-secondary text-3xl font-black tracking-tight">Chào buổi sáng, <%=(currentUser != null) ? currentUser.getFullName().split(" ")[0] : " Alex"%>
                            👋</h2>
                        <p class="text-gray-400 font-medium">Bạn thèm món gì hôm nay?</p>
                    </div>
                    <div class="flex-1 max-w-md relative group">
                        <div class="absolute left-5 top-1/2 -translate-y-1/2 z-10 transition-transform group-focus-within:scale-110">
                            <span class="material-symbols-outlined text-primary">search</span>
                        </div>
                        <input type="text" placeholder="Tìm kiếm món ăn, nhà hàng..."
                               class="w-full bg-white border border-transparent shadow-sm hover:shadow-md focus:shadow-xl focus:border-primary/20 rounded-full py-4 pl-14 pr-6 text-sm font-semibold text-secondary placeholder:text-gray-300 focus:outline-none transition-all">
                    </div>
                </div>

                <!-- Flash Sale Banner -->
                <!-- Hero Introduction -->
                <div class="relative w-full rounded-[3rem] overflow-hidden shadow-2xl group shadow-primary/20">
                    <div class="absolute inset-0 bg-gradient-to-r from-secondary/90 via-secondary/50 to-transparent z-10">
                    </div>
                    <div class="flex min-h-[400px] flex-col gap-6 bg-cover bg-center bg-no-repeat items-start justify-center px-10 md:px-20 py-12 relative z-20"
                         style="background-image: url('https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=1974&auto=format&fit=crop');">

                        <div class="flex items-center gap-2 bg-primary text-white px-5 py-2 rounded-full text-[10px] font-black uppercase tracking-[0.25em] shadow-xl shadow-primary/40">
                            <span class="material-symbols-outlined text-[16px] filled">restaurant</span> 
                            Về chúng tôi
                        </div>

                        <div class="flex flex-col gap-4 max-w-2xl">
                            <h1 class="text-white text-5xl md:text-6xl font-black leading-tight tracking-tighter drop-shadow-2xl">
                                Chào mừng đến với <br /> <span class="text-primary italic">Danran</span>
                            </h1>
                            <p class="text-white/90 text-lg font-medium leading-relaxed">
                                Nơi hương vị truyền thống gặp gỡ phong cách hiện đại. Chúng tôi tự hào mang
                                đến trải nghiệm ẩm thực ấm cúng, gắn kết mọi người qua từng món ăn được chế
                                biến từ nguyên liệu tươi ngon nhất.
                            </p>
                        </div>

                        <a href="${pageContext.request.contextPath}/menu"
                           class="mt-4 flex items-center gap-3 bg-white text-secondary hover:bg-primary hover:text-white transition-all px-10 py-4 rounded-full font-black text-sm uppercase tracking-widest shadow-2xl shadow-black/30 hover:-translate-y-1 active:scale-95">
                            Xem Thực Đơn
                            <span class="material-symbols-outlined">arrow_forward</span>
                        </a>
                    </div>
                </div>

                <!-- Achievements Section -->
                <div class="flex flex-col gap-8">
                    <div class="flex flex-col gap-1 text-left">
                        <h3 class="text-secondary text-3xl font-black tracking-tight">Thành tựu của Danran
                            🏆</h3>
                        <p class="text-gray-400 font-medium">Hành trình 5 năm phục vụ khách hàng với niềm
                            đam mê</p>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <!-- Achievement 1 -->
                        <div
                            class="bg-white p-8 rounded-[2rem] border border-gray-100 flex flex-col items-center text-center gap-4 hover:shadow-xl hover:border-primary/20 transition-all duration-300 group">
                            <div
                                class="size-20 rounded-full bg-primary/10 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-all">
                                <span class="material-symbols-outlined text-4xl filled">workspace_premium</span>
                            </div>
                            <div>
                                <h4 class="text-4xl font-black text-secondary mb-1">Top 10</h4>
                                <p class="text-gray-500 font-bold uppercase text-xs tracking-widest">
                                    Nhà hàng yêu thích 2023</p>
                            </div>
                            <p class="text-sm text-gray-400">Được bình chọn bởi cộng đồng ẩm thực Hà Nội.
                            </p>
                        </div>

                        <!-- Achievement 2 -->
                        <div
                            class="bg-white p-8 rounded-[2rem] border border-gray-100 flex flex-col items-center text-center gap-4 hover:shadow-xl hover:border-primary/20 transition-all duration-300 group">
                            <div
                                class="size-20 rounded-full bg-orange-100 text-orange-500 flex items-center justify-center group-hover:bg-orange-500 group-hover:text-white transition-all">
                                <span class="material-symbols-outlined text-4xl filled">groups</span>
                            </div>
                            <div>
                                <h4 class="text-4xl font-black text-secondary mb-1">50.000+</h4>
                                <p class="text-gray-500 font-bold uppercase text-xs tracking-widest">
                                    Khách hàng hài lòng</p>
                            </div>
                            <p class="text-sm text-gray-400">Phục vụ hàng nghìn bữa ăn ngon mỗi tháng.</p>
                        </div>

                        <!-- Achievement 3 -->
                        <div class="bg-white p-8 rounded-[2rem] border border-gray-100 flex flex-col items-center text-center gap-4 hover:shadow-xl hover:border-primary/20 transition-all duration-300 group">
                            <div
                                class="size-20 rounded-full bg-green-100 text-green-500 flex items-center justify-center group-hover:bg-green-500 group-hover:text-white transition-all">
                                <span class="material-symbols-outlined text-4xl filled">eco</span>
                            </div>
                            <div>
                                <h4 class="text-4xl font-black text-secondary mb-1">100%</h4>
                                <p class="text-gray-500 font-bold uppercase text-xs tracking-widest">
                                    Nguyên liệu sạch</p>
                            </div>
                            <p class="text-sm text-gray-400">Cam kết sử dụng thực phẩm tươi ngon, an toàn.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Chef/Story Section -->
                <div class="bg-white rounded-[2.5rem] p-8 md:p-12 shadow-sm border border-gray-50 flex flex-col md:flex-row gap-10 items-center">
                    <div
                        class="w-full md:w-1/2 rounded-[2rem] overflow-hidden shadow-2xl rotate-3 hover:rotate-0 transition-all duration-500">
                        <img src="https://images.unsplash.com/photo-1577106263724-2c8e03bfe9cf?q=80&w=2070&auto=format&fit=crop"
                             class="w-full h-auto object-cover">
                    </div>
                    <div class="w-full md:w-1/2 flex flex-col gap-6">
                        <div class="flex items-center gap-2 text-primary font-black uppercase text-xs tracking-widest">
                            <span class="h-0.5 w-10 bg-primary"></span>
                            Bếp Trưởng
                        </div>
                        <h3 class="text-4xl font-black text-secondary italic">"Nấu ăn là nghệ thuật sẻ chiayêu thương."</h3>
                        <p class="text-gray-500 leading-relaxed text-lg">
                            Tại Danran, mỗi món ăn không chỉ là sự kết hợp của gia vị, mà là tâm huyết của
                            đội ngũ đầu bếp. Chúng tôi mong muốn mang lại cảm giác "đoàn viên" (Danran)
                            trong từng bữa ăn của bạn.
                        </p>
                        <div class="flex items-center gap-4 mt-4">
                            <div class="size-16 rounded-full bg-gray-200 overflow-hidden">
                                <img src="https://images.unsplash.com/photo-1583394838336-acd977736f90?q=80&w=1968&auto=format&fit=crop"
                                     class="w-full h-full object-cover">
                            </div>
                            <div>
                                <h5 class="font-black text-secondary text-lg">Chef Nguyen</h5>
                                <p class="text-primary text-sm font-bold uppercase">Executive Chef</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <%@ include file="fragments/footer.jspf" %>
            </main>

            <!-- Sidebar Right -->
            <aside
                class="w-1/4 min-w-[340px] max-w-[380px] bg-white border-l border-gray-100 sticky top-0 h-screen hidden lg:flex flex-col p-8 gap-10">
                <!-- Loyalty Widget -->
                <div class="bg-gradient-to-br from-secondary to-[#483c32] rounded-[2rem] p-6 text-white shadow-2xl shadow-black/20 relative overflow-hidden group">
                    <div
                        class="absolute -top-10 -right-10 size-40 bg-white/5 rounded-full group-hover:scale-150 transition-transform duration-700">
                    </div>
                    <div class="relative z-10 flex flex-col gap-5">
                        <div class="flex justify-between items-center">
                            <div class="flex flex-col">
                                <h3 class="font-black text-lg tracking-tight uppercase">Thành viên Vàng</h3>
                                <p class="text-[10px] text-white/50 font-bold uppercase tracking-widest">
                                    Loyalty Program</p>
                            </div>
                            <div class="size-12 rounded-2xl bg-white/10 backdrop-blur-md flex items-center justify-center border border-white/20">
                                <span class="material-symbols-outlined text-yellow-400 filled">stars</span>
                            </div>
                        </div>
                        <div class="flex flex-col gap-2">
                            <div class="flex justify-between text-xs font-black">
                                <span>1,250 điểm</span>
                                <span class="text-white/40">Mục tiêu: 2,000</span>
                            </div>
                            <div class="h-2.5 w-full bg-white/10 rounded-full overflow-hidden border border-white/5">
                                <div
                                    class="h-full bg-gradient-to-r from-primary to-orange-300 w-[62%] rounded-full shadow-lg shadow-primary/50">
                                </div>
                            </div>
                            <p class="text-[10px] text-white/40 font-bold italic mt-1 uppercase tracking-tighter">
                                Bạn chỉ còn 750 điểm nữa để thăng hạng Bạch Kim!</p>
                        </div>
                    </div>
                </div>

                <!-- Simple Info Box instead of Cart -->
                <div class="p-6 bg-blue-50 rounded-[2rem] border border-blue-100 flex flex-col gap-3 text-center">
                    <span class="material-symbols-outlined text-4xl text-blue-500">info</span>
                    <h3 class="font-bold text-blue-900">Thông báo</h3>
                    <p class="text-sm text-blue-700">Giờ mở cửa: 08:00 - 22:00 <br /> 
                        Tất cả các ngày trong tuần.</p>
                </div>
            </aside>
        </div>
    </body>

</html>