package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.BookReview;

public class BookReivewDAO extends DBContext {

    public ArrayList<BookReview> getBookReviewAll(String star, String searchString) {
        ArrayList<BookReview> reviews = new ArrayList<>();
        try {
            String sql = "SELECT * FROM BookReview WHERE 1=1";
            if (!star.isEmpty()) {
                sql += " AND Rate = ?";
            }
            if (!searchString.isEmpty()) {
                sql += " AND Comment LIKE ?";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            int index = 1;
            if (!star.isEmpty()) {
                preparedStatement.setString(index++, star);
            }
            if (!searchString.isEmpty()) {
                preparedStatement.setString(index++, "%" + searchString + "%");
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                reviews.add(new BookReview(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public ArrayList<BookReview> getBookReviewAllById(int id) {
        ArrayList<BookReview> reviews = new ArrayList<>();
        try {
            String sql = "SELECT * FROM feedback WHERE fbProID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                reviews.add(new BookReview(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public int deleteFeedback(String bookId, String uid) {
        try {
            String sql = "DELETE FROM BookReview WHERE BookID = ? AND UserID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookId);
            preparedStatement.setString(2, uid);
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int sendContact(String name, String email, String mess) {
        try {
            String sql = "INSERT INTO Contact (name, email, mess) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, mess);
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public boolean add(int uid, String rate, String comment, String idb) {
        try {
            String query = "INSERT INTO BookReview (UserID, Rate, Comment, BookID) VALUES (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, uid);
            stm.setString(2, rate);
            stm.setString(3, comment);
            stm.setString(4, idb);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public int count(String txtSearch) {
        try {
            String query = "SELECT * FROM feedback WHERE fbContent like ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        BookReivewDAO dao = new BookReivewDAO();
        int count = dao.count("");
        System.out.println(count);
    }
}
