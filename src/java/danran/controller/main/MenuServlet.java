package danran.controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MenuServlet", urlPatterns = { "/menu" })
public class MenuServlet extends HttpServlet {

        private danran.dao.ProductDAO productDAO = new danran.dao.ProductDAO();

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {

                java.util.List<danran.model.Product> products = productDAO.getAllProducts();

                // Auto-seed if empty
                if (products.isEmpty()) {
                        seedData();
                        products = productDAO.getAllProducts();
                }

                java.util.List<danran.model.Product> comboList = new java.util.ArrayList<>();
                java.util.List<danran.model.Product> coffeeList = new java.util.ArrayList<>();
                java.util.List<danran.model.Product> teaList = new java.util.ArrayList<>();
                java.util.List<danran.model.Product> foodList = new java.util.ArrayList<>();
                java.util.List<danran.model.Product> dessertList = new java.util.ArrayList<>();

                for (danran.model.Product p : products) {
                        switch (p.getCategoryId()) {
                                case 1:
                                        comboList.add(p);
                                        break;
                                case 2:
                                        coffeeList.add(p);
                                        break;
                                case 3:
                                        teaList.add(p);
                                        break;
                                case 4:
                                        foodList.add(p);
                                        break;
                                case 5:
                                        dessertList.add(p);
                                        break;
                        }
                }

                request.setAttribute("comboList", comboList);
                request.setAttribute("coffeeList", coffeeList);
                request.setAttribute("teaList", teaList);
                request.setAttribute("foodList", foodList);
                request.setAttribute("dessertList", dessertList);

                request.getRequestDispatcher("menu.jsp").forward(request, response);
        }

        private void seedData() {
                // Category 1: Combo
                productDAO.addProduct(new danran.model.Product(0, "Combo Burger Đôi",
                                "2 Burger bò Úc + Khoai tây chiên + 2 Pepsi. Tiết kiệm 50k!", 199000,
                                "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop", 1,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Combo Pizza Party",
                                "Pizza size L + 4 Gà rán + Salad + 4 Nước ngọt.", 399000,
                                "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&h=300&fit=crop", 1,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Combo Gia Đình",
                                "Set 4 người ăn với thịt nướng, cơm chiên và rau củ.", 599000,
                                "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop", 1,
                                true));

                // Category 2: Coffee
                productDAO.addProduct(new danran.model.Product(0, "Cà phê Sữa đá",
                                "Cà phê phin truyền thống pha với sữa đặc thơm ngọt.", 29000,
                                "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&h=300&fit=crop", 2,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Americano",
                                "Espresso pha loãng với nước nóng, đậm đà tinh tế.", 39000,
                                "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400&h=300&fit=crop", 2,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Cappuccino",
                                "Espresso với bọt sữa mịn màng, rắc bột cacao.", 45000,
                                "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400&h=300&fit=crop", 2,
                                true));

                // Category 3: Tea
                productDAO.addProduct(new danran.model.Product(0, "Trà sữa Trân châu đường đen",
                                "Trà sữa Đài Loan với trân châu tươi ngâm đường đen.", 45000,
                                "https://images.unsplash.com/photo-1558857563-b371033873b8?w=400&h=300&fit=crop", 3,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Trà Đào Cam Sả",
                                "Trà hoa quả tươi mát với đào, cam và sả thơm nồng.", 39000,
                                "https://images.unsplash.com/photo-1541167760496-1628856ab772?w=400&h=300&fit=crop", 3,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Matcha Latte",
                                "Matcha Nhật Bản pha với sữa tươi béo ngậy.", 55000,
                                "https://images.unsplash.com/photo-1587049352851-8d4e89133924?w=400&h=300&fit=crop", 3,
                                false)); // Sold
                                         // out
                                         // example?

                // Category 4: Food
                productDAO.addProduct(new danran.model.Product(0, "Burger Bò Phô Mai",
                                "Burger bò nướng với phô mai cheddar tan chảy.", 65000,
                                "https://images.unsplash.com/photo-1550547660-d9450f859349?w=400&h=300&fit=crop", 4,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Gà rán giòn",
                                "Gà tẩm bột chiên giòn thơm lừng, kèm sốt mật ong.", 55000,
                                "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=400&h=300&fit=crop", 4,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Khoai tây chiên",
                                "Khoai tây chiên giòn vàng đều, kèm sốt tương ớt.", 35000,
                                "https://images.unsplash.com/photo-1630384060421-cb20aed52c83?w=400&h=300&fit=crop", 4,
                                true));

                // Category 5: Dessert
                productDAO.addProduct(new danran.model.Product(0, "Tiramisu",
                                "Bánh Tiramisu Ý với kem mascarpone và cà phê espresso.", 69000,
                                "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400&h=300&fit=crop", 5,
                                true));
                productDAO.addProduct(new danran.model.Product(0, "Kem Gelato",
                                "Kem Ý gelato với nhiều vị: Vani, Chocolate, Dâu.", 45000,
                                "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400&h=300&fit=crop", 5,
                                true));
        }
}
