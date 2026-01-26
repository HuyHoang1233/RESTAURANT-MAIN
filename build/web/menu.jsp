<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ page import="danran.model.User" %>
                <% User currentUser=(User) session.getAttribute("user"); %>
                    <!DOCTYPE html>
                    <html lang="vi">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Thực đơn & Đặt món - Danran</title>
                        <meta name="description"
                            content="Khám phá thực đơn đa dạng với hơn 100 món ăn và đồ uống. Đặt món trực tuyến, giao hàng tận nơi.">
                        <meta name="keywords" content="Thực đơn, Đặt đồ ăn, Danran, Food Delivery">

                        <!-- Tailwind CSS -->
                        <script src="https://cdn.tailwindcss.com"></script>

                        <!-- Google Fonts -->
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
                                            border: '#f0eeec',
                                            'background-light': '#faf9f8',
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

                            /* Smooth scroll behavior */
                            html {
                                scroll-behavior: smooth;
                            }

                            /* Scroll margin for anchor links */
                            .scroll-mt-nav {
                                scroll-margin-top: 140px;
                            }

                            @media (min-width: 1024px) {
                                .scroll-mt-nav {
                                    scroll-margin-top: 100px;
                                }
                            }

                            /* Category pill active state */
                            .category-pill.active {
                                background-color: #ff6a00;
                                color: white;
                                box-shadow: 0 4px 14px rgba(255, 106, 0, 0.3);
                            }

                            /* Sold out item */
                            .sold-out {
                                opacity: 0.5;
                                pointer-events: none;
                            }

                            .sold-out .add-btn {
                                display: none;
                            }

                            /* Toast notification */
                            .toast {
                                animation: slideUp 0.3s ease-out, fadeOut 0.3s ease-in 2.5s forwards;
                            }

                            @keyframes slideUp {
                                from {
                                    transform: translateY(100%);
                                    opacity: 0;
                                }

                                to {
                                    transform: translateY(0);
                                    opacity: 1;
                                }
                            }

                            @keyframes fadeOut {
                                to {
                                    opacity: 0;
                                    visibility: hidden;
                                }
                            }

                            /* Lazy load placeholder */
                            .lazy-img {
                                background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
                                background-size: 200% 100%;
                                animation: shimmer 1.5s infinite;
                            }

                            @keyframes shimmer {
                                0% {
                                    background-position: 200% 0;
                                }

                                100% {
                                    background-position: -200% 0;
                                }
                            }
                        </style>
                    </head>

                    <body class="bg-background-light font-sans text-secondary">

                        <!-- Main Container -->
                        <div class="min-h-screen flex flex-col">

                            <!-- Fixed Header -->
                            <header
                                class="fixed top-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-md border-b border-gray-100 shadow-sm">
                                <div class="max-w-7xl mx-auto px-4 lg:px-8">
                                    <div class="flex items-center justify-between h-16 lg:h-20">
                                        <!-- Back & Branding -->
                                        <div class="flex items-center gap-4">
                                            <a href="${pageContext.request.contextPath}/home"
                                                class="size-10 rounded-full bg-gray-100 hover:bg-gray-200 flex items-center justify-center transition-colors lg:hidden">
                                                <span class="material-symbols-outlined">arrow_back</span>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/home"
                                                class="hidden lg:flex items-center gap-3">
                                                <div class="bg-primary/10 text-primary p-2 rounded-xl">
                                                    <span class="material-symbols-outlined filled">cloud</span>
                                                </div>
                                                <span class="text-xl font-black tracking-tight">Danran</span>
                                            </a>
                                        </div>

                                        <!-- Search Bar -->
                                        <div class="flex-1 max-w-xl mx-4 lg:mx-8">
                                            <div class="relative group">
                                                <span
                                                    class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 group-focus-within:text-primary transition-colors">search</span>
                                                <input type="text" id="menuSearch" placeholder="Tìm món ăn, đồ uống..."
                                                    class="w-full bg-gray-50 border border-transparent focus:border-primary/30 focus:bg-white rounded-full py-3 pl-12 pr-4 text-sm font-medium placeholder:text-gray-400 focus:outline-none focus:ring-4 focus:ring-primary/10 transition-all">
                                                <button id="filterBtn"
                                                    class="absolute right-2 top-1/2 -translate-y-1/2 size-8 rounded-full bg-white border border-gray-200 flex items-center justify-center hover:border-primary hover:text-primary transition-colors">
                                                    <span class="material-symbols-outlined text-[18px]">tune</span>
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Cart Icon -->
                                        <button id="cartBtn"
                                            class="relative size-11 rounded-full bg-secondary text-white flex items-center justify-center shadow-lg shadow-black/10 hover:bg-primary transition-colors">
                                            <span class="material-symbols-outlined">shopping_bag</span>
                                            <span id="cartCount"
                                                class="absolute -top-1 -right-1 size-5 bg-primary text-white text-[10px] font-black rounded-full flex items-center justify-center border-2 border-white">0</span>
                                        </button>
                                    </div>
                                </div>
                            </header>

                            <!-- Category Navigation (Sticky) -->
                            <nav id="categoryNav"
                                class="fixed top-16 lg:top-20 left-0 right-0 z-40 bg-white/95 backdrop-blur-md border-b border-gray-100 lg:hidden">
                                <div class="flex gap-2 px-4 py-3 overflow-x-auto no-scrollbar">
                                    <a href="#cat-combo"
                                        class="category-pill active shrink-0 px-5 py-2.5 rounded-full bg-gray-100 text-sm font-bold text-gray-600 hover:bg-primary/10 hover:text-primary transition-all whitespace-nowrap">
                                        🔥 Combo
                                    </a>
                                    <a href="#cat-coffee"
                                        class="category-pill shrink-0 px-5 py-2.5 rounded-full bg-gray-100 text-sm font-bold text-gray-600 hover:bg-primary/10 hover:text-primary transition-all whitespace-nowrap">
                                        ☕ Cà phê
                                    </a>
                                    <a href="#cat-tea"
                                        class="category-pill shrink-0 px-5 py-2.5 rounded-full bg-gray-100 text-sm font-bold text-gray-600 hover:bg-primary/10 hover:text-primary transition-all whitespace-nowrap">
                                        🧋 Trà sữa
                                    </a>
                                    <a href="#cat-food"
                                        class="category-pill shrink-0 px-5 py-2.5 rounded-full bg-gray-100 text-sm font-bold text-gray-600 hover:bg-primary/10 hover:text-primary transition-all whitespace-nowrap">
                                        🍔 Đồ ăn
                                    </a>
                                    <a href="#cat-dessert"
                                        class="category-pill shrink-0 px-5 py-2.5 rounded-full bg-gray-100 text-sm font-bold text-gray-600 hover:bg-primary/10 hover:text-primary transition-all whitespace-nowrap">
                                        🍰 Tráng miệng
                                    </a>
                                </div>
                            </nav>

                            <!-- Main Content Area -->
                            <main class="flex-1 pt-28 lg:pt-24">
                                <div class="max-w-7xl mx-auto flex">

                                    <!-- Desktop Sidebar (Category Navigation) -->
                                    <aside
                                        class="hidden lg:block w-64 shrink-0 sticky top-24 h-[calc(100vh-6rem)] overflow-y-auto no-scrollbar border-r border-gray-100 bg-white p-6">
                                        <h3
                                            class="text-[10px] font-black uppercase tracking-[0.2em] text-gray-300 mb-6">
                                            Danh mục</h3>
                                        <nav class="flex flex-col gap-2">
                                            <a href="#cat-combo"
                                                class="category-pill-desktop active flex items-center gap-3 px-4 py-3 rounded-2xl bg-primary/10 text-primary font-bold transition-all group">
                                                <span class="text-lg">🔥</span>
                                                <span>Combo Tiết Kiệm</span>
                                            </a>
                                            <a href="#cat-coffee"
                                                class="category-pill-desktop flex items-center gap-3 px-4 py-3 rounded-2xl text-gray-500 hover:bg-gray-50 hover:text-secondary font-medium transition-all group">
                                                <span class="text-lg">☕</span>
                                                <span>Cà phê</span>
                                            </a>
                                            <a href="#cat-tea"
                                                class="category-pill-desktop flex items-center gap-3 px-4 py-3 rounded-2xl text-gray-500 hover:bg-gray-50 hover:text-secondary font-medium transition-all group">
                                                <span class="text-lg">🧋</span>
                                                <span>Trà sữa</span>
                                            </a>
                                            <a href="#cat-food"
                                                class="category-pill-desktop flex items-center gap-3 px-4 py-3 rounded-2xl text-gray-500 hover:bg-gray-50 hover:text-secondary font-medium transition-all group">
                                                <span class="text-lg">🍔</span>
                                                <span>Đồ ăn nhanh</span>
                                            </a>
                                            <a href="#cat-dessert"
                                                class="category-pill-desktop flex items-center gap-3 px-4 py-3 rounded-2xl text-gray-500 hover:bg-gray-50 hover:text-secondary font-medium transition-all group">
                                                <span class="text-lg">🍰</span>
                                                <span>Tráng miệng</span>
                                            </a>
                                        </nav>
                                    </aside>

                                    <!-- Menu Items Container -->
                                    <div class="flex-1 px-4 lg:px-8 pb-32 lg:pb-20">

                                        <!-- Section: Combo Tiết Kiệm -->
                                        <section id="cat-combo" class="scroll-mt-nav mb-10">
                                            <div
                                                class="sticky top-28 lg:top-20 z-30 bg-background-light/95 backdrop-blur-sm py-4 -mx-4 px-4 lg:-mx-8 lg:px-8 border-b border-gray-100">
                                                <h2
                                                    class="text-xl lg:text-2xl font-black text-secondary tracking-tight flex items-center gap-2">
                                                    🔥 Combo Tiết Kiệm
                                                    <span
                                                        class="text-xs font-bold text-white bg-red-500 px-2 py-0.5 rounded-full uppercase">Hot</span>
                                                </h2>
                                            </div>

                                            <!-- Desktop: Grid / Mobile: List -->
                                            <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 lg:gap-6 mt-4">
                                                <c:forEach items="${comboList}" var="p">
                                                    <div
                                                        class="menu-item group bg-white rounded-2xl lg:rounded-3xl p-3 lg:p-5 shadow-sm hover:shadow-xl border border-gray-50 transition-all duration-300 flex lg:flex-col gap-4 ${!p.available ? 'sold-out' : ''}">
                                                        <!-- Image -->
                                                        <div class="relative shrink-0 w-24 h-24 lg:w-full lg:h-40 rounded-xl lg:rounded-2xl bg-cover bg-center overflow-hidden"
                                                            style="background-image: url('${p.imageUrl}');">
                                                            <c:if test="${!p.available}">
                                                                <span
                                                                    class="absolute top-2 left-2 bg-gray-500 text-white text-[9px] font-black px-2 py-1 rounded-full uppercase tracking-wider shadow-lg">Hết
                                                                    hàng</span>
                                                            </c:if>
                                                        </div>
                                                        <!-- Info -->
                                                        <div class="flex-1 flex flex-col justify-between lg:gap-3">
                                                            <div>
                                                                <h4
                                                                    class="text-base lg:text-lg font-bold text-secondary group-hover:text-primary transition-colors line-clamp-1">
                                                                    ${p.name}</h4>
                                                                <p
                                                                    class="text-xs lg:text-sm text-gray-400 line-clamp-2 mt-1">
                                                                    ${p.description}</p>
                                                            </div>
                                                            <div class="flex items-center justify-between mt-2 lg:mt-0">
                                                                <div class="flex flex-col">
                                                                    <span
                                                                        class="text-lg lg:text-xl font-black ${!p.available ? 'text-gray-400' : 'text-primary'}">
                                                                        <fmt:formatNumber value="${p.price}"
                                                                            type="number" pattern="#,###" />đ
                                                                    </span>
                                                                </div>
                                                                <button
                                                                    class="add-btn size-10 lg:size-12 rounded-xl lg:rounded-2xl bg-secondary text-white flex items-center justify-center shadow-lg group-hover:bg-primary group-hover:scale-110 transition-all active:scale-95">
                                                                    <span class="material-symbols-outlined">add</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </section>

                                        <!-- Section: Cà phê -->
                                        <section id="cat-coffee" class="scroll-mt-nav mb-10">
                                            <div
                                                class="sticky top-28 lg:top-20 z-30 bg-background-light/95 backdrop-blur-sm py-4 -mx-4 px-4 lg:-mx-8 lg:px-8 border-b border-gray-100">
                                                <h2
                                                    class="text-xl lg:text-2xl font-black text-secondary tracking-tight">
                                                    ☕
                                                    Cà phê</h2>
                                            </div>

                                            <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 lg:gap-6 mt-4">
                                                <c:forEach items="${coffeeList}" var="p">
                                                    <div
                                                        class="menu-item group bg-white rounded-2xl lg:rounded-3xl p-3 lg:p-5 shadow-sm hover:shadow-xl border border-gray-50 transition-all duration-300 flex lg:flex-col gap-4 ${!p.available ? 'sold-out' : ''}">
                                                        <div class="relative shrink-0 w-24 h-24 lg:w-full lg:h-40 rounded-xl lg:rounded-2xl bg-cover bg-center overflow-hidden"
                                                            style="background-image: url('${p.imageUrl}');">
                                                            <c:if test="${!p.available}">
                                                                <span
                                                                    class="absolute top-2 left-2 bg-gray-500 text-white text-[9px] font-black px-2 py-1 rounded-full uppercase tracking-wider shadow-lg">Hết
                                                                    hàng</span>
                                                            </c:if>
                                                        </div>
                                                        <div class="flex-1 flex flex-col justify-between lg:gap-3">
                                                            <div>
                                                                <h4
                                                                    class="text-base lg:text-lg font-bold text-secondary group-hover:text-primary transition-colors line-clamp-1">
                                                                    ${p.name}</h4>
                                                                <p
                                                                    class="text-xs lg:text-sm text-gray-400 line-clamp-2 mt-1">
                                                                    ${p.description}</p>
                                                            </div>
                                                            <div class="flex items-center justify-between mt-2 lg:mt-0">
                                                                <span
                                                                    class="text-lg lg:text-xl font-black ${!p.available ? 'text-gray-400' : 'text-primary'}">
                                                                    <fmt:formatNumber value="${p.price}" type="number"
                                                                        pattern="#,###" />đ
                                                                </span>
                                                                <button
                                                                    class="add-btn size-10 lg:size-12 rounded-xl lg:rounded-2xl bg-secondary text-white flex items-center justify-center shadow-lg group-hover:bg-primary group-hover:scale-110 transition-all active:scale-95">
                                                                    <span class="material-symbols-outlined">add</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </section>

                                        <!-- Section: Trà sữa -->
                                        <section id="cat-tea" class="scroll-mt-nav mb-10">
                                            <div
                                                class="sticky top-28 lg:top-20 z-30 bg-background-light/95 backdrop-blur-sm py-4 -mx-4 px-4 lg:-mx-8 lg:px-8 border-b border-gray-100">
                                                <h2
                                                    class="text-xl lg:text-2xl font-black text-secondary tracking-tight">
                                                    🧋
                                                    Trà sữa</h2>
                                            </div>

                                            <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 lg:gap-6 mt-4">
                                                <c:forEach items="${teaList}" var="p">
                                                    <div
                                                        class="menu-item group bg-white rounded-2xl lg:rounded-3xl p-3 lg:p-5 shadow-sm hover:shadow-xl border border-gray-50 transition-all duration-300 flex lg:flex-col gap-4 ${!p.available ? 'sold-out' : ''}">
                                                        <div class="relative shrink-0 w-24 h-24 lg:w-full lg:h-40 rounded-xl lg:rounded-2xl bg-cover bg-center overflow-hidden"
                                                            style="background-image: url('${p.imageUrl}');">
                                                            <c:if test="${!p.available}">
                                                                <span
                                                                    class="absolute top-2 left-2 bg-gray-500 text-white text-[9px] font-black px-2 py-1 rounded-full uppercase tracking-wider shadow-lg">Hết
                                                                    hàng</span>
                                                            </c:if>
                                                            <!-- Add logic later for 'New' badge if needed -->
                                                        </div>
                                                        <div class="flex-1 flex flex-col justify-between lg:gap-3">
                                                            <div>
                                                                <h4
                                                                    class="text-base lg:text-lg font-bold text-secondary group-hover:text-primary transition-colors line-clamp-1">
                                                                    ${p.name}</h4>
                                                                <p
                                                                    class="text-xs lg:text-sm text-gray-400 line-clamp-2 mt-1">
                                                                    ${p.description}</p>
                                                            </div>
                                                            <div class="flex items-center justify-between mt-2 lg:mt-0">
                                                                <span
                                                                    class="text-lg lg:text-xl font-black ${!p.available ? 'text-gray-400' : 'text-primary'}">
                                                                    <fmt:formatNumber value="${p.price}" type="number"
                                                                        pattern="#,###" />đ
                                                                </span>
                                                                <button
                                                                    class="${!p.available ? 'notify-btn bg-gray-200 text-gray-500' : 'add-btn bg-secondary text-white group-hover:bg-primary'} size-10 lg:size-12 rounded-xl lg:rounded-2xl flex items-center justify-center shadow-lg transition-all active:scale-95">
                                                                    <span
                                                                        class="material-symbols-outlined">${!p.available
                                                                        ? 'notifications' : 'add'}</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </section>

                                        <!-- Section: Đồ ăn nhanh -->
                                        <section id="cat-food" class="scroll-mt-nav mb-10">
                                            <div
                                                class="sticky top-28 lg:top-20 z-30 bg-background-light/95 backdrop-blur-sm py-4 -mx-4 px-4 lg:-mx-8 lg:px-8 border-b border-gray-100">
                                                <h2
                                                    class="text-xl lg:text-2xl font-black text-secondary tracking-tight">
                                                    🍔 Đồ ăn nhanh</h2>
                                            </div>

                                            <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 lg:gap-6 mt-4">
                                                <c:forEach items="${foodList}" var="p">
                                                    <div
                                                        class="menu-item group bg-white rounded-2xl lg:rounded-3xl p-3 lg:p-5 shadow-sm hover:shadow-xl border border-gray-50 transition-all duration-300 flex lg:flex-col gap-4 ${!p.available ? 'sold-out' : ''}">
                                                        <div class="relative shrink-0 w-24 h-24 lg:w-full lg:h-40 rounded-xl lg:rounded-2xl bg-cover bg-center overflow-hidden"
                                                            style="background-image: url('${p.imageUrl}');">
                                                            <c:if test="${!p.available}">
                                                                <span
                                                                    class="absolute top-2 left-2 bg-gray-500 text-white text-[9px] font-black px-2 py-1 rounded-full uppercase tracking-wider shadow-lg">Hết
                                                                    hàng</span>
                                                            </c:if>
                                                        </div>
                                                        <div class="flex-1 flex flex-col justify-between lg:gap-3">
                                                            <div>
                                                                <h4
                                                                    class="text-base lg:text-lg font-bold text-secondary group-hover:text-primary transition-colors line-clamp-1">
                                                                    ${p.name}</h4>
                                                                <p
                                                                    class="text-xs lg:text-sm text-gray-400 line-clamp-2 mt-1">
                                                                    ${p.description}</p>
                                                            </div>
                                                            <div class="flex items-center justify-between mt-2 lg:mt-0">
                                                                <span
                                                                    class="text-lg lg:text-xl font-black ${!p.available ? 'text-gray-400' : 'text-primary'}">
                                                                    <fmt:formatNumber value="${p.price}" type="number"
                                                                        pattern="#,###" />đ
                                                                </span>
                                                                <button
                                                                    class="add-btn size-10 lg:size-12 rounded-xl lg:rounded-2xl bg-secondary text-white flex items-center justify-center shadow-lg group-hover:bg-primary group-hover:scale-110 transition-all active:scale-95">
                                                                    <span class="material-symbols-outlined">add</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </section>

                                        <!-- Section: Tráng miệng -->
                                        <section id="cat-dessert" class="scroll-mt-nav mb-10">
                                            <div
                                                class="sticky top-28 lg:top-20 z-30 bg-background-light/95 backdrop-blur-sm py-4 -mx-4 px-4 lg:-mx-8 lg:px-8 border-b border-gray-100">
                                                <h2
                                                    class="text-xl lg:text-2xl font-black text-secondary tracking-tight">
                                                    🍰 Tráng miệng</h2>
                                            </div>

                                            <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 lg:gap-6 mt-4">
                                                <c:forEach items="${dessertList}" var="p">
                                                    <div
                                                        class="menu-item group bg-white rounded-2xl lg:rounded-3xl p-3 lg:p-5 shadow-sm hover:shadow-xl border border-gray-50 transition-all duration-300 flex lg:flex-col gap-4 ${!p.available ? 'sold-out' : ''}">
                                                        <div class="relative shrink-0 w-24 h-24 lg:w-full lg:h-40 rounded-xl lg:rounded-2xl bg-cover bg-center overflow-hidden"
                                                            style="background-image: url('${p.imageUrl}');">
                                                            <c:if test="${!p.available}">
                                                                <span
                                                                    class="absolute top-2 left-2 bg-gray-500 text-white text-[9px] font-black px-2 py-1 rounded-full uppercase tracking-wider shadow-lg">Hết
                                                                    hàng</span>
                                                            </c:if>
                                                        </div>
                                                        <div class="flex-1 flex flex-col justify-between lg:gap-3">
                                                            <div>
                                                                <h4
                                                                    class="text-base lg:text-lg font-bold text-secondary group-hover:text-primary transition-colors line-clamp-1">
                                                                    ${p.name}</h4>
                                                                <p
                                                                    class="text-xs lg:text-sm text-gray-400 line-clamp-2 mt-1">
                                                                    ${p.description}</p>
                                                            </div>
                                                            <div class="flex items-center justify-between mt-2 lg:mt-0">
                                                                <span
                                                                    class="text-lg lg:text-xl font-black ${!p.available ? 'text-gray-400' : 'text-primary'}">
                                                                    <fmt:formatNumber value="${p.price}" type="number"
                                                                        pattern="#,###" />đ
                                                                </span>
                                                                <button
                                                                    class="add-btn size-10 lg:size-12 rounded-xl lg:rounded-2xl bg-secondary text-white flex items-center justify-center shadow-lg group-hover:bg-primary group-hover:scale-110 transition-all active:scale-95">
                                                                    <span class="material-symbols-outlined">add</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </main>

                            <!-- Floating Cart Bar (Mobile) -->
                            <div id="floatingCart"
                                class="fixed bottom-0 left-0 right-0 z-50 p-4 lg:hidden transform translate-y-full transition-transform duration-300">
                                <button
                                    class="w-full bg-primary hover:bg-primary-hover text-white rounded-2xl p-4 shadow-2xl shadow-primary/40 flex items-center justify-between">
                                    <div class="flex items-center gap-3">
                                        <div class="size-10 bg-white/20 rounded-xl flex items-center justify-center">
                                            <span class="material-symbols-outlined">shopping_bag</span>
                                        </div>
                                        <div class="text-left">
                                            <p class="text-sm font-bold">Xem giỏ hàng</p>
                                            <p class="text-xs text-white/70"><span id="floatingCartCount">0</span> món
                                            </p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xl font-black" id="floatingCartTotal">0đ</p>
                                    </div>
                                </button>
                            </div>

                            <!-- Toast Notification -->
                            <div id="toast" class="fixed bottom-24 left-1/2 -translate-x-1/2 z-50 hidden">
                                <div
                                    class="toast bg-secondary text-white px-6 py-3 rounded-full shadow-2xl flex items-center gap-2">
                                    <span class="material-symbols-outlined text-green-400 filled">check_circle</span>
                                    <span class="text-sm font-bold">Đã thêm vào giỏ hàng!</span>
                                </div>
                            </div>

                            <!-- Product Detail Modal -->
                            <div id="productModal" class="fixed inset-0 z-[60] hidden">
                                <!-- Backdrop -->
                                <div id="modalBackdrop"
                                    class="absolute inset-0 bg-black/60 backdrop-blur-sm transition-opacity opacity-0">
                                </div>

                                <!-- Modal Container - Flexbox centering for desktop -->
                                <div
                                    class="absolute inset-0 lg:flex lg:items-center lg:justify-center lg:p-8 pointer-events-none">
                                    <!-- Modal Panel -->
                                    <div id="modalPanel"
                                        class="pointer-events-auto absolute bottom-0 left-0 right-0 lg:relative lg:bottom-auto lg:left-auto lg:right-auto lg:max-w-[900px] lg:w-full bg-white rounded-t-3xl lg:rounded-3xl max-h-[90vh] lg:max-h-[85vh] overflow-hidden shadow-2xl transform translate-y-full lg:translate-y-0 lg:scale-95 lg:opacity-0 transition-all duration-300">

                                        <!-- Desktop: 2-Column Layout -->
                                        <div class="flex flex-col lg:flex-row h-full max-h-[90vh] lg:max-h-[85vh]">

                                            <!-- Image Section -->
                                            <div class="relative lg:w-[45%] shrink-0">
                                                <div id="modalImage"
                                                    class="w-full aspect-[2/1] lg:aspect-auto lg:h-full bg-cover bg-center"
                                                    style="background-image: url('https://images.unsplash.com/photo-1558857563-b371033873b8?w=800');">
                                                </div>
                                                <!-- Close Button -->
                                                <button id="modalCloseBtn"
                                                    class="absolute top-4 right-4 size-10 bg-black/30 hover:bg-black/50 backdrop-blur-md rounded-full flex items-center justify-center text-white transition-colors">
                                                    <span class="material-symbols-outlined">close</span>
                                                </button>
                                                <!-- Badge -->
                                                <span id="modalBadge"
                                                    class="absolute top-4 left-4 bg-red-500 text-white text-[10px] font-black px-3 py-1.5 rounded-full uppercase tracking-wider shadow-lg hidden">Best
                                                    Seller</span>
                                            </div>

                                            <!-- Content Section -->
                                            <div class="flex-1 flex flex-col overflow-hidden lg:w-[55%]">

                                                <!-- Scrollable Options Area -->
                                                <div class="flex-1 overflow-y-auto p-5 lg:p-6 pb-32 lg:pb-6">

                                                    <!-- Product Info -->
                                                    <div class="mb-6">
                                                        <h1 id="modalTitle"
                                                            class="text-xl lg:text-2xl font-black text-secondary">Trà
                                                            sữa
                                                            Trân
                                                            châu đường đen</h1>
                                                        <p id="modalDesc" class="text-sm text-gray-500 mt-2">Trà sữa Đài
                                                            Loan
                                                            với trân châu tươi ngâm đường đen thơm ngon.</p>
                                                        <p class="mt-3"><span id="modalBasePrice"
                                                                class="text-2xl font-black text-primary">45,000đ</span>
                                                        </p>
                                                    </div>

                                                    <!-- Size Options (Required) -->
                                                    <div class="option-group mb-6" data-required="true">
                                                        <h3
                                                            class="text-[11px] font-black uppercase tracking-widest text-gray-400 mb-3">
                                                            Size <span class="text-red-500">*</span></h3>
                                                        <div class="flex gap-3">
                                                            <label class="size-option flex-1 cursor-pointer">
                                                                <input type="radio" name="size" value="0" data-label="S"
                                                                    class="hidden" checked>
                                                                <div
                                                                    class="border-2 border-primary bg-primary/10 rounded-xl py-3 text-center font-bold text-primary transition-all">
                                                                    S</div>
                                                            </label>
                                                            <label class="size-option flex-1 cursor-pointer">
                                                                <input type="radio" name="size" value="5000"
                                                                    data-label="M" class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-3 text-center font-bold text-gray-600 transition-all">
                                                                    M <span class="text-xs text-gray-400">+5k</span>
                                                                </div>
                                                            </label>
                                                            <label class="size-option flex-1 cursor-pointer">
                                                                <input type="radio" name="size" value="10000"
                                                                    data-label="L" class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-3 text-center font-bold text-gray-600 transition-all">
                                                                    L <span class="text-xs text-gray-400">+10k</span>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <!-- Sugar Level (Required) -->
                                                    <div class="option-group mb-6" data-required="true">
                                                        <h3
                                                            class="text-[11px] font-black uppercase tracking-widest text-gray-400 mb-3">
                                                            Mức đường <span class="text-red-500">*</span></h3>
                                                        <div class="grid grid-cols-4 gap-2">
                                                            <label class="sugar-option cursor-pointer">
                                                                <input type="radio" name="sugar" value="0%"
                                                                    class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all">
                                                                    0%</div>
                                                            </label>
                                                            <label class="sugar-option cursor-pointer">
                                                                <input type="radio" name="sugar" value="30%"
                                                                    class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all">
                                                                    30%</div>
                                                            </label>
                                                            <label class="sugar-option cursor-pointer">
                                                                <input type="radio" name="sugar" value="50%"
                                                                    class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all">
                                                                    50%</div>
                                                            </label>
                                                            <label class="sugar-option cursor-pointer">
                                                                <input type="radio" name="sugar" value="100%"
                                                                    class="hidden" checked>
                                                                <div
                                                                    class="border-2 border-primary bg-primary/10 rounded-xl py-2.5 text-center text-sm font-bold text-primary transition-all">
                                                                    100%</div>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <!-- Ice Level (Required) -->
                                                    <div class="option-group mb-6" data-required="true">
                                                        <h3
                                                            class="text-[11px] font-black uppercase tracking-widest text-gray-400 mb-3">
                                                            Mức đá <span class="text-red-500">*</span></h3>
                                                        <div class="grid grid-cols-4 gap-2">
                                                            <label class="ice-option cursor-pointer">
                                                                <input type="radio" name="ice" value="Không đá"
                                                                    class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all">
                                                                    Không</div>
                                                            </label>
                                                            <label class="ice-option cursor-pointer">
                                                                <input type="radio" name="ice" value="Ít đá"
                                                                    class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all">
                                                                    Ít</div>
                                                            </label>
                                                            <label class="ice-option cursor-pointer">
                                                                <input type="radio" name="ice" value="Bình thường"
                                                                    class="hidden" checked>
                                                                <div
                                                                    class="border-2 border-primary bg-primary/10 rounded-xl py-2.5 text-center text-sm font-bold text-primary transition-all">
                                                                    Vừa</div>
                                                            </label>
                                                            <label class="ice-option cursor-pointer">
                                                                <input type="radio" name="ice" value="Nhiều đá"
                                                                    class="hidden">
                                                                <div
                                                                    class="border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all">
                                                                    Nhiều</div>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <!-- Toppings (Optional) -->
                                                    <div class="option-group mb-6">
                                                        <h3
                                                            class="text-[11px] font-black uppercase tracking-widest text-gray-400 mb-3">
                                                            Topping</h3>
                                                        <div class="space-y-2">
                                                            <label
                                                                class="topping-option flex items-center justify-between p-3 border-2 border-gray-100 hover:border-primary/30 rounded-xl cursor-pointer transition-all">
                                                                <div class="flex items-center gap-3">
                                                                    <input type="checkbox" name="topping" value="5000"
                                                                        data-name="Trân châu đen"
                                                                        class="size-5 accent-primary rounded">
                                                                    <span class="font-medium">Trân châu đen</span>
                                                                </div>
                                                                <span
                                                                    class="text-sm font-bold text-primary">+5,000đ</span>
                                                            </label>
                                                            <label
                                                                class="topping-option flex items-center justify-between p-3 border-2 border-gray-100 hover:border-primary/30 rounded-xl cursor-pointer transition-all relative">
                                                                <div class="flex items-center gap-3">
                                                                    <input type="checkbox" name="topping" value="8000"
                                                                        data-name="Trân châu trắng"
                                                                        class="size-5 accent-primary rounded">
                                                                    <span class="font-medium">Trân châu trắng</span>
                                                                    <span
                                                                        class="text-[9px] font-black bg-amber-400 text-amber-900 px-1.5 py-0.5 rounded-full">⭐
                                                                        BEST</span>
                                                                </div>
                                                                <span
                                                                    class="text-sm font-bold text-primary">+8,000đ</span>
                                                            </label>
                                                            <label
                                                                class="topping-option flex items-center justify-between p-3 border-2 border-gray-100 hover:border-primary/30 rounded-xl cursor-pointer transition-all">
                                                                <div class="flex items-center gap-3">
                                                                    <input type="checkbox" name="topping" value="10000"
                                                                        data-name="Pudding"
                                                                        class="size-5 accent-primary rounded">
                                                                    <span class="font-medium">Pudding trứng</span>
                                                                </div>
                                                                <span
                                                                    class="text-sm font-bold text-primary">+10,000đ</span>
                                                            </label>
                                                            <label
                                                                class="topping-option flex items-center justify-between p-3 border-2 border-gray-100 hover:border-primary/30 rounded-xl cursor-pointer transition-all">
                                                                <div class="flex items-center gap-3">
                                                                    <input type="checkbox" name="topping" value="8000"
                                                                        data-name="Thạch dừa"
                                                                        class="size-5 accent-primary rounded">
                                                                    <span class="font-medium">Thạch dừa</span>
                                                                </div>
                                                                <span
                                                                    class="text-sm font-bold text-primary">+8,000đ</span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <!-- Notes -->
                                                    <div class="mb-6">
                                                        <h3
                                                            class="text-[11px] font-black uppercase tracking-widest text-gray-400 mb-3">
                                                            Ghi chú</h3>
                                                        <textarea id="modalNote" rows="2"
                                                            placeholder="Ví dụ: Ít ngọt, không hành..."
                                                            class="w-full border-2 border-gray-100 focus:border-primary/30 rounded-xl p-3 text-sm resize-none focus:outline-none focus:ring-4 focus:ring-primary/10 transition-all"></textarea>
                                                    </div>

                                                </div>

                                                <!-- Sticky Footer (Inside modal for Desktop) -->
                                                <div
                                                    class="hidden lg:flex items-center justify-between p-5 border-t border-gray-100 bg-white">
                                                    <div class="flex items-center gap-1 bg-gray-100 rounded-xl p-1">
                                                        <button id="qtyMinusDesktop"
                                                            class="size-11 rounded-xl hover:bg-white flex items-center justify-center font-bold text-xl text-gray-500 transition-colors">−</button>
                                                        <span id="qtyValueDesktop"
                                                            class="w-10 text-center font-black text-lg">1</span>
                                                        <button id="qtyPlusDesktop"
                                                            class="size-11 rounded-xl hover:bg-white flex items-center justify-center font-bold text-xl text-gray-500 transition-colors">+</button>
                                                    </div>
                                                    <button id="addToCartDesktop"
                                                        class="flex-1 ml-4 bg-primary hover:bg-primary-hover text-white font-bold py-4 px-6 rounded-2xl shadow-lg shadow-primary/30 transition-all active:scale-[0.98]">
                                                        Thêm • <span id="totalPriceDesktop">45,000đ</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Mobile Sticky Footer -->
                                        <div
                                            class="lg:hidden absolute bottom-0 left-0 right-0 flex items-center justify-between p-4 border-t border-gray-100 bg-white shadow-[0_-4px_20px_rgba(0,0,0,0.08)]">
                                            <div class="flex items-center gap-1 bg-gray-100 rounded-xl p-1">
                                                <button id="qtyMinus"
                                                    class="size-11 rounded-xl hover:bg-white flex items-center justify-center font-bold text-xl text-gray-500 transition-colors">−</button>
                                                <span id="qtyValue" class="w-10 text-center font-black text-lg">1</span>
                                                <button id="qtyPlus"
                                                    class="size-11 rounded-xl hover:bg-white flex items-center justify-center font-bold text-xl text-gray-500 transition-colors">+</button>
                                            </div>
                                            <button id="addToCartMobile"
                                                class="flex-1 ml-4 bg-primary hover:bg-primary-hover text-white font-bold py-4 px-6 rounded-2xl shadow-lg shadow-primary/30 transition-all active:scale-[0.98]">
                                                Thêm • <span id="totalPriceMobile">45,000đ</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- JavaScript for Interactions -->
                        <script>
                            // ============================================
                            // CART STATE
                            // ============================================
                            let cart = [];
                            let cartCount = 0;
                            let cartTotal = 0;

                            // Initialize from Server Session
                            <c:if test="${not empty sessionScope.cart}">
                                <c:forEach items="${sessionScope.cart}" var="item">
                                    cart.push({
                                        name: "${item.name}",
                                    quantity: ${item.quantity},
                                    unitPrice: ${item.price},
                                    totalPrice: ${item.price * item.quantity},
                                    image: "${item.imageUrl}"
                                    });
                                    cartCount += ${item.quantity};
                                    cartTotal += ${item.price * item.quantity};
                                </c:forEach>
                            </c:if>

                            // Call updateCartUI on load to show floating cart if needed
                            document.addEventListener('DOMContentLoaded', () => {
                                updateCartUI();
                            });

                            // ============================================
                            // MODAL STATE
                            // ============================================
                            let modalProduct = null;
                            let modalQuantity = 1;
                            let modalBasePrice = 0;
                            const originalTitle = document.title;

                            // ============================================
                            // DOM ELEMENTS
                            // ============================================
                            const cartCountEl = document.getElementById('cartCount');
                            const floatingCart = document.getElementById('floatingCart');
                            const floatingCartCount = document.getElementById('floatingCartCount');
                            const floatingCartTotal = document.getElementById('floatingCartTotal');
                            const toast = document.getElementById('toast');
                            const menuItems = document.querySelectorAll('.menu-item:not(.sold-out)');

                            // Modal Elements
                            const productModal = document.getElementById('productModal');
                            const modalBackdrop = document.getElementById('modalBackdrop');
                            const modalPanel = document.getElementById('modalPanel');
                            const modalCloseBtn = document.getElementById('modalCloseBtn');
                            const modalImage = document.getElementById('modalImage');
                            const modalBadge = document.getElementById('modalBadge');
                            const modalTitle = document.getElementById('modalTitle');
                            const modalDesc = document.getElementById('modalDesc');
                            const modalBasePriceEl = document.getElementById('modalBasePrice');
                            const modalNote = document.getElementById('modalNote');

                            // ============================================
                            // OPEN MODAL - Click on menu item card
                            // ============================================
                            menuItems.forEach(item => {
                                item.addEventListener('click', (e) => {
                                    if (e.target.closest('.add-btn')) return; // Ignore if clicking add button

                                    const name = item.querySelector('h4').textContent.trim();
                                    const desc = item.querySelector('p').textContent.trim();
                                    const priceText = item.querySelector('.text-primary').textContent;
                                    const price = parseInt(priceText.replace(/[^\d]/g, ''));
                                    const imageStyle = item.querySelector('[style*="background-image"]').style.backgroundImage;
                                    const badgeEl = item.querySelector('[class*="bg-red-500"], [class*="bg-green-500"]');
                                    const badge = badgeEl ? badgeEl.textContent.trim() : null;

                                    // Create slug for URL
                                    const slug = name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/đ/g, 'd').replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');

                                    openModal({ name, desc, price, image: imageStyle, badge, slug });
                                });
                            });

                            function openModal(product) {
                                modalProduct = product;
                                modalBasePrice = product.price;
                                modalQuantity = 1;

                                // Populate modal
                                modalTitle.textContent = product.name;
                                modalDesc.textContent = product.desc;
                                modalBasePriceEl.textContent = product.price.toLocaleString() + 'đ';
                                modalImage.style.backgroundImage = product.image;

                                // Badge
                                if (product.badge) {
                                    modalBadge.textContent = product.badge;
                                    modalBadge.classList.remove('hidden');
                                    if (product.badge.toLowerCase().includes('new')) {
                                        modalBadge.className = 'absolute top-4 left-4 bg-green-500 text-white text-[10px] font-black px-3 py-1.5 rounded-full uppercase tracking-wider shadow-lg';
                                    } else {
                                        modalBadge.className = 'absolute top-4 left-4 bg-red-500 text-white text-[10px] font-black px-3 py-1.5 rounded-full uppercase tracking-wider shadow-lg';
                                    }
                                } else {
                                    modalBadge.classList.add('hidden');
                                }

                                // Reset selections to defaults
                                resetModalOptions();

                                // Update URL (Deep Link support)
                                history.pushState({ modal: true, slug: product.slug }, '', '${pageContext.request.contextPath}/menu/' + product.slug);
                                document.title = product.name + ' - Tùy chọn';

                                // Show modal
                                productModal.classList.remove('hidden');
                                document.body.style.overflow = 'hidden'; // Scroll lock

                                // Animate in
                                requestAnimationFrame(() => {
                                    modalBackdrop.classList.remove('opacity-0');
                                    modalBackdrop.classList.add('opacity-100');
                                    modalPanel.classList.remove('translate-y-full', 'lg:scale-95', 'lg:opacity-0');
                                    modalPanel.classList.add('translate-y-0', 'lg:scale-100', 'lg:opacity-100');
                                });

                                updateModalPrice();
                            }

                            function closeModal() {
                                // Animate out
                                modalBackdrop.classList.remove('opacity-100');
                                modalBackdrop.classList.add('opacity-0');
                                modalPanel.classList.remove('translate-y-0', 'lg:scale-100', 'lg:opacity-100');
                                modalPanel.classList.add('translate-y-full', 'lg:scale-95', 'lg:opacity-0');

                                setTimeout(() => {
                                    productModal.classList.add('hidden');
                                    document.body.style.overflow = ''; // Remove scroll lock

                                    // Restore URL
                                    history.pushState(null, '', '${pageContext.request.contextPath}/menu');
                                    document.title = originalTitle;

                                    // Reset state
                                    modalProduct = null;
                                    modalNote.value = '';
                                }, 300);
                            }

                            function resetModalOptions() {
                                // Reset Size to S (first option)
                                document.querySelector('input[name="size"][value="0"]').checked = true;
                                // Reset Sugar to 100%
                                document.querySelector('input[name="sugar"][value="100%"]').checked = true;
                                // Reset Ice to Bình thường
                                document.querySelector('input[name="ice"][value="Bình thường"]').checked = true;
                                // Uncheck all toppings
                                document.querySelectorAll('input[name="topping"]').forEach(cb => cb.checked = false);
                                // Reset quantity
                                modalQuantity = 1;
                                updateQuantityDisplay();
                                // Reset note
                                modalNote.value = '';
                                // Update option visual states
                                updateOptionVisuals();
                            }

                            // ============================================
                            // CLOSE MODAL
                            // ============================================
                            modalCloseBtn.addEventListener('click', closeModal);
                            modalBackdrop.addEventListener('click', closeModal);

                            // Handle browser back button
                            window.addEventListener('popstate', (e) => {
                                if (productModal && !productModal.classList.contains('hidden')) {
                                    closeModal();
                                }
                            });

                            // ============================================
                            // OPTION SELECTION - Visual Feedback
                            // ============================================
                            function updateOptionVisuals() {
                                // Size options
                                document.querySelectorAll('.size-option').forEach(label => {
                                    const input = label.querySelector('input');
                                    const div = label.querySelector('div');
                                    if (input.checked) {
                                        div.className = 'border-2 border-primary bg-primary/10 rounded-xl py-3 text-center font-bold text-primary transition-all';
                                    } else {
                                        div.className = 'border-2 border-gray-200 hover:border-primary/50 rounded-xl py-3 text-center font-bold text-gray-600 transition-all';
                                    }
                                });

                                // Sugar options
                                document.querySelectorAll('.sugar-option').forEach(label => {
                                    const input = label.querySelector('input');
                                    const div = label.querySelector('div');
                                    if (input.checked) {
                                        div.className = 'border-2 border-primary bg-primary/10 rounded-xl py-2.5 text-center text-sm font-bold text-primary transition-all';
                                    } else {
                                        div.className = 'border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all';
                                    }
                                });

                                // Ice options
                                document.querySelectorAll('.ice-option').forEach(label => {
                                    const input = label.querySelector('input');
                                    const div = label.querySelector('div');
                                    if (input.checked) {
                                        div.className = 'border-2 border-primary bg-primary/10 rounded-xl py-2.5 text-center text-sm font-bold text-primary transition-all';
                                    } else {
                                        div.className = 'border-2 border-gray-200 hover:border-primary/50 rounded-xl py-2.5 text-center text-sm font-medium text-gray-600 transition-all';
                                    }
                                });

                                // Topping options
                                document.querySelectorAll('.topping-option').forEach(label => {
                                    const input = label.querySelector('input[type="checkbox"]');
                                    if (input.checked) {
                                        label.classList.add('border-primary', 'bg-primary/5');
                                        label.classList.remove('border-gray-100');
                                    } else {
                                        label.classList.remove('border-primary', 'bg-primary/5');
                                        label.classList.add('border-gray-100');
                                    }
                                });
                            }

                            // Listen for option changes
                            document.querySelectorAll('input[name="size"], input[name="sugar"], input[name="ice"], input[name="topping"]').forEach(input => {
                                input.addEventListener('change', () => {
                                    updateOptionVisuals();
                                    updateModalPrice();
                                });
                            });

                            // ============================================
                            // REAL-TIME PRICE CALCULATION
                            // ============================================
                            function calculateTotalPrice() {
                                let total = modalBasePrice;

                                // Add size price
                                const sizeInput = document.querySelector('input[name="size"]:checked');
                                if (sizeInput) total += parseInt(sizeInput.value) || 0;

                                // Add topping prices
                                document.querySelectorAll('input[name="topping"]:checked').forEach(topping => {
                                    total += parseInt(topping.value) || 0;
                                });

                                // Multiply by quantity
                                total *= modalQuantity;

                                return total;
                            }

                            function updateModalPrice() {
                                const total = calculateTotalPrice();
                                const formattedPrice = total.toLocaleString() + 'đ';
                                document.getElementById('totalPriceMobile').textContent = formattedPrice;
                                document.getElementById('totalPriceDesktop').textContent = formattedPrice;
                            }

                            // ============================================
                            // QUANTITY CONTROLS
                            // ============================================
                            function updateQuantityDisplay() {
                                document.getElementById('qtyValue').textContent = modalQuantity;
                                document.getElementById('qtyValueDesktop').textContent = modalQuantity;
                            }

                            // Mobile quantity controls
                            document.getElementById('qtyMinus').addEventListener('click', () => {
                                if (modalQuantity > 1) { modalQuantity--; updateQuantityDisplay(); updateModalPrice(); }
                            });
                            document.getElementById('qtyPlus').addEventListener('click', () => {
                                modalQuantity++; updateQuantityDisplay(); updateModalPrice();
                            });

                            // Desktop quantity controls
                            document.getElementById('qtyMinusDesktop').addEventListener('click', () => {
                                if (modalQuantity > 1) { modalQuantity--; updateQuantityDisplay(); updateModalPrice(); }
                            });
                            document.getElementById('qtyPlusDesktop').addEventListener('click', () => {
                                modalQuantity++; updateQuantityDisplay(); updateModalPrice();
                            });

                            // ============================================
                            // ADD TO CART FROM MODAL
                            // ============================================
                            function addToCartFromModal() {
                                const size = document.querySelector('input[name="size"]:checked')?.dataset.label || 'S';
                                const sugar = document.querySelector('input[name="sugar"]:checked')?.value || '100%';
                                const ice = document.querySelector('input[name="ice"]:checked')?.value || 'Bình thường';
                                const toppings = Array.from(document.querySelectorAll('input[name="topping"]:checked')).map(t => t.dataset.name);
                                const note = modalNote.value.trim();
                                const unitPrice = calculateTotalPrice() / modalQuantity;

                                const cartItem = {
                                    name: modalProduct.name,
                                    size,
                                    sugar,
                                    ice,
                                    toppings,
                                    note,
                                    quantity: modalQuantity,
                                    unitPrice,
                                    totalPrice: calculateTotalPrice()
                                };

                                cartItem.image = document.getElementById('modalImage').src; // Grab image from modal

                                cart.push(cartItem);
                                cartCount += modalQuantity;
                                cartTotal += cartItem.totalPrice;

                                updateCartUI();
                                syncCartWithServer(cartItem); // SYNC
                                closeModal();
                                showToast();
                            }

                            document.getElementById('addToCartMobile').addEventListener('click', addToCartFromModal);
                            document.getElementById('addToCartDesktop').addEventListener('click', addToCartFromModal);

                            // ============================================
                            // QUICK ADD (Direct from menu card button)
                            // ============================================
                            document.querySelectorAll('.add-btn').forEach(btn => {
                                btn.addEventListener('click', (e) => {
                                    e.stopPropagation();
                                    const item = btn.closest('.menu-item');
                                    const name = item.querySelector('h4').textContent.trim();
                                    const priceText = item.querySelector('.text-primary').textContent;
                                    const price = parseInt(priceText.replace(/[^\d]/g, ''));

                                    const image = item.querySelector('img')?.src || '';

                                    const cartItem = { name, quantity: 1, unitPrice: price, totalPrice: price, image };
                                    cart.push(cartItem);
                                    cartCount++;
                                    cartTotal += price;
                                    updateCartUI();
                                    syncCartWithServer(cartItem); // SYNC
                                    showToast();
                                });
                            });

                            // ============================================
                            // CART UI UPDATE
                            // ============================================
                            function updateCartUI() {
                                cartCountEl.textContent = cartCount;
                                floatingCartCount.textContent = cartCount;
                                floatingCartTotal.textContent = cartTotal.toLocaleString() + 'đ';
                                if (cartCount > 0) {
                                    floatingCart.classList.remove('translate-y-full');
                                } else {
                                    floatingCart.classList.add('translate-y-full');
                                }
                            }

                            // Sync with Server
                            function syncCartWithServer(item) {
                                const formData = new URLSearchParams();
                                formData.append('action', 'add');
                                formData.append('name', item.name);
                                formData.append('price', item.unitPrice); // Note: verify naming
                                formData.append('quantity', item.quantity);
                                // Combine options into description for simple string storage
                                let desc = item.size ? `Size ${item.size}` : '';
                                if (item.sugar) desc += ` • ${item.sugar} Đường`;
                                if (item.ice) desc += ` • ${item.ice} Đá`;
                                if (item.toppings && item.toppings.length > 0) desc += ` • Thêm: ${item.toppings.join(', ')}`;
                                if (item.note) desc += ` • Ghi chú: ${item.note}`;

                                // Clean up description if empty/undefined
                                if (!desc) desc = "";
                                if (desc.startsWith(" • ")) desc = desc.substring(3);

                                formData.append('description', desc);
                                // We don't have image URL in the simple object unless we extract it from DOM or pass it.
                                // For now, let backend handle fallback or extract if possible. 
                                // Current modal implementation relies on `modalProduct` which might have image?
                                // Checking `openProductModal`... it sets `modalProduct`.
                                // But quick add doesn't. 
                                // Let's try to pass image if available.
                                if (item.image) formData.append('imageUrl', item.image);

                                fetch('${pageContext.request.contextPath}/cart', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/x-www-form-urlencoded',
                                        'Accept': 'application/json'
                                    },
                                    body: formData
                                })
                                    .then(res => res.json())
                                    .then(data => {
                                        console.log('Cart synced', data);
                                    })
                                    .catch(err => console.error('Sync error', err));
                            }

                            // ============================================
                            // CART NAVIGATION
                            // ============================================
                            document.getElementById('cartBtn').addEventListener('click', () => {
                                window.location.href = '${pageContext.request.contextPath}/cart';
                            });

                            // The floating cart is a div that contains a button. 
                            // We can just add the listener to the button inside it, or the whole div.
                            // The existing HTML structure is a div#floatingCart containing a button.
                            document.querySelector('#floatingCart button').addEventListener('click', () => {
                                window.location.href = '${pageContext.request.contextPath}/cart';
                            });

                            function showToast() {
                                toast.classList.remove('hidden');
                                setTimeout(() => toast.classList.add('hidden'), 3000);
                            }

                            // ============================================
                            // SCROLL SPY FOR CATEGORY NAVIGATION
                            // ============================================
                            const sections = document.querySelectorAll('section[id^="cat-"]');
                            const categoryPills = document.querySelectorAll('.category-pill');
                            const categoryPillsDesktop = document.querySelectorAll('.category-pill-desktop');

                            const observer = new IntersectionObserver((entries) => {
                                entries.forEach(entry => {
                                    if (entry.isIntersecting) {
                                        const id = entry.target.id;
                                        categoryPills.forEach(pill => {
                                            pill.classList.toggle('active', pill.getAttribute('href') === '#' + id);
                                        });
                                        categoryPillsDesktop.forEach(pill => {
                                            const isActive = pill.getAttribute('href') === '#' + id;
                                            pill.classList.toggle('bg-primary/10', isActive);
                                            pill.classList.toggle('text-primary', isActive);
                                            pill.classList.toggle('font-bold', isActive);
                                            pill.classList.toggle('text-gray-500', !isActive);
                                            pill.classList.toggle('font-medium', !isActive);
                                        });
                                    }
                                });
                            }, { root: null, rootMargin: '-20% 0px -70% 0px', threshold: 0 });

                            sections.forEach(section => observer.observe(section));

                            // Smooth scroll for category links
                            document.querySelectorAll('a[href^="#cat-"]').forEach(anchor => {
                                anchor.addEventListener('click', function (e) {
                                    e.preventDefault();
                                    const target = document.querySelector(this.getAttribute('href'));
                                    if (target) target.scrollIntoView({ behavior: 'smooth' });
                                });
                            });

                            // ============================================
                            // SEARCH FUNCTIONALITY
                            // ============================================
                            const searchInput = document.getElementById('menuSearch');
                            const allMenuItems = document.querySelectorAll('.menu-item');

                            searchInput.addEventListener('input', (e) => {
                                const query = e.target.value.toLowerCase();
                                allMenuItems.forEach(item => {
                                    const name = item.querySelector('h4').textContent.toLowerCase();
                                    const desc = item.querySelector('p').textContent.toLowerCase();
                                    item.style.display = (name.includes(query) || desc.includes(query)) ? '' : 'none';
                                });
                            });

                            // ============================================
                            // HANDLE DEEP LINK ON PAGE LOAD
                            // ============================================
                            (function handleDeepLink() {
                                const path = window.location.pathname;
                                const match = path.match(/\/menu\/(.+)$/);
                                if (match) {
                                    const slug = match[1];
                                    // Find matching product by slug (simplified - in production would use ID)
                                    // For now, redirect to /menu
                                    history.replaceState(null, '', '${pageContext.request.contextPath}/menu');
                                }
                            })();
                        </script>

                    </body>

                    </html>