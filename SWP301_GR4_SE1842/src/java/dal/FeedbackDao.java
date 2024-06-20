package dal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import model.Feedbacks;

public class FeedbackDao extends DBContext {

    private static final String SELECT_FEEDBACK_BY_PRODUCT_ID
            = "SELECT * FROM Feedback WHERE productID = ?";
    private static final String INSERT_FEEDBACK_SQL
            = "INSERT INTO Feedback (productID, UserID, rating, Content, feedbackDate, status ) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, 1)";

    public List<Feedback> selectFeedbackByProductId(int productID) {
        List<Feedback> feedbackList = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FEEDBACK_BY_PRODUCT_ID)) {
            preparedStatement.setInt(1, productID);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int productId = rs.getInt("productID");
                String userName = rs.getString("fullName");
                BigDecimal rating = rs.getBigDecimal("rating");
                String comment = rs.getString("comment");
                java.sql.Timestamp feedbackDate = rs.getTimestamp("feedbackDate");

                Feedback feedback = new Feedback(feedbackID, productId, userName, rating, comment, feedbackDate);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public List<Feedbacks> getAllFeedbackByProduct(int productId) {
        List<Feedbacks> feedbackses = new ArrayList<>();
        UserDAO userDAO = new UserDAO();
        ProductDAO productDAO = new ProductDAO();
        try {
            String query = " SELECT * FROM feedback where ProductID =  ? and status = 1 ";

            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            try ( ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Feedbacks feedback = new Feedbacks();
                    feedback.setFeedbackID(rs.getInt("FeedbackID"));
                    feedback.setUser(userDAO.GetUserById(rs.getInt("UserID")));
                    feedback.setContent(rs.getString("Content"));
                    feedback.setRating(rs.getInt("Rating"));
                    feedback.setImage(rs.getString("Image"));
                    feedback.setFeedbackDate(rs.getDate("feedbackDate"));
                    feedback.setStatus(rs.getInt("Status"));
                    feedback.setProduct(productDAO.getProductById(rs.getInt("ProductID")));
                    feedbackses.add(feedback);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackses;
    }

    public boolean addFeedback(int productID, int  userID, int rating, String content) {
        boolean rowInserted = false;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FEEDBACK_SQL)) {
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, userID);
            preparedStatement.setInt(3, rating);
            preparedStatement.setString(4, content);

            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public static void main(String[] args) {
        FeedbackDao fd = new FeedbackDao();
        List<Feedbacks> l = fd.getAllFeedbackByProduct(1);
        for (Feedbacks f : l) {
            System.out.println(f);
        }
    }
}
