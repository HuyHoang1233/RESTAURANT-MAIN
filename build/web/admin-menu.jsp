<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý thực đơn - Danran</title>
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
        <% if (session.getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath()
                        + "/login.jsp");
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
                    <a href="${pageContext.request.contextPath}/dashboard.jsp"
                       class="flex items-center gap-3 p-3 hover:bg-white/5 rounded-xl transition-colors text-gray-400 hover:text-white">
                        <span class="material-symbols-outlined">dashboard</span> Dashboard
                    </a>
                    <a href="#"
                       class="flex items-center gap-3 p-3 bg-primary rounded-xl text-white font-bold">
                        <span class="material-symbols-outlined">restaurant_menu</span> Thực đơn
                    </a>
                    <a href="#"
                       class="flex items-center gap-3 p-3 hover:bg-white/5 rounded-xl transition-colors text-gray-400 hover:text-white">
                        <span class="material-symbols-outlined">inventory_2</span> Kho hàng
                    </a>
                    <a href="#"
                       class="flex items-center gap-3 p-3 hover:bg-white/5 rounded-xl transition-colors text-gray-400 hover:text-white">
                        <span class="material-symbols-outlined">analytics</span> Báo cáo
                    </a>
                </nav>
                <div class="p-4 border-t border-white/10">
                    <a href="${pageContext.request.contextPath}/logout"
                       class="flex items-center gap-3 p-3 text-red-400 hover:bg-red-400/10 rounded-xl transition-colors">
                        <span class="material-symbols-outlined">logout</span> Đăng xuất
                    </a>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="flex-1 flex flex-col overflow-hidden">
                <!-- Header -->
                <header
                    class="h-20 bg-white border-b border-gray-100 flex items-center justify-between px-8">
                    <h2 class="text-xl font-bold text-secondary">Quản lý thực đơn</h2>
                    <button onclick="openModal('add')"
                            class="flex items-center gap-2 bg-primary hover:bg-primary-hover text-white px-5 py-2.5 rounded-full font-bold shadow-lg shadow-primary/20 transition-all">
                        <span class="material-symbols-outlined text-sm">add</span> Thêm món mới
                    </button>
                </header>

                <!-- Content -->
                <div class="flex-1 overflow-y-auto p-8">
                    <div class="bg-white rounded-[2rem] border border-gray-100 shadow-sm overflow-hidden">
                        <table class="w-full text-left border-collapse">
                            <thead>
                                <tr class="bg-gray-50 border-b border-gray-100 text-xs uppercase text-gray-400">
                                    <th class="p-6 font-bold">Món ăn</th>
                                    <th class="p-6 font-bold">Giá bán</th>
                                    <th class="p-6 font-bold">Trạng thái</th>
                                    <th class="p-6 font-bold text-right">Hành động</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <c:forEach var="p" items="${products}">
                                    <tr class="hover:bg-gray-50/50 transition-colors group">
                                        <td class="p-6">
                                            <div class="flex items-center gap-4">
                                                <img src="${p.imageUrl}" alt="${p.name}"
                                                     class="w-16 h-16 rounded-xl object-cover bg-gray-100">
                                                <div>
                                                    <h4 class="font-bold text-secondary text-lg">${p.name}
                                                    </h4>
                                                    <p class="text-gray-400 text-sm line-clamp-1 max-w-xs">
                                                        ${p.description}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="p-6 font-bold text-secondary">
                                            <fmt:formatNumber value="${p.price}" type="currency"
                                                              currencySymbol="đ" />
                                            ${String.format("%,.0f", p.price)} đ
                                        </td>
                                        <td class="p-6">
                                            <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold ${p.available ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}">
                                                <span class="w-1.5 h-1.5 rounded-full ${p.available ? 'bg-green-600' : 'bg-red-600'}"></span>
                                                ${p.available ? 'Đang bán' : 'Hết hàng'}
                                            </span>
                                        </td>
                                        <td class="p-6 text-right">
                                            <div class="flex items-center justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                                <button onclick="openEditModal(${p.id}, '${p.name}', '${p.description}', ${p.price}, ${p.available})"
                                                    class="w-8 h-8 rounded-full bg-gray-100 hover:bg-blue-50 text-gray-500 hover:text-blue-600 flex items-center justify-center transition-colors">
                                                    <span class="material-symbols-outlined text-[18px]">edit</span>
                                                </button>
                                                <form action="menu" method="POST"
                                                      onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="id" value="${p.id}">
                                                    <button type="submit"
                                                            class="w-8 h-8 rounded-full bg-gray-100 hover:bg-red-50 text-gray-500 hover:text-red-600 flex items-center justify-center transition-colors">
                                                        <span class="material-symbols-outlined text-[18px]">delete</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty products}">
                                    <tr>
                                        <td colspan="4" class="p-12 text-center text-gray-400">
                                            <div class="flex flex-col items-center gap-4">
                                                <span class="material-symbols-outlined text-4xl">inventory_2</span>
                                                <p>Chưa có món ăn nào trong thực đơn.</p>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>

        <!-- Modal Form -->
        <div id="productModal" class="fixed inset-0 z-50 hidden">
            <div class="absolute inset-0 bg-black/40 backdrop-blur-sm transition-opacity"
                 onclick="closeModal()"></div>
            <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full max-w-lg bg-white rounded-[2rem] shadow-2xl p-8 transform transition-transform scale-100">
                <h3 id="modalTitle" class="text-2xl font-black text-secondary mb-6">Thêm món mới</h3>

                <form action="menu" method="POST" enctype="multipart/form-data" class="space-y-6">
                    <input type="hidden" name="action" id="formAction" value="add">
                    <input type="hidden" name="id" id="productId" value="">

                    <div class="space-y-2">
                        <label class="text-sm font-bold text-gray-500 uppercase">Tên món ăn</label>
                        <input type="text" name="name" id="productName" required
                               class="w-full h-12 px-4 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-primary outline-none font-bold text-secondary">
                    </div>

                    <div class="space-y-2">
                        <label class="text-sm font-bold text-gray-500 uppercase">Hình ảnh</label>
                        <div class="flex items-center gap-4">
                            <div class="size-16 rounded-xl bg-gray-100 border border-gray-200 flex items-center justify-center overflow-hidden relative shrink-0">
                                <img id="imagePreview" src="" class="w-full h-full object-cover hidden">
                                <span id="imagePlaceholder"
                                      class="material-symbols-outlined text-gray-300">image</span>
                            </div>
                            <input type="file" name="image" id="productImage" accept="image/*"
                                   onchange="previewImage(this)"
                                   class="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-xs file:font-bold file:bg-primary/10 file:text-primary hover:file:bg-primary/20 cursor-pointer">
                        </div>
                    </div>

                    <div class="space-y-2">
                        <label class="text-sm font-bold text-gray-500 uppercase">Mô tả</label>
                        <textarea name="description" id="productDesc" rows="3"
                                  class="w-full p-4 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-primary outline-none font-medium text-secondary resize-none"></textarea>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-2">
                            <label class="text-sm font-bold text-gray-500 uppercase">Giá bán (VNĐ)</label>
                            <input type="number" name="price" id="productPrice" required
                                   class="w-full h-12 px-4 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-primary outline-none font-bold text-secondary">
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-bold text-gray-500 uppercase">Trạng thái</label>
                            <div class="h-12 flex items-center gap-3">
                                <input type="checkbox" name="isAvailable" id="productStatus" checked
                                       class="w-6 h-6 text-primary rounded border-gray-300 focus:ring-primary">
                                <span class="font-medium">Đang bán</span>
                            </div>
                        </div>
                    </div>

                    <div class="pt-4 flex gap-4">
                        <button type="button" onclick="closeModal()"
                                class="flex-1 h-12 bg-gray-100 hover:bg-gray-200 text-gray-600 font-bold rounded-xl transition-colors">Hủy</button>
                        <button type="submit"
                                class="flex-1 h-12 bg-primary hover:bg-primary-hover text-white font-bold rounded-xl shadow-lg shadow-primary/20 transition-colors">
                            Lưu món ăn</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function openModal(mode) {
                const modal = document.getElementById('productModal');
                const title = document.getElementById('modalTitle');
                const action = document.getElementById('formAction');

                // Reset form
                if (mode === 'add') {
                    title.textContent = 'Thêm món mới';
                    action.value = 'add';
                    document.getElementById('productId').value = '';
                    document.getElementById('productName').value = '';
                    document.getElementById('productDesc').value = '';
                    document.getElementById('productPrice').value = '';
                    document.getElementById('productStatus').checked = true;
                }

                modal.classList.remove('hidden');
            }

            function openEditModal(id, name, desc, price, available) {
                const modal = document.getElementById('productModal');
                const title = document.getElementById('modalTitle');
                const action = document.getElementById('formAction');

                title.textContent = 'Chỉnh sửa món ăn';
                action.value = 'update';

                document.getElementById('productId').value = id;
                document.getElementById('productName').value = name;
                document.getElementById('productDesc').value = desc;
                document.getElementById('productPrice').value = price;
                document.getElementById('productStatus').checked = available;

                modal.classList.remove('hidden');
            }

            function closeModal() {
                document.getElementById('productModal').classList.add('hidden');
            }

            function previewImage(input) {
                const preview = document.getElementById('imagePreview');
                const placeholder = document.getElementById('imagePlaceholder');

                if (input.files && input.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.classList.remove('hidden');
                        placeholder.classList.add('hidden');
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </body>

</html>