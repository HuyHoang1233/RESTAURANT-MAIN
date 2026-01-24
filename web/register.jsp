<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký tài khoản - Bếp Cloud</title>

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
            <section
                class="hidden lg:flex lg:w-1/2 relative bg-gray-900 flex-col justify-center items-center text-center p-12 overflow-hidden">
                <div class="absolute inset-0 bg-cover bg-center z-0 transition-opacity duration-700 hover:scale-105 transition-transform duration-[10s]"
                    style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuB6eaRUe3ymQJ5T4f1mAmflzO-a3Wadexep-EfeoGhAbMtqdeA8D3FRthtw8ou8MR1wF9MsITagmblbQB11jY1TU_9q6QjS-UH9MD25lLn0P37T5sOY_KKR9rFWRY6x7Env_NhCI1SpHyUKA6WUAkxdlqDMY7GgoS_AlerVknlFLpGmMMMyfhMkRhtXUTyKkrzWDKdNU0WWqhIz42n7JREAH72gAN8rSdTDMr2sSdo9YYzlqjg1tWaOy-FTR3zt3rStSLfeqXvgAJEl')">
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/50 to-black/70 z-10">
                    </div>
                </div>

                <div class="relative z-20 flex flex-col items-center gap-6 max-w-lg">
                    <a href="${pageContext.request.contextPath}/index.html" class="group">
                        <h1
                            class="text-white text-6xl xl:text-7xl font-black tracking-tight drop-shadow-lg transform transition-transform group-hover:scale-105 duration-300">
                            Bếp Cloud
                        </h1>
                    </a>
                    <p class="text-white/95 text-xl xl:text-2xl font-medium tracking-wide leading-relaxed">
                        Đồng hành cùng sự phát triển của nhà hàng Việt
                    </p>
                    <div class="mt-8 w-28 h-1.5 bg-primary rounded-full shadow-lg"></div>
                </div>

                <div
                    class="absolute bottom-10 left-10 right-10 p-6 rounded-3xl bg-white/5 border border-white/10 backdrop-blur-md z-20 hidden xl:block">
                    <p class="text-white/70 text-sm font-medium italic">"Gia nhập cộng đồng 2000+ chủ nhà hàng thông
                        thái ngay hôm nay."</p>
                </div>
            </section>

            <!-- ==================== RIGHT SIDE: REGISTER FORM AREA ==================== -->
            <section class="w-full lg:w-1/2 h-full bg-white overflow-y-auto relative">

                <div class="min-h-full flex flex-col relative pb-12">
                    <!-- Header Navigation -->
                    <header
                        class="w-full p-6 lg:p-10 flex items-center justify-between sticky top-0 bg-white/80 backdrop-blur-md z-30">
                        <a href="${pageContext.request.contextPath}/login.jsp" aria-label="Quay lại"
                            class="group flex items-center justify-center w-11 h-11 rounded-full bg-background-light hover:bg-border transition-all duration-200">
                            <span
                                class="material-symbols-outlined text-[20px] text-text-main group-hover:-translate-x-1 transition-transform">arrow_back</span>
                        </a>

                        <div class="lg:hidden text-primary font-black text-2xl tracking-tighter">
                            Bếp Cloud
                        </div>

                        <div class="w-11 hidden lg:block"></div>
                    </header>

                    <!-- Main Content Area -->
                    <div class="flex-1 flex flex-col justify-center px-6 sm:px-12 md:px-20 lg:px-24 xl:px-32 py-8">
                        <div class="max-w-[480px] w-full mx-auto space-y-10">

                            <!-- Header Text -->
                            <div class="space-y-3">
                                <h2 class="text-text-main text-4xl sm:text-5xl font-black tracking-tight">
                                    Đăng ký
                                </h2>
                                <p class="text-text-secondary text-lg font-medium opacity-80">
                                    Trải nghiệm miễn phí giải pháp quản lý F&B.
                                </p>
                            </div>

                            <!-- Register Form -->
                            <form action="${pageContext.request.contextPath}/register" method="POST" class="space-y-6">

                                <!-- Messages -->
                                <% if (request.getAttribute("errorMessage") !=null) { %>
                                    <div
                                        class="p-4 bg-red-50 border border-red-100 text-red-600 rounded-2xl text-sm font-bold flex items-center gap-2">
                                        <span class="material-symbols-outlined text-[18px]">error</span>
                                        <%= request.getAttribute("errorMessage") %>
                                    </div>
                                    <% } %>

                                        <!-- Full Name -->
                                        <div class="space-y-2">
                                            <label for="fullName"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                Họ và tên
                                            </label>
                                            <div
                                                class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm">
                                                <input type="text" id="fullName" name="fullName"
                                                    class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                    placeholder="Nhập họ và tên của bạn" required />
                                            </div>
                                        </div>

                                        <!-- Username -->
                                        <div class="space-y-2">
                                            <label for="username"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                Tên đăng nhập
                                            </label>
                                            <div
                                                class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm">
                                                <input type="text" id="username" name="username"
                                                    class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                    placeholder="Tên đăng nhập duy nhất" required />
                                            </div>
                                        </div>

                                        <!-- Phone Number -->
                                        <div class="space-y-2">
                                            <label for="phoneNumber"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                Số điện thoại
                                            </label>
                                            <div
                                                class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm group">
                                                <div
                                                    class="pl-6 pr-4 h-full flex items-center border-r border-border bg-background-light/40 cursor-pointer hover:bg-background-light transition-colors group">
                                                    <span class="text-text-main font-bold flex items-center gap-1">
                                                        +84 <span
                                                            class="material-symbols-outlined text-[18px] text-text-secondary">expand_more</span>
                                                    </span>
                                                </div>
                                                <input type="tel" id="phoneNumber" name="phoneNumber"
                                                    class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                    placeholder="Số điện thoại dùng để đăng nhập" required />
                                            </div>
                                        </div>


                                        <!-- Email -->
                                        <div class="space-y-2">
                                            <label for="email"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                Email
                                            </label>
                                            <div
                                                class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm">
                                                <input type="email" id="email" name="email"
                                                    class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                    placeholder="Địa chỉ email liên hệ" required />
                                            </div>
                                        </div>

                                        <!-- Role Selection -->
                                        <div class="space-y-3 px-4">
                                            <label
                                                class="text-text-main text-sm font-bold block uppercase tracking-wider opacity-70">
                                                Bạn đăng ký với vai trò là:
                                            </label>
                                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                                <!-- Admin Option -->
                                                <label
                                                    class="relative flex items-center p-4 rounded-2xl border border-border bg-white cursor-pointer hover:border-primary/50 transition-all has-[:checked]:border-primary has-[:checked]:bg-primary/5 group">
                                                    <input type="radio" name="roleId" value="1" class="sr-only"
                                                        checked />
                                                    <div class="flex flex-col">
                                                        <span
                                                            class="text-base font-black text-text-main group-has-[:checked]:text-primary">Chủ
                                                            quán</span>
                                                        <span class="text-[10px] text-text-secondary opacity-60">Admin -
                                                            Quản lý nhà hàng</span>
                                                    </div>
                                                    <span
                                                        class="material-symbols-outlined ml-auto text-primary opacity-0 group-has-[:checked]:opacity-100">check_circle</span>
                                                </label>
                                                <!-- Customer Option -->
                                                <label
                                                    class="relative flex items-center p-4 rounded-2xl border border-border bg-white cursor-pointer hover:border-primary/50 transition-all has-[:checked]:border-primary has-[:checked]:bg-primary/5 group">
                                                    <input type="radio" name="roleId" value="3" class="sr-only" />
                                                    <div class="flex flex-col">
                                                        <span
                                                            class="text-base font-black text-text-main group-has-[:checked]:text-primary">Khách
                                                            hàng</span>
                                                        <span
                                                            class="text-[10px] text-text-secondary opacity-60">Customer
                                                            - Trải nghiệm dịch vụ</span>
                                                    </div>
                                                    <span
                                                        class="material-symbols-outlined ml-auto text-primary opacity-0 group-has-[:checked]:opacity-100">check_circle</span>
                                                </label>
                                            </div>
                                        </div>

                                        <!-- Password -->
                                        <div class="space-y-2">
                                            <label for="password"
                                                class="text-text-main text-sm font-bold ml-4 block uppercase tracking-wider opacity-70">
                                                Mật khẩu
                                            </label>
                                            <div
                                                class="relative flex items-center h-15 rounded-full border border-border bg-white focus-within:border-primary focus-within:ring-4 focus-within:ring-primary/10 transition-all overflow-hidden shadow-sm">
                                                <input type="password" id="password" name="password"
                                                    class="flex-1 w-full h-full border-none bg-transparent px-6 text-text-main font-medium placeholder:text-text-secondary/40 focus:ring-0 text-lg"
                                                    placeholder="Tối thiểu 6 ký tự" required />
                                                <button type="button" onclick="togglePassword()"
                                                    class="absolute right-6 text-text-secondary hover:text-primary transition-colors p-1 flex items-center justify-center">
                                                    <span id="passwordIcon"
                                                        class="material-symbols-outlined text-[24px]">visibility</span>
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Terms and Conditions -->
                                        <div class="flex items-start gap-3 px-4">
                                            <input type="checkbox" id="terms" required
                                                class="mt-1 w-4 h-4 rounded border-gray-300 text-primary focus:ring-primary" />
                                            <label for="terms" class="text-sm text-text-secondary">
                                                Tôi đồng ý với <a href="#"
                                                    class="text-primary font-bold hover:underline">Điều khoản dịch
                                                    vụ</a> và
                                                <a href="#" class="text-primary font-bold hover:underline">Chính sách
                                                    bảo
                                                    mật</a> của Bếp Cloud.
                                            </label>
                                        </div>

                                        <!-- Submit Button -->
                                        <button type="submit"
                                            class="group relative flex items-center justify-center w-full h-15 rounded-full bg-primary hover:bg-primary-hover text-white text-lg font-bold tracking-wide shadow-xl shadow-primary/20 transition-all hover:-translate-y-0.5 active:scale-[0.98]">
                                            <span>Đăng ký ngay</span>
                                            <div
                                                class="absolute inset-0 rounded-full bg-white/10 opacity-0 group-hover:opacity-100 transition-opacity">
                                            </div>
                                        </button>
                            </form>

                            <!-- Redirect to Login -->
                            <div class="text-center pt-4 border-t border-border mt-10">
                                <p class="text-text-secondary text-lg font-medium">
                                    Đã có tài khoản?
                                    <a href="${pageContext.request.contextPath}/login.jsp"
                                        class="text-primary hover:text-primary-hover font-black ml-2 transition-colors inline-block hover:scale-105">
                                        Đăng nhập ngay
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>

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