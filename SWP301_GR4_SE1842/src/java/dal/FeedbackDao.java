package dal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import model.Feedbacks;
import model.Product;

public class FeedbackDao extends DBContext {

    private static final String SELECT_FEEDBACK_BY_PRODUCT_ID
            = "SELECT * FROM Feedback WHERE productID = ? and status = 1";
    private static final String INSERT_FEEDBACK_SQL
            = "INSERT INTO Feedback (productID, UserID, rating, Content, feedbackDate, status ) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, 1)";
    private static final String SELECT_FEEDBACK_BY_USER_ID
            = """
              SELECT f.* , u.Fullname FROM Feedback f JOIN user u 
              ON f.userID = u.userID WHERE u.userID = ? LIMIT ? OFFSET ?""";
    private static final String SELECT_FEEDBACK
            = """
              SELECT f.* , u.Fullname FROM Feedback f JOIN user u 
              ON f.userID = u.userID LIMIT ? OFFSET ?""";
    private static final String COUNT_FEEDBACK_BY_USER_ID
            = "SELECT COUNT(*) FROM Feedback WHERE userID = ? and status = 1";
    private static final String COUNT_FEEDBACK
            = "SELECT COUNT(*) FROM Feedback";
    private static final String UPDATE_FEEDBACK_STATUS_SQL = "UPDATE Feedback SET status = ? WHERE feedbackID = ?";

    public List<Feedback> selectFeedbackByProductId(int productID) {
        List<Feedback> feedbackList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FEEDBACK_BY_PRODUCT_ID)) {
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
            String query = "SELECT * FROM feedback WHERE ProductID = ? AND status = 1";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
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

    public boolean addFeedback(int productID, int userID, int rating, String content) {
        boolean rowInserted = false;
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FEEDBACK_SQL)) {
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

    // New methods for user-specific feedback and pagination
    public List<Feedback> getFeedbackByUserId(int userId, int page, int pageSize) {
        List<Feedback> feedbackList = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FEEDBACK_BY_USER_ID)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, pageSize);
            preparedStatement.setInt(3, (page - 1) * pageSize);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int productId = rs.getInt("productID");
                String userName = rs.getString("fullName");
                BigDecimal rating = rs.getBigDecimal("rating");
                String comment = rs.getString("content");
                java.sql.Timestamp feedbackDate = rs.getTimestamp("feedbackDate");
                Product product = productDAO.getProductById(rs.getInt("productId"));
                Feedback feedback = new Feedback(feedbackID, productId, userName, rating, comment, feedbackDate, product);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public List<Feedback> getFeedbacks(int page, int pageSize) {
        List<Feedback> feedbackList = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FEEDBACK)) {
            preparedStatement.setInt(1, pageSize);
            preparedStatement.setInt(2, (page - 1) * pageSize);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int productId = rs.getInt("productID");
                String fullName = rs.getString("fullName");
                BigDecimal rating = rs.getBigDecimal("rating");
                String comment = rs.getString("content");
                String status = rs.getString("status");
                java.sql.Timestamp feedbackDate = rs.getTimestamp("feedbackDate");
                Product product = productDAO.getProductById(rs.getInt("productId"));
                Feedback feedback = new Feedback(feedbackID, productId, fullName, rating, comment, feedbackDate, product);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public List<Feedback> getFeedbacksWithParam(String searchParam, Integer status) {
        List<Feedback> feedbackList = new ArrayList<>();
        List<Object> list = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        try {
            StringBuilder query = new StringBuilder();
            query.append("""
               SELECT f.* , u.Fullname FROM Feedback f JOIN user u 
                ON f.userID = u.userID
                WHERE 1 = 1
            """);
            if (searchParam != null && !searchParam.trim().isEmpty()) {
                query.append(" AND  f.Content LIKE ? ");
                list.add("%" + searchParam + "%");
            }
            if (status != null) {
                query.append(" AND  f.status = ? ");
                list.add(status);
            }

            query.append("""
                    ORDER BY f.FeedbackID desc
                """);
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(query.toString());
            mapParams(preparedStatement, list);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    int feedbackID = rs.getInt("feedbackID");
                    int productId = rs.getInt("productID");
                    String fullName = rs.getString("fullName");
                    BigDecimal rating = rs.getBigDecimal("rating");
                    String comment = rs.getString("content");
                    String statuss = rs.getString("status");
                    java.sql.Timestamp feedbackDate = rs.getTimestamp("feedbackDate");
                    Product product = productDAO.getProductById(rs.getInt("productId"));
                    Feedback feedback = new Feedback(feedbackID, productId, fullName, rating, comment, statuss, feedbackDate, product);
                    feedbackList.add(feedback);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public List<Feedback> Paging(List<Feedback> products, int page, int pageSize) {
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, products.size());

        if (fromIndex > toIndex) {
            // Handle the case where fromIndex is greater than toIndex
            fromIndex = toIndex;
        }

        return products.subList(fromIndex, toIndex);
    }

    public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date) {
                ps.setTimestamp(i++, new Timestamp(((Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else {
                ps.setString(i++, (String) arg);
            }

        }
    }

    public int getFeedbackCountByUserId(int userId) {
        int count = 0;
        try (PreparedStatement preparedStatement = connection.prepareStatement(COUNT_FEEDBACK_BY_USER_ID)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean updateFeedbackStatus(int feedbackID, int status) {
        boolean rowUpdated = false;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FEEDBACK_STATUS_SQL)) {
            preparedStatement.setInt(1, status);
            preparedStatement.setInt(2, feedbackID);

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public int getFeedbackCount() {
        int count = 0;
        try (PreparedStatement preparedStatement = connection.prepareStatement(COUNT_FEEDBACK)) {
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        FeedbackDao fd = new FeedbackDao();
        List<Feedback> l = fd.getFeedbacksWithParam("", null);
        for (Feedback f : l) {
            System.out.println(f);
        }
    }
}
