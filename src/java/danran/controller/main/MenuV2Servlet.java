package danran.controller.main;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import danran.dao.ProductDAO;
import danran.model.Product;

@WebServlet(name = "MenuV2Servlet", urlPatterns = { "/menu-v2" })
public class MenuV2Servlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    // Category data structure
    public static class Category {
        private int id;
        private String name;
        private String description;
        private String icon;

        public Category(int id, String name, String description, String icon) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.icon = icon;
        }

        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public String getDescription() {
            return description;
        }

        public String getIcon() {
            return icon;
        }
    }

    private static final List<Category> CATEGORIES = Arrays.asList(
            new Category(1, "Combo", "Tiết kiệm hơn khi đặt combo", "restaurant"),
            new Category(2, "Cà phê", "Hương vị đậm đà từ hạt Arabica", "coffee"),
            new Category(3, "Trà & Đồ uống", "Thức uống giải khát tươi mát", "emoji_food_beverage"),
            new Category(4, "Đồ ăn", "Món ăn thơm ngon hấp dẫn", "restaurant_menu"),
            new Category(5, "Tráng miệng", "Ngọt ngào kết thúc bữa ăn", "cake"));

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get search query parameter
        String searchQuery = request.getParameter("q");
        String categoryParam = request.getParameter("category");
        Integer categoryFilter = null;

        if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                categoryFilter = Integer.parseInt(categoryParam);
            } catch (NumberFormatException e) {
                // Invalid category, ignore
            }
        }

        // Fetch all products
        List<Product> products = productDAO.getAllProducts();

        // Auto-seed if empty (reuse logic from MenuServlet)
        if (products.isEmpty()) {
            seedData();
            products = productDAO.getAllProducts();
        }

        // Group products by category
        Map<Integer, List<Product>> productsByCategory = new LinkedHashMap<>();
        for (Category cat : CATEGORIES) {
            productsByCategory.put(cat.getId(), new ArrayList<>());
        }

        for (Product p : products) {
            int catId = p.getCategoryId();
            if (productsByCategory.containsKey(catId)) {
                productsByCategory.get(catId).add(p);
            }
        }

        // Apply filters
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            String query = searchQuery.toLowerCase();
            for (Map.Entry<Integer, List<Product>> entry : productsByCategory.entrySet()) {
                List<Product> filtered = new ArrayList<>();
                for (Product p : entry.getValue()) {
                    if (p.getName().toLowerCase().contains(query) ||
                            p.getDescription().toLowerCase().contains(query)) {
                        filtered.add(p);
                    }
                }
                entry.setValue(filtered);
            }
        }

        if (categoryFilter != null) {
            // Only include the selected category
            Map<Integer, List<Product>> filtered = new LinkedHashMap<>();
            if (productsByCategory.containsKey(categoryFilter)) {
                filtered.put(categoryFilter, productsByCategory.get(categoryFilter));
            }
            productsByCategory = filtered;
        }

        // Set attributes
        request.setAttribute("categories", CATEGORIES);
        request.setAttribute("productsByCategory", productsByCategory);
        request.setAttribute("searchQuery", searchQuery != null ? searchQuery : "");
        request.setAttribute("activeCategory", categoryFilter);

        // Get current cart for sidebar
        List<?> cart = (List<?>) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        request.setAttribute("cart", cart);

        request.getRequestDispatcher("menu-v2.jsp").forward(request, response);
    }

    private void seedData() {
        // Reuse seed logic from MenuServlet
        // Category 1: Combo
        productDAO.addProduct(new Product(0, "Combo Burger Đôi",
                "2 Burger bò Úc + Khoai tây chiên + 2 Pepsi. Tiết kiệm 50k!", 199000,
                "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop", 1,
                true));
        productDAO.addProduct(new Product(0, "Combo Pizza Party",
                "Pizza size L + 4 Gà rán + Salad + 4 Nước ngọt.", 399000,
                "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&h=300&fit=crop", 1,
                true));
        productDAO.addProduct(new Product(0, "Combo Gia Đình",
                "Set 4 người ăn với thịt nướng, cơm chiên và rau củ.", 599000,
                "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop", 1,
                true));

        // Category 2: Coffee
        productDAO.addProduct(new Product(0, "Cà phê Sữa đá",
                "Cà phê phin truyền thống pha với sữa đặc thơm ngọt.", 29000,
                "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&h=300&fit=crop", 2,
                true));
        productDAO.addProduct(new Product(0, "Americano",
                "Espresso pha loãng với nước nóng, đậm đà tinh tế.", 39000,
                "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400&h=300&fit=crop", 2,
                true));
        productDAO.addProduct(new Product(0, "Cappuccino",
                "Espresso với bọt sữa mịn màng, rắc bột cacao.", 45000,
                "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400&h=300&fit=crop", 2,
                true));
        productDAO.addProduct(new Product(0, "Latte",
                "Cà phê Espresso pha với sữa tươi nóng, béo mịn.", 45000,
                "https://images.unsplash.com/photo-1561047029-3000c68339ca?w=400&h=300&fit=crop", 2,
                true));

        // Category 3: Tea
        productDAO.addProduct(new Product(0, "Trà sữa Trân châu đường đen",
                "Trà sữa Đài Loan với trân châu tươi ngâm đường đen.", 45000,
                "https://images.unsplash.com/photo-1558857563-b371033873b8?w=400&h=300&fit=crop", 3,
                true));
        productDAO.addProduct(new Product(0, "Trà Đào Cam Sả",
                "Trà hoa quả tươi mát với đào, cam và sả thơm nồng.", 39000,
                "https://images.unsplash.com/photo-1541167760496-1628856ab772?w=400&h=300&fit=crop", 3,
                true));
        productDAO.addProduct(new Product(0, "Matcha Latte",
                "Matcha Nhật Bản pha với sữa tươi béo ngậy.", 55000,
                "https://images.unsplash.com/photo-1587049352851-8d4e89133924?w=400&h=300&fit=crop", 3,
                true));

        // Category 4: Food
        productDAO.addProduct(new Product(0, "Burger Bò Phô Mai",
                "Burger bò nướng với phô mai cheddar tan chảy.", 65000,
                "https://images.unsplash.com/photo-1550547660-d9450f859349?w=400&h=300&fit=crop", 4,
                true));
        productDAO.addProduct(new Product(0, "Gà rán giòn",
                "Gà tẩm bột chiên giòn thơm lừng, kèm sốt mật ong.", 55000,
                "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=400&h=300&fit=crop", 4,
                true));
        productDAO.addProduct(new Product(0, "Khoai tây chiên",
                "Khoai tây chiên giòn vàng đều, kèm sốt tương ớt.", 35000,
                "https://images.unsplash.com/photo-1630384060421-cb20aed52c83?w=400&h=300&fit=crop", 4,
                true));
        productDAO.addProduct(new Product(0, "Sandwich Gà Nướng",
                "Bánh mì sandwich với gà nướng, rau xà lách tươi.", 49000,
                "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=400&h=300&fit=crop", 4,
                true));

        // Category 5: Dessert
        productDAO.addProduct(new Product(0, "Tiramisu",
                "Bánh Tiramisu Ý với kem mascarpone và cà phê espresso.", 69000,
                "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400&h=300&fit=crop", 5,
                true));
        productDAO.addProduct(new Product(0, "Kem Gelato",
                "Kem Ý gelato với nhiều vị: Vani, Chocolate, Dâu.", 45000,
                "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400&h=300&fit=crop", 5,
                true));
        productDAO.addProduct(new Product(0, "Bánh Flan",
                "Bánh flan mềm mịn với lớp caramel đắng ngọt.", 25000,
                "https://images.unsplash.com/photo-1587241321921-91ffe2a74153?w=400&h=300&fit=crop", 5,
                true));
    }
}
