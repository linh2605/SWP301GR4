/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Book;

/**
 *
 * @author ACER
 */
public class WishListDAO extends DBContext {

    private List<Book> list;
    private PreparedStatement stm;
    private ResultSet rs;

    public List<Book> getWishListObject(String userid) {
        list = new ArrayList<>();
        String query = "select * from UsersWishList where UserID = ?";
        try {
            stm = connection.prepareCall(query);
            stm.setString(1, userid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book b = new BookDAO().getById(rs.getInt("bookid"));
                if (b.getStatus() == 1) {
                    list.add(new BookDAO().getById(rs.getInt("bookid")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public List<String> getWishListString(String userid) {
        List<String> bList = new ArrayList<>();
        String query = "select * from UsersWishList where UserID = ?";
        try {
            stm = connection.prepareCall(query);
            stm.setString(1, userid);
            rs = stm.executeQuery();
            while (rs.next()) {
                bList.add(
                        rs.getString("bookid")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return bList;
    }

    public boolean addToWishList(String userid, String bookid) {
        String query = "INSERT into UsersWishList values \n"
                + "(?, ?)";
        try {
            stm = connection.prepareCall(query);
            stm.setString(1, userid);
            stm.setString(2, bookid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean removeFromWishList(String userid, String bookid) {
        String query = "DELETE FROM UsersWishList WHERE UserID = ? AND BookID = ?";
        try {
            stm = connection.prepareCall(query);
            stm.setString(1, userid);
            stm.setString(2, bookid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public List<Book> listMostWishedFor() {
        list = new ArrayList<>();
        String query = "select BookID, count(BookID) as cnt from userswishlist\n"
                + "group by BookID";
        try {
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book b = new BookDAO().getById(rs.getInt("bookid"));
                b.setAmountInWishLists(rs.getInt("cnt"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public static void main(String[] args) {

        System.out.println(new WishListDAO().addToWishList("4", "1"));
    }
}
