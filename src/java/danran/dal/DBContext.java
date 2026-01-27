package danran.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            // --- CẤU HÌNH CỦA BẠN (KIỂM TRA KỸ) ---
            String user = "sa";
            String pass = "Hh121213"; // <-- HÃY SỬA LẠI MẬT KHẨU SQL CỦA MÁY BẠN Ở ĐÂY
            String dbName = "RestaurantManagementDB"; // <-- TÊN DATABASE PHẢI CHÍNH XÁC 100%
            
            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + dbName + 
                         ";encrypt=true;trustServerCertificate=true;characterEncoding=UTF-8;";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("Ket noi CSDL thanh cong!"); // Dòng này để báo hiệu kết nối OK
            
        } catch (ClassNotFoundException | SQLException ex) {
            // Dòng này cực quan trọng để biết lỗi gì: Sai pass hay chưa bật TCP/IP
            System.err.println("KET NOI CSDL THAT BAI! Xem loi chi tiet duoi day:");
            ex.printStackTrace(); 
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}