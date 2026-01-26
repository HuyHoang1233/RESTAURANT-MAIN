package danran.controller;

import danran.dao.OrderDAO;
import danran.model.CartItem;
import danran.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CheckoutServlet", urlPatterns = { "/checkout" })
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user"); // May be null

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Calculate total
        double subtotal = 0;
        for (CartItem item : cart) {
            subtotal += item.getPrice() * item.getQuantity();
        }

        double shippingFee = 15000;
        double discount = (subtotal > 150000) ? shippingFee : 0;
        double totalAmount = subtotal + shippingFee - discount;

        // Save order
        OrderDAO dao = new OrderDAO();
        boolean success = dao.createOrder(user, cart, totalAmount);

        if (success) {
            // Clear cart
            session.removeAttribute("cart");
            request.setAttribute("totalAmount", totalAmount);
            request.getRequestDispatcher("order-success.jsp").forward(request, response);
        } else {
            // Error handling
            request.setAttribute("errorMessage", "Äáº·t hÃ ng tháº¥t báº¡i. Vui lÃ²ng thá»­ láº¡i sau.");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }
}


