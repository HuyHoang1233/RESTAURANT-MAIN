package danran.util; // Chuẩn package không có chữ 's'

// 👇 KIỂM TRA DÒNG NÀY: Nếu báo đỏ, hãy đổi thành danran.dao.DBContext
import danran.dal.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * File này dùng để chạy thử (Test) xem kết nối Database có ổn không và liệt kê
 * danh sách Email đang có. * CÁCH CHẠY: Chuột phải vào file này -> Chọn "Run
 * File" (Shift + F6)
 */
public class ListAllEmails extends DBContext {

    public void listAllUsers() {
        System.out.println("=========================================");
        System.out.println("📧  DANH SÁCH EMAIL TRONG DATABASE (Users)");
        System.out.println("=========================================\n");

        try {
            // 1. Kiểm tra kết nối
            // Nếu class DBContext của bạn dùng biến 'connection' (protected)
            if (connection == null) {
                // Thử khởi tạo lại nếu connection chưa có
                new DBContext();
                if (connection == null) {
                    System.err.println("❌ LỖI: Không thể kết nối đến Database!");
                    System.err.println("👉 Vui lòng kiểm tra lại file DBContext.java (user, pass, port).");
                    return;
                }
            }

            // 2. Viết câu lệnh SQL
            // Lưu ý: Tên bảng là Users hay User? (Kiểm tra trong SQL Server)
            String sql = "SELECT * FROM Users";

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            int count = 0;
            // 3. Duyệt và in kết quả
            while (rs.next()) {
                count++;
                int id = rs.getInt("user_id"); // Đảm bảo tên cột đúng trong SQL
                String user = rs.getString("username");
                String email = rs.getString("email");

                // In ra màn hình console
                System.out.println(String.format("User #%d: [ID: %d] - [User: %s] - [Email: %s]", count, id, user, email));
            }

            System.out.println("\n-----------------------------------------");
            if (count == 0) {
                System.out.println("⚠️  Database trống! Chưa có tài khoản nào.");
            } else {
                System.out.println("✅  Tổng cộng: " + count + " tài khoản.");
                System.out.println("👉  Hãy copy một Email ở trên để test chức năng Quên mật khẩu.");
            }
            System.out.println("=========================================");

            rs.close();
            ps.close();

        } catch (Exception e) {
            System.err.println("❌ CÓ LỖI XẢY RA KHI ĐỌC DATABASE:");
            e.printStackTrace();
            System.out.println("💡 Gợi ý sửa lỗi: Kiểm tra lại tên bảng (Users) hoặc tên cột (user_id, email) trong SQL Server.");
        }
    }

    public static void main(String[] args) {
        ListAllEmails app = new ListAllEmails();
        app.listAllUsers();
    }
}
