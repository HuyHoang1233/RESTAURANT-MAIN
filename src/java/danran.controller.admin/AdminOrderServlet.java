package danran.controller.admin;

import danran.dao.OrderDAO;
import danran.model.Order;
import danran.model.OrderDetail;
import danran.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminOrderServlet", urlPatterns = { "/admin/orders" })
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check verification: Must be logged in and Role = 1 (Admin/Owner)
        if (user == null || user.getRoleId() != 1) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.getAllOrders();

        // If user wants to see details of a specific order
        String orderIdDetails = request.getParameter("id");
        if (orderIdDetails != null) {
            try {
                int id = Integer.parseInt(orderIdDetails);
                List<OrderDetail> details = dao.getOrderDetails(id);
                request.setAttribute("selectedOrderDetails", details);
                request.setAttribute("selectedOrderId", id);
            } catch (NumberFormatException e) {
                // ignore
            }
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin-orders.jsp").forward(request, response);
    }
}


