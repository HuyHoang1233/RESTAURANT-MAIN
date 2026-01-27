<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập - Danran Restaurant</title>

        <script src="https://cdn.tailwindcss.com"></script>

        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,1,0" rel="stylesheet" />

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        fontFamily: {
                            sans: ['"Plus Jakarta Sans"', 'sans-serif'],
                        },
                        colors: {
                            brand: {
                                50: '#fff7ed',
                                100: '#ffedd5',
                                500: '#f97316', // Cam chủ đạo
                                600: '#ea580c',
                            }
                        },
                        animation: {
                            'fade-in-up': 'fadeInUp 0.5s ease-out forwards',
                        },
                        keyframes: {
                            fadeInUp: {
                                '0%': {opacity: '0', transform: 'translateY(10px)'},
                                '100%': {opacity: '1', transform: 'translateY(0)'},
                            }
                        }
                    }
                }
            }
        </script>

        <style>
            ::-webkit-scrollbar {
                width: 6px;
            }
            ::-webkit-scrollbar-track {
                background: transparent;
            }
            ::-webkit-scrollbar-thumb {
                background: #cbd5e1;
                border-radius: 10px;
            }
            ::-webkit-scrollbar-thumb:hover {
                background: #94a3b8;
            }
        </style>
    </head>

    <body class="bg-gray-50 text-slate-800 antialiased selection:bg-brand-500 selection:text-white h-screen overflow-hidden">

        <div class="flex w-full h-full">

            <div class="hidden lg:flex lg:w-1/2 relative overflow-hidden bg-slate-900">
                <img src="https://images.unsplash.com/photo-1559339352-11d035aa65de?q=80&w=1974&auto=format&fit=crop" 
                     class="absolute inset-0 w-full h-full object-cover opacity-60 scale-105 hover:scale-110 transition-transform duration-[20s] ease-linear" alt="Restaurant Background">

                <div class="absolute inset-0 bg-gradient-to-t from-slate-900/90 via-slate-900/40 to-transparent"></div>

                <div class="relative z-10 w-full h-full flex flex-col justify-between p-16">
                    <div class="text-white/80 font-bold text-lg tracking-widest uppercase flex items-center gap-2">
                        <span class="material-symbols-rounded text-brand-500">restaurant_menu</span> DANRAN
                    </div>

                    <div class="bg-white/10 backdrop-blur-md border border-white/10 p-8 rounded-3xl animate-fade-in-up">
                        <h1 class="text-white text-4xl xl:text-5xl font-bold leading-tight mb-4">
                            Trải nghiệm ẩm thực <br/> <span class="text-brand-500">tinh tế & đẳng cấp</span>
                        </h1>
                        <p class="text-slate-300 text-lg font-medium leading-relaxed">
                            "Hơn cả một bữa ăn, Danran mang đến không gian ấm cúng và những khoảnh khắc đáng nhớ bên người thân yêu."
                        </p>

                        <div class="flex items-center gap-4 mt-8">
                            <div class="flex -space-x-3">
                                <img class="w-10 h-10 rounded-full border-2 border-slate-800" src="https://i.pravatar.cc/100?img=1" alt="User">
                                <img class="w-10 h-10 rounded-full border-2 border-slate-800" src="https://i.pravatar.cc/100?img=5" alt="User">
                                <img class="w-10 h-10 rounded-full border-2 border-slate-800" src="https://i.pravatar.cc/100?img=8" alt="User">
                            </div>
                            <div class="text-slate-300 text-sm">
                                <span class="text-white font-bold">10k+</span> Khách hàng hài lòng
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-full lg:w-1/2 flex flex-col items-center justify-center bg-white relative overflow-y-auto">

                <div class="lg:hidden absolute top-6 left-6 flex items-center gap-2 font-bold text-2xl text-slate-800">
                    <span class="material-symbols-rounded text-brand-500 text-3xl">restaurant_menu</span> Danran
                </div>

                <div class="w-full max-w-[460px] px-6 py-10 animate-fade-in-up">

                    <div class="text-center mb-10">
                        <h2 class="text-3xl font-extrabold text-slate-900 mb-2">Chào mừng trở lại! 👋</h2>
                        <p class="text-slate-500">Vui lòng nhập thông tin để đăng nhập.</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-5">

                        <% if (request.getAttribute("errorMessage") != null) {%>
                        <div class="p-4 bg-red-50 border border-red-100 text-red-600 rounded-xl text-sm font-medium flex items-center gap-3 animate-pulse">
                            <span class="material-symbols-rounded">error</span>
                            <%= request.getAttribute("errorMessage")%>
                        </div>
                        <% } %>

                        <% if (request.getAttribute("successMessage") != null) {%>
                        <div class="p-4 bg-green-50 border border-green-100 text-green-600 rounded-xl text-sm font-medium flex items-center gap-3">
                            <span class="material-symbols-rounded">check_circle</span>
                            <%= request.getAttribute("successMessage")%>
                        </div>
                        <% }%>

                        <div class="group">
                            <label for="phoneNumber" class="block text-sm font-semibold text-slate-700 mb-1 ml-1">Số điện thoại</label>
                            <div class="relative transition-all duration-300">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <span class="material-symbols-rounded text-slate-400 group-focus-within:text-brand-500 transition-colors">call</span>
                                </div>
                                <input type="tel" id="phoneNumber" name="phoneNumber" 
                                       value="${not empty phoneNumber ? phoneNumber : ''}"
                                       class="block w-full pl-12 pr-4 py-3.5 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-brand-500/20 focus:border-brand-500 transition-all font-medium"
                                       placeholder="Ví dụ: 0912345678" required>
                            </div>
                        </div>

                        <div class="group">
                            <label for="password" class="block text-sm font-semibold text-slate-700 mb-1 ml-1">Mật khẩu</label>
                            <div class="relative transition-all duration-300">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <span class="material-symbols-rounded text-slate-400 group-focus-within:text-brand-500 transition-colors">lock</span>
                                </div>
                                <input type="password" id="password" name="password" 
                                       class="block w-full pl-12 pr-12 py-3.5 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-brand-500/20 focus:border-brand-500 transition-all font-medium"
                                       placeholder="••••••••" required>

                                <button type="button" onclick="togglePassword()" class="absolute inset-y-0 right-0 pr-4 flex items-center text-slate-400 hover:text-slate-600 transition-colors cursor-pointer focus:outline-none">
                                    <span id="passwordIcon" class="material-symbols-rounded text-[22px]">visibility</span>
                                </button>
                            </div>

                            <div class="flex justify-end mt-2">
                                <a href="${pageContext.request.contextPath}/forgot-password" class="text-sm font-semibold text-brand-600 hover:text-brand-500 hover:underline transition-all">Quên mật khẩu?</a>
                            </div>
                        </div>

                        <button type="submit" class="w-full py-3.5 px-4 bg-gradient-to-r from-brand-500 to-brand-600 hover:from-brand-600 hover:to-brand-600 text-white font-bold rounded-xl shadow-lg shadow-brand-500/30 transform transition hover:-translate-y-0.5 active:scale-[0.98] duration-200">
                            Đăng nhập ngay
                        </button>
                    </form>

                    <div class="relative my-8">
                        <div class="absolute inset-0 flex items-center">
                            <div class="w-full border-t border-slate-200"></div>
                        </div>
                        <div class="relative flex justify-center text-sm">
                            <span class="px-4 bg-white text-slate-500 font-medium">Hoặc tiếp tục với</span>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8081/Restaurant_Management/login-google&response_type=code&client_id=DIEN_CLIENT_ID_CUA_BAN_VAO_DAY&approval_prompt=force"
                           class="flex items-center justify-center gap-2 py-3 px-4 border border-slate-200 rounded-xl hover:bg-slate-50 hover:border-slate-300 transition-all duration-200 group">
                            <svg class="w-5 h-5 group-hover:scale-110 transition-transform" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                            </svg>
                            <span class="text-sm font-semibold text-slate-700">Google</span>
                        </a>

                        <a href="https://www.facebook.com/dialog/oauth?client_id=DIEN_APP_ID_CUA_BAN&redirect_uri=http://localhost:8081/Restaurant_Management/login-facebook&scope=email,public_profile"
                           class="flex items-center justify-center gap-2 py-3 px-4 border border-slate-200 rounded-xl hover:bg-slate-50 hover:border-slate-300 transition-all duration-200 group">
                            <svg class="w-6 h-6 text-[#1877F2] group-hover:scale-110 transition-transform" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M24 12.073C24 5.405 18.627 0 12 0S0 5.405 0 12.073C0 18.1 4.388 23.094 10.125 24V15.563H7.078V12.073H10.125V9.413C10.125 6.386 11.916 4.718 14.656 4.718C15.969 4.718 17.344 4.953 17.344 4.953V7.923H15.83C14.339 7.923 13.875 8.848 13.875 9.797V12.073H17.203L16.67 15.563H13.875V24C19.612 23.094 24 18.1 24 12.073Z" />
                            </svg>
                            <span class="text-sm font-semibold text-slate-700">Facebook</span>
                        </a>
                    </div>

                    <div class="mt-8 text-center">
                        <p class="text-slate-500 text-sm">
                            Bạn chưa có tài khoản? 
                            <a href="${pageContext.request.contextPath}/register.jsp" class="font-bold text-brand-600 hover:text-brand-500 transition-colors">Đăng ký ngay</a>
                        </p>
                    </div>

                </div>

                <a href="${pageContext.request.contextPath}/index.html" class="absolute bottom-6 text-slate-400 hover:text-slate-600 text-sm transition-colors">
                    &larr; Quay về trang chủ
                </a>
            </div>
        </div>

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