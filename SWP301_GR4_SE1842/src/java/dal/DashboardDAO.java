package dal;

import dto.CategoryRevenue;
import dto.DashboardStats;
import dto.ProductOrder;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class DashboardDAO extends DBContext {

    public DashboardStats getDashboardStats(String startDate, String endDate) {
        DashboardStats stats = new DashboardStats();
        stats.setSuccessOrders(getOrderCountByStatus(startDate, endDate, "1"));
        stats.setCancelledOrders(getOrderCountByStatus(startDate, endDate, "2"));
        stats.setSubmittedOrders(getOrderCountByStatus(startDate, endDate, "3"));
        stats.setTotalRevenue(getTotalRevenue(startDate, endDate));
        stats.setRevenueByCategory(getRevenueByCategory(startDate, endDate));
        stats.setNewCustomers(getNewCustomers(startDate, endDate));
        stats.setNewBoughtCustomers(getNewBoughtCustomers(startDate, endDate));
        stats.setAverageRating(getAverageRating(startDate, endDate));
        stats.setTotalFeedbacks(getTotalFeedbacks(startDate, endDate));
        stats.setOrderTrendDates(getOrderTrendDates(startDate, endDate));
        stats.setOrderTrendCounts(getOrderTrendCounts(startDate, endDate));
        return stats;
    }

    private int getOrderCountByStatus(String startDate, String endDate, String status) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM `Order` WHERE StatusID = ?";
        if (startDate != null && endDate != null) {
            sql += " AND OrderDate BETWEEN ? AND ?";
        }
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            if (startDate != null && endDate != null) {
                ps.setString(2, startDate);
                ps.setString(3, endDate);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    private double getTotalRevenue(String startDate, String endDate) {
        double totalRevenue = 0;
        String sql = "SELECT SUM(TotalPrice) FROM `Order`";
        if (startDate != null && endDate != null) {
            sql += " WHERE OrderDate BETWEEN ? AND ?";
        }
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalRevenue = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }

    private List<CategoryRevenue> getRevenueByCategory(String startDate, String endDate) {
        List<CategoryRevenue> list = new ArrayList<>();
        String sql = "SELECT c.CategoryName, SUM(od.Quantity * od.Price) AS category_revenue "
                + "FROM OrderDetail od "
                + "JOIN `Order` o ON od.OrderID = o.OrderID "
                + "JOIN Product p ON od.ProductID = p.ProductID "
                + "JOIN ProductCategory pc ON p.ProductID = pc.ProductID "
                + "JOIN Category c ON pc.CategoryID = c.CategoryID";
        if (startDate != null && endDate != null) {
            sql += " WHERE o.OrderDate BETWEEN ? AND ?";
        }
        sql += " GROUP BY c.CategoryName";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryRevenue categoryRevenue = new CategoryRevenue();
                categoryRevenue.setCategoryName(rs.getString("CategoryName"));
                categoryRevenue.setRevenue(rs.getDouble("category_revenue"));
                list.add(categoryRevenue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private int getNewCustomers(String startDate, String endDate) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM `User`";
        if (startDate != null && endDate != null) {
            sql += " WHERE createdAt BETWEEN ? AND ?";
        }
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    private int getNewBoughtCustomers(String startDate, String endDate) {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT UserID) FROM `Order`";
        if (startDate != null && endDate != null) {
            sql += " WHERE OrderDate BETWEEN ? AND ?";
        }
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    private double getAverageRating(String startDate, String endDate) {
        double averageRating = 0;
        String sql = "SELECT AVG(Rating) FROM Feedback";
        if (startDate != null && endDate != null) {
            sql += " WHERE FeedbackDate BETWEEN ? AND ?";
        }
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                averageRating = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return averageRating;
    }

    private int getTotalFeedbacks(String startDate, String endDate) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Feedback";
        if (startDate != null && endDate != null) {
            sql += " WHERE FeedbackDate BETWEEN ? AND ?";
        }
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    private List<String> getOrderTrendDates(String startDate, String endDate) {
        List<String> dates = new ArrayList<>();
        String sql = "SELECT DATE(OrderDate) AS date FROM `Order`";
        if (startDate != null && endDate != null) {
            sql += " WHERE OrderDate BETWEEN ? AND ?";
        }
        sql += " GROUP BY DATE(OrderDate)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dates.add(rs.getString("date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dates;
    }

    private List<Integer> getOrderTrendCounts(String startDate, String endDate) {
        List<Integer> counts = new ArrayList<>();
        String sql = "SELECT DATE(OrderDate) AS date, COUNT(*) AS total_orders FROM `Order`";
        if (startDate != null && endDate != null) {
            sql += " WHERE OrderDate BETWEEN ? AND ?";
        }
        sql += " GROUP BY DATE(OrderDate)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (startDate != null && endDate != null) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                counts.add(rs.getInt("total_orders"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return counts;
    }

    public List<ProductOrder> getTopProductsTrendByQuantity(int limit) {
        List<ProductOrder> products = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantity "
                + "FROM OrderDetail od "
                + "JOIN Product p ON od.ProductID = p.ProductID "
                + "GROUP BY p.ProductID, p.ProductName "
                + "ORDER BY TotalQuantity DESC "
                + "LIMIT ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductOrder product = new ProductOrder();
                product.setProductId(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setTotalQuantity(rs.getInt("TotalQuantity"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static void main(String[] args) {
        DashboardDAO dao = new DashboardDAO();
        System.out.println(dao.getTopProductsTrendByQuantity(7));
    }
}
