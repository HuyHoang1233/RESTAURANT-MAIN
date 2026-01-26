<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập - Danran</title>

        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Noto+Sans:wght@400;500;700&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
            rel="stylesheet" />

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: '#ff6a00',
                            'primary-hover': '#e65f00',
                            secondary: '#181410',
                            'text-main': '#181410',
                            'text-secondary': '#4A5568',
                            'background-light': '#F7FAFC',
                            'border': '#E2E8F0',
                        },
                        fontFamily: {
                            sans: ['Inter', 'Noto Sans', 'sans-serif'],
                        },
                        height: {
                            '15': '3.75rem',
                        }
                    }
                }
            }
        </script>

        <style>
            .backdrop-blur-md {
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
            }

            input:-webkit-autofill,
            input:-webkit-autofill:hover,
            input:-webkit-autofill:focus {
                -webkit-box-shadow: 0 0 0px 1000px white inset;
                transition: background-color 5000s ease-in-out 0s;
            }
        </style>
    </head>

    <body class="bg-white text-text-main font-sans selection:bg-primary/20">

        <main class="flex w-full h-screen overflow-hidden">

            <!-- ==================== LEFT SIDE: HERO PANEL ==================== -->
            <section class="hidden lg:flex lg:w-1/2 relative bg-gray-900 flex-col justify-center items-center text-center p-12 overflow-hidden">
                <!-- Background Image -->
                <div class="absolute inset-0 bg-cover bg-center z-0 transition-opacity duration-700 hover:scale-105 transition-transform duration-[10s]"
                    style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuB6eaRUe3ymQJ5T4f1mAmflzO-a3Wadexep-EfeoGhAbMtqdeA8D3FRthtw8ou8MR1wF9MsITagmblbQB11jY1TU_9q6QjS-UH9MD25lLn0P37T5sOY_KKR9rFWRY6x7Env_NhCI1SpHyUKA6WUAkxdlqDMY7GgoS_AlerVknlFLpGmMMMyfhMkRhtXUTyKkrzWDKdNU0WWqhIz42n7JREAH72gAN8rSdTDMr2sSdo9YYzlqjg1tWaOy-FTR3zt3rStSLfeqXvgAJEl')">
                    <!-- Dark Overlays -->
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/50 to-black/70 z-10">
                    </div>
                </div>

                <!-- Content -->
                <div class="relative z-20 flex flex-col items-center gap-6 max-w-lg">
                    <a href="${pageContext.request.contextPath}/index.html" class="group">
                        <h1 class="text-white text-6xl xl:text-7xl font-black tracking-tight drop-shadow-lg transform transition-transform group-hover:scale-105 duration-300">
                            Danran
                        </h1>
                    </a>
                    <p class="text-white/95 text-xl xl:text-2xl font-medium tracking-wide leading-relaxed">
                        Nền tảng quản lý F&B toàn diện
                    </p>
                    <div class="mt-8 w-28 h-1.5 bg-primary rounded-full shadow-lg"></div>
                </div>

                <!-- Glass Decorative Element -->
                <div class="absolute bottom-10 left-10 right-10 p-6 rounded-3xl bg-white/5 border border-white/10 backdrop-blur-md z-20 hidden xl:block">
                    <p class="text-white/70 text-sm font-medium italic">"Giải pháp công nghệ tin cậy giúp tăng 30%
                        doanh thu cho nhà hàng của bạn."</p>
                </div>
            </section>

            <!-- ==================== RIGHT SIDE: LOGIN FORM AREA ==================== -->
            <section class="w-full lg:w-1/2 h-full bg-white overflow-y-auto relative">

                <div class="min-h-full flex flex-col relative pb-12">
                    <!-- Header Navigation -->
                    <header class="w-full p-6 lg:p-10 flex items-center justify-between sticky top-0 bg-white/80 backdrop-blur-md z-30">
                        <a href="${pageContext.request.contextPath}/index.html" aria-label="Quay lại"
                      class="group flex items-center justify-center w-11 h-11 rounded-full bg-background-light hover:bg-border transition-all duration-200">
                            <span class="material-symbols-outlined text-[20px] text-text-main group-hover:-translate-x-1 transition-transform">arrow_back</span>
                        </a>

                        <!-- Mobile-only Branding -->
                        <div class="lg:hidden text-primary font-black text-2xl tracking-tighter">
                            Danran
                        </div>

                        <div class="w-11 hidden lg:block"></div>
                    </header>

                    <!-- Main Content Area -->
                    <div class="flex-1 flex flex-col justify-center px-6 sm:px-12 md:px-20 lg:px-24 xl:px-32 py-8">
                        <div class="max-w-[480px] w-full mx-auto space-y-10">

                            <!-- Welcome Text -->
                            <div class="space-y-3">
                                <h2 class="text-text-main text-4xl sm:text-5xl font-black tracking-tight">
                                    Xin chào!
                                </h2>
                                <p class="text-text-secondary text-lg font-medium opacity-80">
                                    Vui lòng đăng nhập để tiếp tục.
                                </p>
                            </div>

                            <!-- Login Form -->
                            <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-6">

                                <!-- Success/Error Messages (from Servlet) -->
                                <% if (request.getAttribute("errorMessage") !=null) { %>
                                    <div class="p-4 bg-red-50 border border-red-100 text-red-600 rounded-2xl text-sm font-bold flex items-center gap-2">
                                        <span class="material-symbols-outlined text-[18px]">error</span>
                                        <%= request.getAttribute("errorMessage") %>
                                    </div>
                                    <% } %>

                                        <% if (request.getAttribute("successMessage") !=null) { %>
                                            <div class="p-4 bg-green-50 border border-green-100 text-green-600 rounded-2xl text-sm font-bold flex items-center gap-2">
                                                <span class="material-symbols-outlined text-[18px]">check_circle</span>
                                                <%= request.getAttribute("successMessage") %>
                                            </div>
                                            <% } %>

                                                <!-- Phone Number Input Group -->
                                                <div class="space-y-2">
                                                    <label for="phoneNumber"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                        Số điện thoại
                                                    </label>
                                                    <div class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm group">
                                                        <div class="pl-6 pr-4 h-full flex items-center border-r border-border bg-background-light/40 cursor-pointer hover:bg-background-light transition-colors group">
                                                            <span class="text-text-main font-bold flex items-center gap-1">
                                                                +84 <span class="material-symbols-outlined text-[18px] text-text-secondary">expand_more</span>
                                                            </span>
                                                        </div>
                                                        <input type="tel" id="phoneNumber" name="phoneNumber"
                                                   class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                   placeholder="Nhập số điện thoại" required />
                                                    </div>
                                                </div>

                                                <!-- Password Input Group -->
                                                <div class="space-y-2">
                                                    <label for="password"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                        Mật khẩu
                                                    </label>
                                                    <div class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm">
                                                        <input type="password" id="password" name="password"
                                                   class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                   placeholder="Nhập mật khẩu" required />
                                                        <button type="button" onclick="togglePassword()"
                                                    class="absolute right-6 text-text-secondary hover:text-primary transition-colors p-1 flex items-center justify-center">
                                                            <span id="passwordIcon"
                                                      class="material-symbols-outlined text-[24px]">visibility</span>
                                                        </button>
                                                    </div>
                                                </div>

                                                <!-- Forgot Password Link -->
                                                <div class="flex justify-end px-4">
                                                    <a href="${pageContext.request.contextPath}/forgot-password"
                                             class="text-sm font-bold text-primary hover:text-primary-hover transition-colors underline-offset-4 hover:underline">
                                                        Quên mật khẩu?
                                                    </a>
                                                </div>

                                                <!-- Primary Login Button -->
                                                <button type="submit"
                                              class="group relative flex items-center justify-center w-full h-15 rounded-full bg-primary hover:bg-primary-hover text-white text-lg font-bold tracking-wide shadow-xl shadow-primary/20 transition-all hover:-translate-y-0.5 active:scale-[0.98]">
                                                    <span>Đăng nhập</span>
                                                    <div class="absolute inset-0 rounded-full bg-white/10 opacity-0 group-hover:opacity-100 transition-opacity">
                                                    </div>
                                                </button>
                            </form>

                            <!-- Alternative Auth Section -->
                            <div class="space-y-6">
                                <div class="relative flex items-center py-2">
                                    <div class="flex-grow border-t border-border"></div>
                                    <span class="flex-shrink-0 mx-4 text-text-secondary text-sm font-bold uppercase tracking-widest opacity-60">
                                        Hoặc đăng nhập với
                                    </span>
                                    <div class="flex-grow border-t border-border"></div>
                                </div>

                                <div class="grid grid-cols-2 gap-4">
                                    <!-- Google Login -->
                                    <button type="button"
                                    class="flex items-center justify-center gap-3 h-14 rounded-full border border-border bg-white hover:bg-background-light hover:border-gray-300 transition-all text-text-main font-bold text-base shadow-sm">
                                        <svg class="w-5 h-5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                        d="M23.766 12.2764C23.766 11.4607 23.6999 10.6406 23.5588 9.83807H12.24V14.4591H18.7217C18.4528 15.9494 17.5885 17.2678 16.323 18.1056V21.1039H20.19C22.4608 19.0139 23.766 15.9274 23.766 12.2764Z"
                                        fill="#4285F4" />
                                            <path
                                        d="M12.24 24.0008C15.4765 24.0008 18.2058 22.9382 20.19 21.1039L16.323 18.1055C15.2517 18.8375 13.8627 19.252 12.24 19.252C9.11388 19.252 6.45946 17.1399 5.50705 14.3003H1.5166V17.3912C3.55371 21.4434 7.7029 24.0008 12.24 24.0008Z"
                                        fill="#34A853" />
                                            <path
                                        d="M5.50705 14.3003C5.0088 12.8099 5.0088 11.1961 5.50705 9.70575V6.61481H1.5166C-0.18551 10.0056 -0.18551 14.0004 1.5166 17.3912L5.50705 14.3003Z"
                                        fill="#FBBC05" />
                                            <path
                                        d="M12.24 4.74966C13.9509 4.7232 15.6044 5.36697 16.8434 6.54867L20.2695 3.12262C18.1001 1.0855 15.2208 -0.034466 12.24 0.000808666C7.7029 0.000808666 3.55371 2.55822 1.5166 6.61481L5.50705 9.70575C6.45079 6.86173 9.10475 4.74966 12.24 4.74966Z"
                                        fill="#EA4335" />
                                        </svg>
                                        Google
                                    </button>

                                    <!-- Facebook Login -->
                                    <button type="button"
                                    class="flex items-center justify-center gap-3 h-14 rounded-full border border-border bg-white hover:bg-background-light hover:border-gray-300 transition-all text-text-main font-bold text-base shadow-sm">
                                        <svg class="w-6 h-6 text-[#1877F2]" fill="currentColor" viewBox="0 0 24 24"
                                     xmlns="http://www.w3.org/2000/svg">
                                            <path d="M24 12.073C24 5.405 18.627 0 12 0S0 5.405 0 12.073C0 18.1 4.388 23.094 10.125 24V15.563H7.078V12.073H10.125V9.413C10.125 6.386 11.916 4.718 14.656 4.718C15.969 4.718 17.344 4.953 17.344 4.953V7.923H15.83C14.339 7.923 13.875 8.848 13.875 9.797V12.073H17.203L16.67 15.563H13.875V24C19.612 23.094 24 18.1 24 12.073Z" />
                                        </svg>
                                        Facebook
                                    </button>
                                </div>
                            </div>

                            <!-- Sign Up Redirect -->
                            <div class="text-center pt-4">
                                <p class="text-text-secondary text-lg font-medium">
                                    Chưa có tài khoản?
                                    <a href="${pageContext.request.contextPath}/register.jsp"
                                class="text-primary hover:text-primary-hover font-black ml-2 transition-colors inline-block hover:scale-105">
                                        Đăng ký ngay
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Visual buffer for mobile keyboard or scrolling -->
                    <div class="h-10 shrink-0"></div>
                </div>
            </section>
        </main>

        <!-- ==================== JAVASCRIPT ==================== -->
        <script>
            function togglePassword() {
                const passwordInput = document.getElementById('password');
                const passwordIcon = document.getElementById('passwordIcon');

                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    passwordIcon.textContent = 'visibility_off';
                } else {
                    passwordInput.type = 'password';
                    passwordIcon.textContent = 'visibility';
                }
            }
        </script>
    </body>

    </html>