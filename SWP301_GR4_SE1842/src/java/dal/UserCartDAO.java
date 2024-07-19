/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;

/**
 *
 * @author ACER
 */
public class UserCartDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<CartItem> list;

    public List<CartItem> getCarts(String userid) {
        list = new ArrayList<>();
        try {
            String q = "SELECT * FROM UserCart WHERE UserID = ?";
            stm = connection.prepareCall(q);
            stm.setString(1, userid);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(
                        new CartItem(
                                new BookDAO().getById(rs.getInt("BookID")),
                                rs.getInt("quantity"))
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateCart(String userid, String bookid, int quantity) {
        try {
            String q = "UPDATE usercart SET Quantity = ?, TotalPrice = ? WHERE UserID = ? AND BookID = ?";
            stm = connection.prepareCall(q);
            stm.setInt(1, quantity);
            stm.setFloat(2, new BookDAO().getById(Integer.valueOf(bookid)).getFinalCost() * quantity);
            stm.setString(3, userid);
            stm.setString(4, bookid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCart(String userid, String bookid, int quantity, float subtotal) {
        try {
            String q = "INSERT INTO UserCart (UserID, BookID, Quantity, TotalPrice) VALUES \n"
                    + "(?, ?, ?, ?)";
            stm = connection.prepareCall(q);
            stm.setString(1, userid);
            stm.setString(2, bookid);
            stm.setInt(3, quantity);
            stm.setFloat(4, subtotal);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteCart(String bookid, String userid) {
        try {
            String q = "DELETE FROM usercart WHERE BookID = ? AND UserID = ?";
            stm = connection.prepareCall(q);
            stm.setString(1, bookid);
            stm.setString(2, userid);
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
        new UserCartDAO().deleteCart("1", "8");
    }
}
