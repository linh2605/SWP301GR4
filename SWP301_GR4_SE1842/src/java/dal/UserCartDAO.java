/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.User;
import model.UserCart;

/**
 *
 * @author auiri
 */
public class UserCartDAO extends DBContext {

    public List<UserCart> getUserCarts() {
        List<UserCart> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM UserCart\n"
                + "JOIN Product ON UserCart.ProductID = Product.ProductID\n"
                + "JOIN User ON UserCart.UserID = User.UserID";
        try (PreparedStatement ps = new DBContext().getConnection().prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserCart cart = new UserCart();
                Product product = new ProductDAO().getProductById(rs.getInt("ProductID"));
                User user = new UserDAO().GetUserById(rs.getInt("UserID"));
                
                cart.setUserCartId(rs.getInt("UserCartID"));
                cart.setProduct(product);
                cart.setUser(user);
                cart.setQuantity(rs.getInt("Quantity"));
                cart.setTotalPrice(product.getProductPrice().multiply(new BigDecimal(cart.getQuantity())));
                list.add(cart);
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void addToCart(Product product) {
        
    }
}
