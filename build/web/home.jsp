<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="com.bepcloud.model.User" %>
            <% User currentUser=(User) session.getAttribute("user"); %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Bếp Cloud - Food Delivery</title>

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
                        <aside
                            class="w-1/4 min-w-[280px] max-w-[320px] bg-white border-r border-gray-100 sticky top-0 h-screen overflow-y-auto hidden lg:flex flex-col justify-between p-8">
                            <div class="flex flex-col gap-10">
                                <!-- Branding -->
                                <div class="flex gap-3 items-center px-2">
                                    <div class="bg-primary/10 text-primary p-2 rounded-2xl">
                                        <span class="material-symbols-outlined text-[28px] filled">cloud</span>
                                    </div>
                                    <div class="flex flex-col">
                                        <h1 class="text-secondary text-xl font-black tracking-tight leading-none">Bếp
                                            Cloud</h1>
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
                                    <a href="#"
                                        class="flex items-center gap-4 px-4 py-3.5 rounded-2xl text-gray-400 hover:bg-gray-50 hover:text-secondary transition-all group">
                                        <span class="material-symbols-outlined">explore</span>
                                        <p class="text-sm font-semibold tracking-wide">Khám phá</p>
                                    </a>
                                    <a href="#"
                                        class="flex items-center gap-4 px-4 py-3.5 rounded-2xl text-gray-400 hover:bg-gray-50 hover:text-secondary transition-all group">
                                        <span class="material-symbols-outlined">favorite</span>
                                        <p class="text-sm font-semibold tracking-wide">Yêu thích</p>
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
                                        <div
                                            class="flex items-center gap-4 px-4 py-3 rounded-2xl hover:bg-gray-50 cursor-pointer group transition-all">
                                            <div
                                                class="bg-gray-100 p-2.5 rounded-xl text-gray-500 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                                <span class="material-symbols-outlined text-[20px]">local_pizza</span>
                                            </div>
                                            <p class="text-sm font-bold text-gray-600 group-hover:text-secondary">Pizza
                                                & Pasta</p>
                                        </div>
                                        <div
                                            class="flex items-center gap-4 px-4 py-3 rounded-2xl hover:bg-gray-50 cursor-pointer group transition-all">
                                            <div
                                                class="bg-gray-100 p-2.5 rounded-xl text-gray-500 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                                <span class="material-symbols-outlined text-[20px]">lunch_dining</span>
                                            </div>
                                            <p class="text-sm font-bold text-gray-600 group-hover:text-secondary">Burger
                                                & Fast Food</p>
                                        </div>
                                        <div
                                            class="flex items-center gap-4 px-4 py-3 rounded-2xl hover:bg-gray-50 cursor-pointer group transition-all">
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
                                <div
                                    class="flex items-center gap-3 p-3 rounded-2xl hover:bg-gray-50 cursor-pointer transition-all border border-transparent hover:border-gray-100">
                                    <div
                                        class="size-11 rounded-full bg-gradient-to-tr from-primary to-orange-300 flex items-center justify-center text-white font-black text-lg shadow-md shadow-primary/20">
                                        <%= (currentUser !=null) ? currentUser.getFullName().substring(0, 1) : "A" %>
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-black text-secondary tracking-tight">
                                            <%= (currentUser !=null) ? currentUser.getFullName() : "Alex Nguyen" %>
                                        </span>
                                        <span class="text-[10px] font-bold text-primary uppercase tracking-tighter">
                                            <%= (currentUser !=null) ? currentUser.getRoleName() : "Thành viên Vàng" %>
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
                                    <h2 class="text-secondary text-3xl font-black tracking-tight">Chào buổi sáng, <%=
                                            (currentUser !=null) ? currentUser.getFullName().split(" ")[0] : " Alex" %>
                                            👋</h2>
                                    <p class="text-gray-400 font-medium">Bạn thèm món gì hôm nay?</p>
                                </div>
                                <div class="flex-1 max-w-md relative group">
                                    <div
                                        class="absolute left-5 top-1/2 -translate-y-1/2 z-10 transition-transform group-focus-within:scale-110">
                                        <span class="material-symbols-outlined text-primary">search</span>
                                    </div>
                                    <input type="text" placeholder="Tìm kiếm món ăn, nhà hàng..."
                                        class="w-full bg-white border border-transparent shadow-sm hover:shadow-md focus:shadow-xl focus:border-primary/20 rounded-full py-4 pl-14 pr-6 text-sm font-semibold text-secondary placeholder:text-gray-300 focus:outline-none transition-all">
                                </div>
                            </div>

                            <!-- Flash Sale Banner -->
                            <div
                                class="relative w-full rounded-[3rem] overflow-hidden shadow-2xl group shadow-primary/20">
                                <div
                                    class="absolute inset-0 bg-gradient-to-r from-secondary/90 via-secondary/40 to-transparent z-10">
                                </div>
                                <div class="flex min-h-[360px] flex-col gap-6 bg-cover bg-center bg-no-repeat items-start justify-center px-10 md:px-20 py-12 relative z-20 transition-transform duration-700 group-hover:scale-105"
                                    style="background-image: url('https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop');">
                                    <div
                                        class="flex items-center gap-2 bg-primary text-white px-5 py-2 rounded-full text-[10px] font-black uppercase tracking-[0.25em] shadow-xl shadow-primary/40 animate-pulse">
                                        <span class="material-symbols-outlined text-[16px] filled">bolt</span> Flash
                                        Sale
                                    </div>
                                    <div class="flex flex-col gap-3 max-w-xl">
                                        <h1
                                            class="text-white text-5xl md:text-7xl font-black leading-[1.05] tracking-tighter drop-shadow-2xl">
                                            GIẢM 50% <br /><span class="text-primary italic">COMBO TRƯA</span></h1>
                                        <p class="text-white/80 text-lg font-medium max-w-md">Đánh tan cơn đói với thực
                                            đơn đa dạng chỉ từ 39k. Duy nhất trưa nay!</p>
                                    </div>

                                    <!-- Timer -->
                                    <div class="flex gap-4 py-2">
                                        <div class="flex flex-col items-center gap-1">
                                            <div
                                                class="size-14 bg-white/10 backdrop-blur-xl rounded-2xl flex items-center justify-center border border-white/20 text-white shadow-xl">
                                                <span class="text-xl font-black">02</span>
                                            </div>
                                            <span
                                                class="text-[9px] text-white/50 font-black uppercase tracking-wider">Giờ</span>
                                        </div>
                                        <div class="flex flex-col items-center gap-1">
                                            <div
                                                class="size-14 bg-white/10 backdrop-blur-xl rounded-2xl flex items-center justify-center border border-white/20 text-white shadow-xl">
                                                <span class="text-xl font-black">45</span>
                                            </div>
                                            <span
                                                class="text-[9px] text-white/50 font-black uppercase tracking-wider">Phút</span>
                                        </div>
                                        <div class="flex flex-col items-center gap-1">
                                            <div
                                                class="size-14 bg-primary rounded-2xl flex items-center justify-center text-white shadow-xl shadow-primary/30">
                                                <span class="text-xl font-black">30</span>
                                            </div>
                                            <span
                                                class="text-[9px] text-primary font-black uppercase tracking-wider">Giây</span>
                                        </div>
                                    </div>

                                    <button
                                        class="mt-4 flex items-center gap-3 bg-white text-secondary hover:bg-primary hover:text-white transition-all px-10 py-4 rounded-full font-black text-sm uppercase tracking-widest shadow-2xl shadow-black/30 hover:-translate-y-1 active:scale-95">
                                        Đặt món ngay
                                        <span class="material-symbols-outlined">arrow_forward</span>
                                    </button>
                                </div>
                            </div>

                            <!-- Categories Section -->
                            <div class="flex flex-col gap-6">
                                <div class="flex justify-between items-end">
                                    <h3 class="text-secondary text-2xl font-black tracking-tight">Món cũ, vị mới ✨</h3>
                                    <button
                                        class="text-primary text-xs font-black uppercase tracking-widest hover:underline">Xem
                                        thêm</button>
                                </div>
                                <div class="flex gap-6 overflow-x-auto no-scrollbar pb-4 -mx-2 px-2">
                                    <!-- Recently Ordered Items -->
                                    <div class="flex flex-col items-center gap-3 min-w-[100px] cursor-pointer group">
                                        <div class="size-24 rounded-full bg-cover bg-center border-4 border-white shadow-xl group-hover:border-primary group-hover:scale-105 transition-all duration-300"
                                            style="background-image: url('https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=200&h=200&fit=crop');">
                                        </div>
                                        <p class="text-xs font-black text-center text-secondary tracking-tight">Pizza
                                            Hải Sản</p>
                                    </div>
                                    <div class="flex flex-col items-center gap-3 min-w-[100px] cursor-pointer group">
                                        <div class="size-24 rounded-full bg-cover bg-center border-4 border-white shadow-xl group-hover:border-primary group-hover:scale-105 transition-all duration-300"
                                            style="background-image: url('https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=200&h=200&fit=crop');">
                                        </div>
                                        <p class="text-xs font-black text-center text-secondary tracking-tight">Double
                                            Burger</p>
                                    </div>
                                    <div class="flex flex-col items-center gap-3 min-w-[100px] cursor-pointer group">
                                        <div class="size-24 rounded-full bg-cover bg-center border-4 border-white shadow-xl group-hover:border-primary group-hover:scale-105 transition-all duration-300"
                                            style="background-image: url('https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200&h=200&fit=crop');">
                                        </div>
                                        <p class="text-xs font-black text-center text-secondary tracking-tight">Phúc
                                            Long Tea</p>
                                    </div>
                                    <div class="flex flex-col items-center gap-3 min-w-[100px] cursor-pointer group">
                                        <div class="size-24 rounded-full bg-cover bg-center border-4 border-white shadow-xl group-hover:border-primary group-hover:scale-105 transition-all duration-300"
                                            style="background-image: url('https://images.unsplash.com/photo-1513104890138-7c749659a591?w=200&h=200&fit=crop');">
                                        </div>
                                        <p class="text-xs font-black text-center text-secondary tracking-tight">Pizza
                                            Phô Mai</p>
                                    </div>
                                    <div class="flex flex-col items-center gap-3 min-w-[100px] cursor-pointer group">
                                        <div
                                            class="size-24 rounded-full bg-gray-100 flex items-center justify-center border-4 border-dashed border-gray-200 text-gray-300 group-hover:text-primary group-hover:border-primary transition-all">
                                            <span class="material-symbols-outlined text-[32px]">add</span>
                                        </div>
                                        <p class="text-xs font-bold text-gray-400">Xem thêm</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Trending Grid -->
                            <div class="flex flex-col gap-8 pb-20">
                                <div class="flex justify-between items-end">
                                    <div class="flex flex-col gap-1 text-left">
                                        <h3 class="text-secondary text-3xl font-black tracking-tight">Món đang Hot 🔥
                                        </h3>
                                        <p class="text-gray-400 font-medium">Khám phá những món ăn được yêu thích nhất
                                            tuần này</p>
                                    </div>
                                    <div class="flex gap-4">
                                        <button
                                            class="size-12 rounded-2xl bg-white border border-gray-100 flex items-center justify-center hover:bg-primary hover:text-white hover:border-transparent transition-all shadow-lg shadow-gray-200/50 group">
                                            <span
                                                class="material-symbols-outlined group-hover:-translate-x-1 transition-transform">chevron_left</span>
                                        </button>
                                        <button
                                            class="size-12 rounded-2xl bg-white border border-gray-100 flex items-center justify-center hover:bg-primary hover:text-white hover:border-transparent transition-all shadow-lg shadow-gray-200/50 group">
                                            <span
                                                class="material-symbols-outlined group-hover:translate-x-1 transition-transform">chevron_right</span>
                                        </button>
                                    </div>
                                </div>

                                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-10">
                                    <!-- Product Card 1 -->
                                    <div
                                        class="group bg-white rounded-[2.5rem] p-6 shadow-sm hover:shadow-2xl hover:-translate-y-2 transition-all duration-500 border border-gray-50 flex flex-col gap-5">
                                        <div class="aspect-[16/10] w-full rounded-[2rem] bg-cover bg-center relative overflow-hidden shadow-inner"
                                            style="background-image: url('https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop');">
                                            <div
                                                class="absolute top-5 right-5 bg-white/90 backdrop-blur-md px-4 py-2 rounded-2xl text-xs font-black shadow-lg flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[18px] filled">star</span>
                                                4.9
                                            </div>
                                            <!-- Overlay on hover -->
                                            <div
                                                class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-500 flex items-center justify-center">
                                                <button
                                                    class="bg-white text-secondary px-6 py-3 rounded-full font-black text-xs uppercase tracking-widest transform translate-y-4 group-hover:translate-y-0 transition-all duration-500">Xem
                                                    chi tiết</button>
                                            </div>
                                        </div>
                                        <div class="flex flex-col gap-2 px-2">
                                            <div class="flex justify-between items-start">
                                                <h4
                                                    class="text-2xl font-black text-secondary group-hover:text-primary transition-colors tracking-tight italic">
                                                    Beefsteak Burger Premium</h4>
                                                <span
                                                    class="text-xs font-black text-gray-300 uppercase mt-2 tracking-widest">Fast
                                                    Food</span>
                                            </div>
                                            <p class="text-sm text-gray-400 font-medium line-clamp-2 leading-relaxed">
                                                Thịt bò nhập khẩu từ Úc, kết hợp cùng sốt phô mai tan chảy và rau củ
                                                tươi sạch từ nông trại.</p>
                                        </div>
                                        <div class="flex items-center justify-between mt-auto pt-2 px-2">
                                            <div class="flex flex-col">
                                                <span
                                                    class="text-[10px] text-gray-300 font-black uppercase tracking-widest leading-none mb-1">Giá
                                                    chỉ từ</span>
                                                <span
                                                    class="text-3xl font-black text-primary tracking-tighter italic">89,000đ</span>
                                            </div>
                                            <button
                                                class="size-14 rounded-2xl bg-secondary text-white flex items-center justify-center shadow-2xl shadow-black/20 group-hover:bg-primary group-hover:shadow-primary/40 group-hover:scale-110 transition-all active:scale-95 ring-4 ring-transparent hover:ring-primary/20">
                                                <span class="material-symbols-outlined text-[28px]">add</span>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Product Card 2 -->
                                    <div
                                        class="group bg-white rounded-[2.5rem] p-6 shadow-sm hover:shadow-2xl hover:-translate-y-2 transition-all duration-500 border border-gray-50 flex flex-col gap-5">
                                        <div class="aspect-[16/10] w-full rounded-[2rem] bg-cover bg-center relative overflow-hidden shadow-inner"
                                            style="background-image: url('https://images.unsplash.com/photo-1593504049359-7b7d42c92c8f?q=80&w=2070&auto=format&fit=crop');">
                                            <div
                                                class="absolute top-5 right-5 bg-white/90 backdrop-blur-md px-4 py-2 rounded-2xl text-xs font-black shadow-lg flex items-center gap-2">
                                                <span
                                                    class="material-symbols-outlined text-primary text-[18px] filled">star</span>
                                                4.8
                                            </div>
                                            <div
                                                class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-500 flex items-center justify-center">
                                                <button
                                                    class="bg-white text-secondary px-6 py-3 rounded-full font-black text-xs uppercase tracking-widest transform translate-y-4 group-hover:translate-y-0 transition-all duration-500">Xem
                                                    chi tiết</button>
                                            </div>
                                        </div>
                                        <div class="flex flex-col gap-2 px-2">
                                            <div class="flex justify-between items-start">
                                                <h4
                                                    class="text-2xl font-black text-secondary group-hover:text-primary transition-colors tracking-tight italic">
                                                    Pizza Seafood Supreme</h4>
                                                <span
                                                    class="text-xs font-black text-gray-300 uppercase mt-2 tracking-widest">Italian</span>
                                            </div>
                                            <p class="text-sm text-gray-400 font-medium line-clamp-2 leading-relaxed">
                                                Tôm, mực, thanh cua cùng sốt Thousand Island tuyệt hảo trên đế bánh mỏng
                                                giòn đặc trưng.</p>
                                        </div>
                                        <div class="flex items-center justify-between mt-auto pt-2 px-2">
                                            <div class="flex flex-col">
                                                <span
                                                    class="text-[10px] text-gray-300 font-black uppercase tracking-widest leading-none mb-1">Giá
                                                    chỉ từ</span>
                                                <span
                                                    class="text-3xl font-black text-primary tracking-tighter italic">249,000đ</span>
                                            </div>
                                            <button
                                                class="size-14 rounded-2xl bg-secondary text-white flex items-center justify-center shadow-2xl shadow-black/20 group-hover:bg-primary group-hover:shadow-primary/40 group-hover:scale-110 transition-all active:scale-95 ring-4 ring-transparent hover:ring-primary/20">
                                                <span class="material-symbols-outlined text-[28px]">add</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>

                        <!-- Sidebar Right -->
                        <aside
                            class="w-1/4 min-w-[340px] max-w-[380px] bg-white border-l border-gray-100 sticky top-0 h-screen hidden lg:flex flex-col p-8 gap-10">
                            <!-- Loyalty Widget -->
                            <div
                                class="bg-gradient-to-br from-secondary to-[#483c32] rounded-[2rem] p-6 text-white shadow-2xl shadow-black/20 relative overflow-hidden group">
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
                                        <div
                                            class="size-12 rounded-2xl bg-white/10 backdrop-blur-md flex items-center justify-center border border-white/20">
                                            <span class="material-symbols-outlined text-yellow-400 filled">stars</span>
                                        </div>
                                    </div>
                                    <div class="flex flex-col gap-2">
                                        <div class="flex justify-between text-xs font-black">
                                            <span>1,250 điểm</span>
                                            <span class="text-white/40">Mục tiêu: 2,000</span>
                                        </div>
                                        <div
                                            class="h-2.5 w-full bg-white/10 rounded-full overflow-hidden border border-white/5">
                                            <div
                                                class="h-full bg-gradient-to-r from-primary to-orange-300 w-[62%] rounded-full shadow-lg shadow-primary/50">
                                            </div>
                                        </div>
                                        <p
                                            class="text-[10px] text-white/40 font-bold italic mt-1 uppercase tracking-tighter">
                                            Bạn chỉ còn 750 điểm nữa để thăng hạng Bạch Kim!</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Mini Cart -->
                            <div class="flex flex-col flex-1 gap-6">
                                <div class="flex justify-between items-center px-2">
                                    <h3 class="font-black text-xl text-secondary flex items-center gap-2">
                                        Giỏ hàng
                                        <span
                                            class="bg-primary/10 text-primary text-xs font-black px-2.5 py-1 rounded-lg">2
                                            món</span>
                                    </h3>
                                    <button class="text-gray-300 hover:text-red-500 transition-colors">
                                        <span class="material-symbols-outlined">delete_sweep</span>
                                    </button>
                                </div>

                                <!-- Cart Items List -->
                                <div class="flex-1 overflow-y-auto pr-2 flex flex-col gap-6 no-scrollbar">
                                    <!-- Item 1 -->
                                    <div class="flex gap-4 animate-fade-in group">
                                        <div class="size-20 rounded-2xl bg-cover bg-center shrink-0 shadow-lg group-hover:scale-105 transition-transform"
                                            style="background-image: url('https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=400&fit=crop');">
                                        </div>
                                        <div class="flex flex-col flex-1 justify-between py-1">
                                            <div class="flex justify-between items-start">
                                                <h4
                                                    class="text-sm font-black text-secondary leading-tight line-clamp-1 italic">
                                                    Beefsteak Burger ...</h4>
                                                <button
                                                    class="text-gray-300 hover:text-red-500 transition-all hover:rotate-90">
                                                    <span class="material-symbols-outlined text-sm">close</span>
                                                </button>
                                            </div>
                                            <div class="flex justify-between items-center">
                                                <span class="text-primary text-sm font-black">89,000đ</span>
                                                <div
                                                    class="flex items-center gap-3 bg-gray-50 rounded-xl px-2.5 py-1 text-xs">
                                                    <button
                                                        class="text-gray-400 hover:text-secondary font-black">-</button>
                                                    <span class="font-black text-secondary">1</span>
                                                    <button class="text-primary hover:scale-125 font-black">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Item 2 -->
                                    <div class="flex gap-4 animate-fade-in group">
                                        <div class="size-20 rounded-2xl bg-cover bg-center shrink-0 shadow-lg group-hover:scale-105 transition-transform"
                                            style="background-image: url('https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400&h=400&fit=crop');">
                                        </div>
                                        <div class="flex flex-col flex-1 justify-between py-1">
                                            <div class="flex justify-between items-start">
                                                <h4
                                                    class="text-sm font-black text-secondary leading-tight line-clamp-1 italic">
                                                    Phúc Long Peach Tea</h4>
                                                <button
                                                    class="text-gray-300 hover:text-red-500 transition-all hover:rotate-90">
                                                    <span class="material-symbols-outlined text-sm">close</span>
                                                </button>
                                            </div>
                                            <div class="flex justify-between items-center">
                                                <span class="text-primary text-sm font-black">45,000đ</span>
                                                <div
                                                    class="flex items-center gap-3 bg-gray-50 rounded-xl px-2.5 py-1 text-xs">
                                                    <button
                                                        class="text-gray-400 hover:text-secondary font-black">-</button>
                                                    <span class="font-black text-secondary">2</span>
                                                    <button class="text-primary hover:scale-125 font-black">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Order Summary -->
                                <div
                                    class="p-6 bg-background-light rounded-[2rem] border border-gray-100 flex flex-col gap-4">
                                    <div class="flex flex-col gap-2.5">
                                        <div
                                            class="flex justify-between text-xs font-bold text-gray-400 uppercase tracking-widest">
                                            <span>Tạm tính</span>
                                            <span class="text-secondary tracking-normal">179,000đ</span>
                                        </div>
                                        <div
                                            class="flex justify-between text-xs font-bold text-gray-400 uppercase tracking-widest">
                                            <span>Giao hàng</span>
                                            <span class="text-secondary tracking-normal">15,000đ</span>
                                        </div>
                                        <div
                                            class="flex justify-between items-end pt-4 border-t border-dashed border-gray-200">
                                            <span class="text-xs font-black uppercase text-secondary">Tổng thanh
                                                toán</span>
                                            <span
                                                class="text-3xl font-black text-primary tracking-tighter">194,000đ</span>
                                        </div>
                                    </div>
                                    <button
                                        class="w-full bg-primary hover:bg-primary-hover text-white font-black py-5 rounded-[1.5rem] shadow-2xl shadow-primary/40 transition-all hover:-translate-y-1 active:scale-95 uppercase tracking-widest text-sm mt-2">
                                        Thanh toán ngay
                                    </button>
                                </div>
                            </div>
                        </aside>
                    </div>
                </body>

                </html>