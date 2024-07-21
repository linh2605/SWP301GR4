package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Order;
import model.OrderStatus;
import model.PayMethod;
import model.User;

public class OrderDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Order> list;

    public OrderDAO() {
    }

    public List<Order> getAll() {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `Order`"; // Sử dụng dấu nháy ngược cho tên bảng
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                User user = null;
                if (rs.getString("UserID") != null && !rs.getString("UserID").trim().equals("")) {
                    user = new UserDao().getById(rs.getInt("UserID"));
                }
                Order order = new Order(
                        rs.getString(1),
                        user,
                        rs.getDate("OrderDate"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        new PayMethodDAO().getById(rs.getString("PayMethodID")),
                        rs.getFloat("TotalPrice"),
                        new OrderStatusDAO().getById(rs.getString("StatusID")),
                        rs.getDate("DeliverDate"),
                        rs.getString("CusFullname"),
                        rs.getString("cusEmail")
                );
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatus(int odid, int statusid) {
        try {
            String query = "UPDATE `Order` SET StatusID = ? WHERE ID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, statusid);
            stm.setInt(2, odid);
            stm.executeUpdate(); // Sử dụng executeUpdate() cho các câu lệnh UPDATE
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int maxID() {
        try {
            String query = "SELECT MAX(ID) AS max FROM `Order`";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("max");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Order getById(String id) {
        try {
            String query = "SELECT * FROM `Order` o JOIN PaymentMethod p ON o.PayMethodID = p.PaymentMethodID " +
                           "JOIN OrderStatus s ON o.StatusID = s.StatusID WHERE o.ID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                User user = null;
                if (rs.getString("UserID") != null && !rs.getString("UserID").trim().equals("")) {
                    user = new UserDao().getById(rs.getInt("UserID"));
                }
                return new Order(
                        rs.getString(1),
                        user,
                        rs.getDate("OrderDate"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        new PayMethodDAO().getById(rs.getString("PayMethodID")),
                        rs.getFloat("TotalPrice"),
                        new OrderStatusDAO().getById(rs.getString("StatusID")),
                        rs.getDate("DeliverDate"),
                        rs.getString("CusFullname"),
                        rs.getString("cusEmail")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int Count() {
        try {
            String query = "SELECT COUNT(*) AS cnt FROM `Order`";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("cnt");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public float getIncome() {
        try {
            String query = "SELECT SUM(Price) AS income FROM `Order` o JOIN OrderDetail od ON o.ID = od.OrderID WHERE o.StatusID = 3";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getFloat("income");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public float getLost() {
        try {
            String query = "SELECT SUM(Price) AS lost FROM refund r JOIN orderdetail od ON r.OrderDetailID = od.OrderDetailID WHERE r.RefundStatus = 1";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getFloat("lost");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Order> getOrdersOfACustomer(int userid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `Order` WHERE UserID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, userid);
            rs = stm.executeQuery();
            while (rs.next()) {
                User user = null;
                if (rs.getString("UserID") != null && !rs.getString("UserID").trim().equals("")) {
                    user = new UserDao().getById(rs.getInt("UserID"));
                }
                list.add(new Order(
                        rs.getString(1),
                        user,
                        rs.getDate("OrderDate"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        new PayMethodDAO().getById(rs.getString("PayMethodID")),
                        rs.getFloat("TotalPrice"),
                        new OrderStatusDAO().getById(rs.getString("StatusID")),
                        rs.getDate("DeliverDate"),
                        rs.getString("CusFullname"),
                        rs.getString("cusEmail")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list;
    }

    public HashMap<Order, Integer> getOrderThatHasRefundBook() {
        HashMap<Order, Integer> refundsIncludeStatus = new HashMap<>();
        try {
            String query = "SELECT DISTINCT u.UserID, `Order`.ID, `Order`.CusFullname, r.RefundStatus FROM Refund r " +
                           "LEFT JOIN (SELECT OrderDetailID, OrderID, b.BookID, Quantity, Price, " +
                           "BookTitle, BookCost, Stock, BookRate, BookDesc, a.AuthorID, AuthorName, " +
                           "Bio, p.PublisherID, PublisherName, PublisherEmail, PublisherPhone " +
                           "FROM OrderDetail o JOIN Book b ON o.BookID = b.BookID " +
                           "JOIN Publisher p ON b.PublisherID = p.PublisherID " +
                           "JOIN Author a ON b.AuthorID = a.AuthorID) od ON r.OrderDetailID = od.OrderDetailID " +
                           "JOIN `Order` ON `Order`.ID = od.OrderID " +
                           "LEFT JOIN `User` u ON u.UserID = `Order`.UserID";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getString(2),
                        new UserDao().getById(rs.getInt(1)),
                        null,
                        null,
                        null,
                        null,
                        0,
                        null,
                        null,
                        rs.getString("CusFullname"),
                        null
                );
                int refundStatus = rs.getInt("RefundStatus");
                refundsIncludeStatus.put(order, refundStatus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return refundsIncludeStatus;
    }

    public void placeOrder(Order order) {
        try {
            String query = "INSERT INTO `Order` (UserID, CusFullname, OrderDate, Phone, CusEmail, Address, PayMethodID, TotalPrice, StatusID) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(query);
            if (order.getUser() != null) {
                stm.setInt(1, order.getUser().getId());
            } else {
                stm.setNull(1, Types.INTEGER);
            }

            stm.setString(2, order.getCusFullname());
            stm.setDate(3, (Date) order.getOrderDate());
            stm.setString(4, order.getPhone());
            stm.setString(5, order.getCusEmail());
            stm.setString(6, order.getAddress());
            stm.setString(7, order.getPaymethod().getId());
            stm.setFloat(8, order.getTotalPrice());
            stm.setString(9, "1");
            stm.executeUpdate(); // Sử dụng executeUpdate() cho các câu lệnh INSERT
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(String oid) {
        try {
            String query = "DELETE FROM `Order` WHERE ID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, oid);
            stm.executeUpdate(); // Sử dụng executeUpdate() cho các câu lệnh DELETE
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        System.out.println();
    }
}
