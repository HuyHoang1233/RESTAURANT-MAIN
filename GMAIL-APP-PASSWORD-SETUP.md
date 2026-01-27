# 📧 HƯỚNG DẪN CẤU HÌNH GMAIL ĐỂ GỬI EMAIL

## ⚠️ QUAN TRỌNG:
Để gửi email thật, bạn CẦN có **Gmail App Password**. 
App Password `iijjInrufchhnwad` trong code hiện tại có thể KHÔNG ĐÚNG hoặc đã hết hạn.

---

## 📋 BƯỚC 1: TẠO GMAIL APP PASSWORD MỚI

### **1.1. Bật 2-Step Verification**
1. Vào: https://myaccount.google.com/security
2. Đăng nhập với Gmail: **hoangchanelqbvn@gmail.com**
3. Tìm **"2-Step Verification"** → Click vào
4. Nếu chưa bật, hãy **bật nó lên** (cực kỳ quan trọng!)

### **1.2. Tạo App Password**
1. Vào: https://myaccount.google.com/apppasswords
2. Hoặc: Google Account → Security → 2-Step Verification → **App passwords** (ở cuối trang)
3. Click **Create App Password**
4. Chọn:
   - App: **Mail**
   - Device: **Other (Custom name)** → Nhập: `Restaurant Management`
5. Click **Generate**
6. **QUAN TRỌNG:** Copy password (16 ký tự) **NGAY LẬP TỨC**
   - Ví dụ: `abcdefghijklmnop`
   - **KHÔNG CÓ KHOẢNG TRẮNG!**
   - Bạn chỉ thấy nó 1 lần duy nhất!

---

## 🔧 BƯỚC 2: CẬP NHẬT CODE

Mở file: `EmailUtils.java` (dòng 22-23)

Thay thế:
```java
private static final String EMAIL_FROM = "hoangchanelqbvn@gmail.com";
private static final String APP_PASSWORD = "iijjInrufchhnwad"; // Mật khẩu của bạn
```

Thành:
```java
private static final String EMAIL_FROM = "email_cua_ban@gmail.com"; // ← Đổi thành email của BẠN
private static final String APP_PASSWORD = "abcdefghijklmnop"; // ← Paste App Password vừa copy
```

**Ví dụ cụ thể:**
```java
private static final String EMAIL_FROM = "thanhthaoo1425@gmail.com";
private static final String APP_PASSWORD = "xyzw abcd efgh ijkl"; // ← PASTE APP PASSWORD THẬT VÀO ĐÂY
```

⚠️ **LƯU Ý:** Xóa tất cả khoảng trắng khỏi App Password!

---

## 🚀 BƯỚC 3: TEST EMAIL

### **3.1. Build và Deploy**
1. Clean and Build project (Shift + F11)
2. Run project (F6)

### **3.2. Test gửi email thật**
1. Vào: http://localhost:8080/Restaurant_Management/test-email.jsp
2. Nhập email THẬT của bạn (để nhận được mail)
3. Click **"Gửi Test Email"**
4. Kiểm tra:
   - **Console Tomcat** → Xem có lỗi không
   - **Hộp thư email** → Kiểm tra có nhận được không (kiểm tra cả Spam/Junk)

### **3.3. Nếu thành công**
- Console sẽ hiển thị: `✅ Email sent successfully to: ...`
- Bạn sẽ nhận được email với OTP
- ✅ **DONE!** Chức năng Forgot Password đã hoạt động!

### **3.4. Nếu thất bại**
Kiểm tra console để xem lỗi:

#### **Lỗi: "❌ LỖI ĐĂNG NHẬP: Sai App Password hoặc Email!"**
→ App Password KHÔNG ĐÚNG. Hãy:
- Tạo lại App Password mới
- Copy chính xác, không thêm khoảng trắng
- Paste vào `EmailUtils.java`

#### **Lỗi: "Connection timeout"**
→ Vấn đề mạng/firewall:
- Kiểm tra kết nối internet
- Tắt Firewall/Antivirus tạm thời để test
- Kiểm tra port 587 có bị chặn không

#### **Lỗi: "Authentication failed"**
→ 2-Step Verification chưa bật hoặc App Password sai

---

## 📝 CHECKLIST NHANH:

- [ ] Đã bật 2-Step Verification trên Gmail
- [ ] Đã tạo App Password mới
- [ ] Đã copy App Password (16 ký tự, không có khoảng trắng)
- [ ] Đã paste vào `EmailUtils.java` dòng 23
- [ ] Đã đổi `EMAIL_FROM` thành email của bạn
- [ ] Đã tắt `TESTING_MODE = false` trong `ForgotPasswordServlet.java`
- [ ] Đã Clean and Build project
- [ ] Đã test gửi email qua test-email.jsp

---

## 🔄 NẾU MUỐN QUAY LẠI TESTING MODE:

Mở `ForgotPasswordServlet.java`, đổi:
```java
private static final boolean TESTING_MODE = true; // Bật lại testing mode
```

---

## 💡 GỢI Ý:

### **Option 1: Dùng Email Riêng**
- Tạo App Password cho email CỦA BẠN
- Thay đổi `EMAIL_FROM` thành email của bạn
- Ưu điểm: An toàn, không chia sẻ thông tin

### **Option 2: Dùng Email Chung (Nhóm)**
- Tạo 1 Gmail mới cho cả nhóm (ví dụ: `restaurant.system@gmail.com`)
- Tạo App Password cho Gmail này
- Share App Password cho team
- Ưu điểm: Tất cả đều dùng chung, dễ quản lý

---

**🎉 SAU KHI CẤU HÌNH ĐÚNG, EMAIL SẼ ĐƯỢC GỬI THẬT!**
