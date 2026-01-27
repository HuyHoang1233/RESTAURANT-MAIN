# 🔧 HƯỚNG DẪN FIX LỖI EMAIL - FORGOT PASSWORD

## ⚠️ VẤN ĐỀ HIỆN TẠI:
**"Lỗi gửi mail! Vui lòng kiểm tra lại kết nối mạng"**

Lỗi này xảy ra vì Gmail SMTP không hoạt động. Có thể do:
- App Password không đúng
- Chưa bật 2-Step Verification
- Firewall chặn port 587
- Vấn đề kết nối internet

---

## ✅ GIẢI PHÁP ĐÃ TRIỂN KHAI:

### 🧪 **TESTING MODE (Đã bật sẵn)**

File đã sửa: `ForgotPasswordServlet.java`

```java
private static final boolean TESTING_MODE = true;
```

**Khi TESTING_MODE = true:**
- ✅ Không gửi email thật
- ✅ OTP hiển thị trực tiếp trên màn hình
- ✅ OTP được log trong console Tomcat
- ✅ Có thể test chức năng forgot password ngay lập tức

---

## 📋 CÁCH SỬ DỤNG:

### **Bước 1: Tạo Test Users trong Database**

Mở SQL Server Management Studio và chạy file:
```
create-test-users.sql
```

Script này sẽ tạo 3 users:
- **Email:** admin@restaurant.com | **Password:** 123456
- **Email:** test@gmail.com | **Password:** 123456
- **Email:** user@test.com | **Password:** 123456

### **Bước 2: Build và Deploy**

1. Clean and Build project (Shift + F11)
2. Run project (F6)

### **Bước 3: Test Forgot Password**

1. Vào: `http://localhost:8080/Restaurant_Management/forgot-password`
2. Nhập một trong các email test:
   - `admin@restaurant.com`
   - `test@gmail.com`
   - `user@test.com`
3. Click "Gửi mã OTP"
4. **OTP sẽ hiển thị ngay trên màn hình!**
5. Copy OTP và paste vào trang verify-otp
6. Nhập mật khẩu mới

### **Bước 4: Kiểm tra Console**

Trong Tomcat console, bạn sẽ thấy:
```
==============================================
🧪 TESTING MODE - OTP không được gửi qua email
📧 Email: test@gmail.com
🔑 OTP Code: 123456
==============================================
```

---

## 🔥 KHI NÀO TẮT TESTING MODE?

**Sau khi fix xong Gmail App Password**, đổi trong `ForgotPasswordServlet.java`:

```java
private static final boolean TESTING_MODE = false;
```

---

## 📧 CÁCH FIX GMAIL APP PASSWORD:

### **Bước 1: Bật 2-Step Verification**
1. Vào: https://myaccount.google.com/security
2. Click "2-Step Verification"
3. Follow hướng dẫn để bật

### **Bước 2: Tạo App Password**
1. Vào: https://myaccount.google.com/apppasswords
2. Select app: **Mail**
3. Select device: **Other (Custom name)** → Nhập "Restaurant Management"
4. Click **Generate**
5. Copy password (16 ký tự, **KHÔNG CÓ KHOẢNG TRẮNG**)

### **Bước 3: Cập nhật Code**

Mở `EmailUtils.java` (dòng 22):
```java
private static final String APP_PASSWORD = "YOUR_NEW_APP_PASSWORD_HERE";
```

### **Bước 4: Test Email Thật**

1. Vào: `http://localhost:8080/Restaurant_Management/test-email.jsp`
2. Test gửi email
3. Nếu thành công → Đổi TESTING_MODE = false

---

## 🎯 TÓM TẮT NHANH:

### ✅ HIỆN TẠI (Testing Mode):
- Chạy SQL script tạo users
- Build project
- Test forgot password với email: `admin@restaurant.com`
- OTP hiển thị trên màn hình
- **KHÔNG CẦN** cấu hình Gmail

### 🔜 SAU NÀY (Production Mode):
- Fix Gmail App Password
- Đổi TESTING_MODE = false
- OTP sẽ được gửi qua email thật

---

## 📞 TROUBLESHOOTING:

### Lỗi: "Email này chưa được đăng ký trong hệ thống"
→ Chạy file `create-test-users.sql`

### Lỗi: OTP không hiển thị
→ Kiểm tra console Tomcat để xem OTP code

### Lỗi: Build failed
→ Clean and Build lại project

---

**🎉 BÂY GIỜ BẠN CÓ THỂ TEST FORGOT PASSWORD MÀ KHÔNG CẦN EMAIL!**
