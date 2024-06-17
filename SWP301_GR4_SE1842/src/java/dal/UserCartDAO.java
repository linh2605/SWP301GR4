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

    private PreparedStatement stm;
    private ResultSet rs;

    public List<UserCart> getUserCarts(int id) {
        List<UserCart> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "         FROM UserCart\n"
                + "          JOIN Product ON UserCart.ProductID = Product.ProductID\n"
                + "            JOIN User ON UserCart.UserID = User.UserID\n"
                + "            where User.UserID = ?";
        try {
            connection = new DBContext().getConnection();
            if (connection == null) {
                System.err.println("Database connection is null.");
                return null;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id + "");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserCart cart = new UserCart();
                Product product = new Product();
                User user = new User();

                product.setProductID(rs.getInt("ProductID"));
                product.setProductPrice(rs.getBigDecimal("ProductPrice"));
                product.setProductName(rs.getString("ProductName"));
                product.setStock(rs.getInt("Stock"));
                product.setProductRating(rs.getInt("ProductRating"));
                product.setProductDesc(rs.getString("ProductDesc"));
                product.setBrandID(rs.getInt("BrandID"));
                product.setSupplierID(rs.getInt("SupplierID"));

                user.setId(rs.getInt("UserId"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setAvatar(rs.getString("Avatar"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));

                cart.setUserCartId(rs.getInt("UserCartID"));
                cart.setProduct(product);
                cart.setUser(user);
                cart.setQuantity(rs.getInt("Quantity"));
                cart.setTotalPrice(product.getProductPrice().multiply(new BigDecimal(cart.getQuantity())));
                list.add(cart);
            }

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateCart(String userId, List<UserCart> carts) {
        if (carts == null || carts.isEmpty()) {
            clearCart(userId);
            return;
        }

        clearCart(userId);

        for (UserCart cart : carts) {
            Product product = cart.getProduct();
            if (product != null) {
                addCart(userId, product.getProductID() + "", cart.getQuantity(), product.getProductPrice().multiply(BigDecimal.valueOf(cart.getQuantity())).floatValue());
            }
        }
    }

    public void addCart(String userid, String pid, int quantity, float subtotal) {
        try {
            String q = "INSERT INTO UserCart (UserID, ProductID, Quantity, TotalPrice)  VALUES \n"
                    + "(?, ?, ?, ?)";
            stm = connection.prepareCall(q);
            stm.setString(1, userid);
            stm.setString(2, pid);
            stm.setInt(3, quantity);
            stm.setFloat(4, subtotal);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clearCart(String userid) {
        try {
            String q = "DELETE FROM usercart WHERE UserID = ?";
            stm = connection.prepareCall(q);
            stm.setString(1, userid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(new UserCartDAO().getUserCarts(2));
    }
}
