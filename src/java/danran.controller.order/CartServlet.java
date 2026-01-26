package danran.controller.order;

import danran.model.CartItem;
import danran.model.UpsellItem;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartServlet", urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {

    private static final List<UpsellItem> UPSELL_ITEMS = new ArrayList<>();

    static {
        UPSELL_ITEMS.add(new UpsellItem("u1", "BÃ¡nh Flan", 15000,
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBEELLIcZPciSIcBuKXQUeuIDiYZWO1oIPhnBSvSG2758GK1UfKZ3fFkrz8ILzFsqucmJCl_ON4lsz1Ybxwmfm1wDHXvZOw_aZdvG8rU5YXUZ_u5JMkAM_IviX-whTeeyaO1eGD3Hf6vfEDIBQauG5pbH5vFiZ12V16Nig_GbB1M7VmlgbBNtFBkTLaXcG9wa7BGkQBZmd0A6850k-G29LlLzq5lnsSQEbmMSJYNXTLMlh2rAf-3s0GY01q8RQpWoF86zTZAkp7V6rh"));
        UPSELL_ITEMS.add(new UpsellItem("u2", "KhÄƒn Giáº¥y Æ¯á»›t", 5000,
                "https://lh3.googleusercontent.com/aida-public/AB6AXuAhM-w--z6Sn7D5xXd54ydG8fIW0EAikYk_1PwFFyqTYlV6wT4aaoJULyxv4mkIRjJzdSKbaRbScGsQe6ir9iPl4XYjEpwybNVHa0ekixlYuKlYTrlemxnJ7Qy0eJ80WQQz2S9-Xg713YGts4QPjC7I7e42Y6CQE_CUmtmgZ3HxAZHD6y-vU2TLWyBxFEzDa5LXvEkQtffCcodqEewhFAwUpGA67K3-H--72TTKXvewEU797JM7OBYjvnI81tWqkK2bKEAmrLMajqOW"));
        UPSELL_ITEMS.add(new UpsellItem("u3", "BÃ¡nh Quy BÆ¡", 12000,
                "https://lh3.googleusercontent.com/aida-public/AB6AXuC2BIYMHA46FZBzLMWsP4xzT0j8IxTrvAMMif5i7t3FW9CNV2rKYfsyMunJQTMd-_Aa6_qUjAV0Bu123CnWSJ8T-2zNuN34-gZ_gbiB_qM7BMOasW316_yL3oYfTsa6zY7s4S3QkFRYFOWHmIK7UffXMlquFQC5ERIm0fbrLmXQTwRqhmuOEL_vUJWee2ugaH1_xUPEW3VD5aYjzgc6TnwPFl4bh9FlvmRcDxeA3R9kRQpFCR96PWJCDo9rh7COPHH0rt6EgUhQgDtS"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        // initialize cart if empty
        if (cart == null) {
            cart = new ArrayList<>();
            cart.add(new CartItem("1", "TrÃ  Sá»¯a TrÃ¢n ChÃ¢u ÄÆ°á»ng Äen",
                    "Size L â€¢ 50% ÄÆ°á»ng â€¢ 50% ÄÃ¡ â€¢ ThÃªm TrÃ¢n chÃ¢u tráº¯ng", 55000, 1,
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuB4AIHVGQqxznaoaX_X0CeC-pTwAIOBqmauaMoYFda_IFmTB6Q5PMUv4MJYQ0FJaDTwqpMB3igrBR1L-7cVhw-xxl340lgwwDRVxr3u5M8TIxxnMu1strOvfqV0V2F6RLJ4hL2kUxDVpKFH_Ueu1jMqmlHh42vjfEc_1RWRmoRyUQ_8t09_k-T03Azg1yM6ohFP28HB3519b1Fcz9wY24lctU7DMF-HYaspYpRZA1bFscOQsG4oRhiFGkJsZk3FYvSywMzLl-hhA8AC"));
            cart.add(new CartItem("2", "CÃ  PhÃª Muá»‘i Huáº¿", "Size M â€¢ Ãt Ä‘Ã¡ â€¢ ThÃªm Kem muá»‘i", 70000, 2,
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuDY0dvaW9NJ_A_3Snia4ctCA6rjdPmga2xFfpGe7advDbslkh_2rPM9AXtd8ehjSi9qlOaARWMCEb3pxe1wDUN4uGJdpW5St1WLhUZZLOGF7v9I08mbx3iGIlb2jOa8eE0cHfTW38K-ao90NnSrAL3wcCju5sJuahfj1yDrFi8oMw0PkLaSqbPMB4uHjTJLIxodrt0TKWQ0aVywCdcqXHI9R-G7JRMtirTSeXgIYfp2gkGeiPJALCtUwMIV7Q2oDMDRrpMohVKq4U2K"));
            cart.add(new CartItem("3", "BÃ¡nh PhÃ´ Mai DÃ¢u", "1 cÃ¡i", 45000, 1,
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuDzfbbx-5Zhe7PI2G0RbDHySgV4fET5VVGJRaQ6x7uZFUaSSWJsswtBB6HPGA8wsajRXB34GVSzat3XQM3rj71SDJah6RAxWRTYIiXZFxpR3LoXvlSJ2k-VR_EffTyQVqU7rtqgTa_aJhFgAX5l0UsYltIL-mTT6Fyh1RhLH2EJqjh3yZksr1XmuLE3eSPxDkT-yFECotvuNQilJs6b0wPGeVjo2mjscKJl3TsI0PesKaMJLJ_H5umoK1Y3MunruKcQFQG-jRFBhU_B"));
            session.setAttribute("cart", cart);
        }

        request.setAttribute("upsellItems", UPSELL_ITEMS);
        calculateUnpackedTotals(request, cart);

        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null)
            cart = new ArrayList<>();

        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if ("update".equals(action)) {
            int delta = Integer.parseInt(request.getParameter("delta"));
            for (CartItem item : cart) {
                if (item.getId().equals(id)) {
                    int newQty = item.getQuantity() + delta;
                    if (newQty >= 1) {
                        item.setQuantity(newQty);
                    }
                    break;
                }
            }
        } else if ("remove".equals(action)) {
            cart.removeIf(item -> item.getId().equals(id));
        } else if ("clear".equals(action)) {
            cart.clear();
        } else if ("addUpsell".equals(action)) {
            String upsellId = request.getParameter("upsellId");
            UpsellItem uItem = UPSELL_ITEMS.stream().filter(u -> u.getId().equals(upsellId)).findFirst().orElse(null);
            if (uItem != null) {
                // Check if already in cart by name
                boolean found = false;
                for (CartItem item : cart) {
                    if (item.getName().equals(uItem.getName())) {
                        item.setQuantity(item.getQuantity() + 1);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    CartItem newItem = new CartItem(
                            String.valueOf(System.currentTimeMillis()),
                            uItem.getName(),
                            "MÃ³n thÃªm",
                            uItem.getPrice(),
                            1,
                            uItem.getImageUrl());
                    cart.add(newItem);
                }
            }
        } else if ("applyVoucher".equals(action)) {
            String code = request.getParameter("voucherCode");
            session.setAttribute("voucherCode", code);
        } else if ("removeVoucher".equals(action)) {
            session.removeAttribute("voucherCode");
        } else if ("add".equals(action)) {
            try {
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String description = request.getParameter("description");
                // Simplified mock ID generation
                String itemId = String.valueOf(System.currentTimeMillis());

                // Use a default image if none provided or client doesn't send one
                // In a real app, you'd lookup by productId from DB
                String imageUrl = request.getParameter("imageUrl");
                if (imageUrl == null || imageUrl.isEmpty()) {
                    imageUrl = "https://placehold.co/400x300?text=" + name; // Fallback
                }

                // Check if item details match an existing one to merge (optional, for simple
                // equality)
                boolean found = false;
                for (CartItem item : cart) {
                    // This is a naive check. In reality, you'd compare Option Hash or IDs.
                    if (item.getName().equals(name) &&
                            (item.getDescription() == null ? description == null
                                    : item.getDescription().equals(description))) {
                        item.setQuantity(item.getQuantity() + quantity);
                        found = true;
                        break;
                    }
                }

                if (!found) {
                    cart.add(new CartItem(itemId, name, description, price, quantity, imageUrl));
                }
            } catch (Exception e) {
                e.printStackTrace(); // Handle parsing errors
            }
        }

        session.setAttribute("cart", cart);

        // Return JSON if requested (for AJAX), otherwise redirect
        String acceptObj = request.getHeader("Accept");
        if (acceptObj != null && acceptObj.contains("application/json")) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"success\", \"count\":" + cart.size() + "}");
            return;
        }

        response.sendRedirect("cart");
    }

    // Calculate totals for rendering
    private void calculateUnpackedTotals(HttpServletRequest request, List<CartItem> cart) {
        double subtotal = 0;
        for (CartItem item : cart) {
            subtotal += item.getPrice() * item.getQuantity();
        }

        // Requirement: No shipping fee
        double shippingFee = 0;

        // Requirement: Replace discount with voucher
        // For now, we mock a voucher if applied (handled via session or simple mock)
        HttpSession session = request.getSession();
        String voucherCode = (String) session.getAttribute("voucherCode");
        double voucherDiscount = 0;

        if ("DANRAN2024".equalsIgnoreCase(voucherCode)) {
            voucherDiscount = 15000;
        }

        double total = subtotal + shippingFee - voucherDiscount;
        if (total < 0)
            total = 0;

        request.setAttribute("subtotal", subtotal);
        request.setAttribute("shippingFee", shippingFee);
        request.setAttribute("voucherDiscount", voucherDiscount);
        request.setAttribute("total", total);
    }
}
