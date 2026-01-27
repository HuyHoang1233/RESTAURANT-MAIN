package danran.dao;

import danran.dal.DBContext;
import danran.model.CartItem;
import danran.model.Order;
import danran.model.OrderDetail;
import danran.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO extends DBContext {

    // Create a new order with transaction
    public boolean createOrder(User user, List<CartItem> cart, double totalAmount) {
        if (connection == null)
            return false;

        String insertOrderSql = "INSERT INTO Orders (user_id, total_amount, status) VALUES (?, ?, ?)";
        String insertDetailSql = "INSERT INTO OrderDetails (order_id, product_name, price, quantity, image_url) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement psOrder = null;
        PreparedStatement psDetail = null;
        ResultSet rs = null;

        try {
            connection.setAutoCommit(false); // Start Transaction

            // 1. Insert Order
            psOrder = connection.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS);
            if (user != null) {
                psOrder.setInt(1, user.getUserId());
            } else {
                psOrder.setNull(1, java.sql.Types.INTEGER);
            }
            psOrder.setDouble(2, totalAmount);
            psOrder.setString(3, "Pending");

            int affectedRows = psOrder.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            // Get generated Order ID
            int orderId = 0;
            rs = psOrder.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }

            // 2. Insert Order Details
            psDetail = connection.prepareStatement(insertDetailSql);
            for (CartItem item : cart) {
                psDetail.setInt(1, orderId);
                psDetail.setString(2, item.getName());
                psDetail.setDouble(3, item.getPrice());
                psDetail.setInt(4, item.getQuantity());
                psDetail.setString(5, item.getImageUrl());
                psDetail.addBatch();
            }

            psDetail.executeBatch();

            connection.commit(); // Commit Transaction
            return true;

        } catch (SQLException e) {
            try {
                if (connection != null)
                    connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        } finally {
            try {
                if (connection != null)
                    connection.setAutoCommit(true);
                if (rs != null)
                    rs.close();
                if (psOrder != null)
                    psOrder.close();
                if (psDetail != null)
                    psDetail.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // Get all orders (for Admin)
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        // Left join with Users to get full_name if available
        String sql = "SELECT o.*, u.full_name FROM Orders o LEFT JOIN Users u ON o.user_id = u.user_id ORDER BY o.created_at DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setCreatedAt(rs.getTimestamp("created_at"));

                String customerName = rs.getString("full_name");
                if (customerName == null)
                    customerName = "Guest/Unknown";
                order.setCustomerName(customerName);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    // Get details for an order
    public List<OrderDetail> getOrderDetails(int orderId) {
        List<OrderDetail> details = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetails WHERE order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setDetailId(rs.getInt("detail_id"));
                detail.setOrderId(rs.getInt("order_id"));
                detail.setProductName(rs.getString("product_name"));
                detail.setPrice(rs.getDouble("price"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setImageUrl(rs.getString("image_url"));
                detail.setTotalPrice(detail.getPrice() * detail.getQuantity());
                details.add(detail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return details;
    }
}
