/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author 84375
 */
public class FeedbackDAO extends DBContext {

    public static void main(String[] args) {
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        // Test data
        String pid = "1"; 
        int uid = 1; 
        String content = "Great product!";
        String rate = "4"; // Star rating
        String img = "img.png"; // Image path

        // Call the insertFeedback method
        feedbackDAO.insertFeedback(pid, uid, content, rate, img);
        System.out.println("Feedback inserted successfully.");

    }

    public ArrayList<Feedback> getListFeedback(String status, String search, String star) {

        if (star.isEmpty()) {
            star = "-1";
        }
        if (status.isEmpty()) {
            status = "-1";
        }
        ArrayList<Feedback> listF = new ArrayList<>();
        String sql = " select * from Feedback f  left join [User] u on f.fbCusID =u.UserID\n"
                + " left join Book p on f.fbProID = p.BookID  "
                + "	where ( -1 = " + star + " or  f.fbStar =  " + star + " ) and ( -1 = " + status + " or  f.fbStatus =  " + status + " )\n"
                + " and (u.Username like '%" + search + "%' or p.BookTitle like '%" + search + "%') ";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int fbId = rs.getInt(1);
                int fbCusId = rs.getInt(2);
                int fbProId = rs.getInt(3);
                int fbStar = (int) rs.getFloat(4);
                String fbContent = rs.getString(5);
                String fbImage = rs.getString(6);
                Date fbDate = rs.getDate(7);
                int fbStatus = rs.getInt(8);
                Feedback F = new Feedback(fbId, fbCusId, fbProId, fbStar, fbContent, fbImage, fbDate, fbStatus);
                Book b = new Book();
                b.setTitle(rs.getString("BookTitle"));
                User u = new User();
                u.setUsername(rs.getString("Username"));
                u.setEmail(rs.getString("UserEmail"));
                F.setBook(b);
                F.setUser(u);
                listF.add(F);
            }
        } catch (Exception e) {
            System.out.println("ListFeedbeck: " + e.getMessage());
            e.printStackTrace();
        }
        return listF;
    }

    public ArrayList<Feedback> getListFeedbackByBook(String bid) {

        ArrayList<Feedback> listF = new ArrayList<>();
        String sql = " select * from Feedback f  left join [User] u on f.fbCusID =u.UserID\n"
                + " left join Book p on f.fbProID = p.BookID  "
                //                + "	where  p.BookID = " + bid;
                + "	where  p.BookID = " + bid + " and f.[fbStatus] = 1 ";
//        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int fbId = rs.getInt(1);
                int fbCusId = rs.getInt(2);
                int fbProId = rs.getInt(3);
                int fbStar = (int) rs.getFloat(4);
                String fbContent = rs.getString(5);
                String fbImage = rs.getString(6);
                Date fbDate = rs.getDate(7);
                int fbStatus = rs.getInt(8);
                Feedback F = new Feedback(fbId, fbCusId, fbProId, fbStar, fbContent, fbImage, fbDate, fbStatus);
                Book b = new Book();
                b.setTitle(rs.getString("BookTitle"));
                User u = new User();
                u.setEmail(rs.getString("UserEmail"));

                u.setUsername(rs.getString("Username"));
                F.setBook(b);
                F.setUser(u);
                listF.add(F);
            }
        } catch (Exception e) {
            System.out.println("ListFeedbeck: " + e.getMessage());
            e.printStackTrace();
        }
        return listF;
    }

    public Feedback getFeedbackByid(String Fid) {
        String sql = " select * from Feedback f  left join [User] u on f.fbCusID =u.UserID\n"
                + " left join Book p on f.fbProID = p.BookID  where f.[fbID] = " + Fid;
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int fbId = rs.getInt(1);
                int fbCusId = rs.getInt(2);
                int fbProId = rs.getInt(3);
                int fbStar = (int) rs.getFloat(4);
                String fbContent = rs.getString(5);
                String fbImage = rs.getString(6);
                Date fbDate = rs.getDate(7);
                int fbStatus = rs.getInt(8);
                Feedback F = new Feedback(fbId, fbCusId, fbProId, fbStar, fbContent, fbImage, fbDate, fbStatus);
                Book b = new Book();
                b.setTitle(rs.getString("BookTitle"));
                User u = new User();
                u.setUsername(rs.getString("Username"));
                u.setEmail(rs.getString("UserEmail"));

                F.setBook(b);
                F.setUser(u);
                return F;
            }
        } catch (Exception e) {
            System.out.println("ListFeedbeck: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Contact> getAllContact() {
        ArrayList<Contact> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Contact]";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(new Contact(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                ));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int countFeedbackByPid(String pid) {
        try {
            String sql = "  select count(*) from [Feedback] where fbProID = " + pid;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public String avgFeedbackByPid(String pid) {
        try {
            String sql = "  select avg([fbStar]) from [Feedback] where fbProID = " + pid;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "0";
    }

    public void insertFeedback(String pid, int uid, String content, String rate, String img) {
        String sql = "INSERT INTO Feedback "
                + "(fbCusID, fbProID, fbStar, fbContent, fbImage, fbDate, fbStatus) "
                + "VALUES (?, ?, ?, ?, ?, NOW(), 1)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.setString(2, pid);
            st.setInt(3, Integer.parseInt(rate)); // Convert rate to int
            st.setString(4, content);
            st.setString(5, img);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertFeedback: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public void deleteFeedback(int feedbackId) {
        String sql = "DELETE FROM [dbo].[Feedback] WHERE [fbID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedbackId);
            st.executeUpdate();
            System.out.println("Feedback with ID " + feedbackId + " deleted successfully.");
        } catch (SQLException e) {
            System.out.println("deleteFeedback: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void changeStatusFeedback(String fid, String ss) {
        String sql = "UPDATE [dbo].[Feedback]  SET [fbStatus] = ?\n"
                + " WHERE [fbID] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ss);
            st.setString(2, fid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertFeedback: " + e.getMessage());
            e.printStackTrace();

        }

    }
}
