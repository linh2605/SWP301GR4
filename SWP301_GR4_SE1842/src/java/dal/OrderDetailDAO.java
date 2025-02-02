package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Author;
import model.Book;
import model.Order;
import model.OrderDetail;
import model.Publisher;
import model.RefundBook;
import model.User;

public class OrderDetailDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<OrderDetail> list;

    public OrderDetailDAO() {
    }

    public OrderDetail getById(String id) {
        try {
            String query = "SELECT * FROM OrderDetail WHERE OrderDetailID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return (new OrderDetail(
                        rs.getString(1),
                        new BookDAO().getById(rs.getInt("BookID")),
                        rs.getInt("Quantity")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<OrderDetail> getByOrder(String orderid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM OrderDetail WHERE OrderID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, orderid);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(
                        new OrderDetail(
                                rs.getString(1),
                                new BookDAO().getById(rs.getInt("BookID")),
                                rs.getInt("Quantity")
                        )
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<RefundBook> getAllRefund() {
        List<RefundBook> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Refund r \n" +
"                    JOIN (SELECT OrderDetailID, OrderID, b.BookID, Quantity, Price, \n" +
"                    BookTitle, BookCost, Stock, BookRate, BookDesc, a.AuthorID, AuthorName, \n" +
"                    Bio, p.PublisherID, PublisherName, PublisherEmail, PublisherPhone, b.BookStatus \n" +
"                    FROM OrderDetail o JOIN Book b ON o.BookID = b.BookID \n" +
"                    JOIN Publisher p ON b.PublisherID = p.PublisherID \n" +
"                    JOIN Author a ON b.AuthorID = a.AuthorID) od \n" +
"                    ON r.OrderDetailID = od.OrderDetailID \n" +
"                    JOIN `Order` o ON o.ID = od.OrderID\n" +
"                    JOIN `User` u ON u.UserID = o.UserID ";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new RefundBook(
                        new OrderDetail(
                                rs.getString(1),
                                new Order(
                                        rs.getString("OrderID"),
                                        new User(
                                                rs.getInt("UserID"),
                                                rs.getString("username"),
                                                rs.getString("password"),
                                                rs.getInt("roleID"),
                                                rs.getString("avatar"),
                                                rs.getString("UserFullName"),
                                                rs.getString("gender"),
                                                rs.getString("UserPhone"),
                                                rs.getString("UserEmail"),
                                                rs.getString("Useraddress")
                                        ),
                                        rs.getDate("OrderDate"),
                                        rs.getString("Phone"),
                                        rs.getString("Address"),
                                        null,
                                        rs.getFloat("TotalPrice"),
                                        null,
                                        rs.getDate("DeliverDate"),
                                        rs.getString("CusFullname"),
                                        rs.getString("cusEmail")
                                ),
                                new Book(
                                        rs.getInt("BookID"),
                                        rs.getString("booktitle"),
                                        rs.getFloat("bookcost"),
                                        rs.getInt("stock"),
                                        rs.getInt("bookrate"),
                                        rs.getString("bookDesc"),
                                        new Author(
                                                rs.getInt("AuthorID"),
                                                rs.getString("AuthorName"),
                                                rs.getString("Bio")),
                                        new Publisher(
                                                rs.getInt("PublisherID"),
                                                rs.getString("PublisherName"),
                                                rs.getString("PublisherEmail"),
                                                rs.getString("PublisherPhone")
                                        ), 
                                        rs.getInt("BookStatus")),
                                rs.getInt("Quantity")
                        ),
                        rs.getTimestamp("RefundDate").toLocalDateTime(),
                        rs.getString("Reason"),
                        rs.getString("image"),
                        rs.getInt("RefundStatus")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<RefundBook> getRefundsByOrderId(String oid) {
        List<RefundBook> list = new ArrayList<>();
        try {
            String query = "SELECT r.OrderDetailID, od.OrderID, od.BookID, od.Quantity, " +
                    "r.RefundDate, r.Reason, r.Image, r.RefundStatus, r.DeclineReason " +
                    "FROM Refund r " +
                    "JOIN OrderDetail od ON od.OrderDetailID = r.OrderDetailID " +
                    "JOIN `Order` o ON od.OrderID = o.ID " +
                    "WHERE od.OrderID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, oid);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new RefundBook(
                        new OrderDetail(
                                rs.getString(1),
                                new OrderDAO().getById(rs.getString("OrderID")),
                                new BookDAO().getById(rs.getInt("BookID")),
                                rs.getInt("Quantity")
                        ),
                        rs.getTimestamp("RefundDate").toLocalDateTime(),
                        rs.getString("Reason"),
                        rs.getString("image"),
                        rs.getInt("RefundStatus"),
                        rs.getString("DeclineReason")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public RefundBook getRefundById(String rid) {
        try {
            String query = "SELECT r.OrderDetailID, od.OrderID, od.BookID, od.Quantity, " +
                    "r.RefundDate, r.Reason, r.Image, r.RefundStatus, r.DeclineReason " +
                    "FROM Refund r " +
                    "JOIN OrderDetail od ON od.OrderDetailID = r.OrderDetailID " +
                    "JOIN `Order` o ON od.OrderID = o.ID " +
                    "WHERE r.OrderDetailID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, rid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return (new RefundBook(
                        new OrderDetail(
                                rs.getString(1),
                                new OrderDAO().getById(rs.getString("OrderID")),
                                new BookDAO().getById(rs.getInt("BookID")),
                                rs.getInt("Quantity")
                        ),
                        rs.getTimestamp("RefundDate").toLocalDateTime(),
                        rs.getString("Reason"),
                        rs.getString("image"),
                        rs.getInt("RefundStatus"),
                        rs.getString("DeclineReason")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<RefundBook> getAllRefundOfAUser(String userid) {
        List<RefundBook> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Refund r " +
                    "JOIN (SELECT OrderDetailID, OrderID, b.BookID, Quantity, Price, " +
                    "BookTitle, BookCost, Stock, BookRate, BookDesc, a.AuthorID, AuthorName, " +
                    "Bio, p.PublisherID, PublisherName, PublisherEmail, PublisherPhone, b.BookStatus " +
                    "FROM OrderDetail o JOIN Book b ON o.BookID = b.BookID " +
                    "JOIN Publisher p ON b.PublisherID = p.PublisherID " +
                    "JOIN Author a ON b.AuthorID = a.AuthorID) od ON r.OrderDetailID = od.OrderDetailID " +
                    "JOIN `User` u ON u.UserID = od.UserID " +
                    "JOIN `Order` o ON o.ID = od.OrderID " +
                    "WHERE u.UserID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, userid);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new RefundBook(
                        new OrderDetail(
                                rs.getString(1),
                                new Order(
                                        rs.getString("OrderID"),
                                        new User(
                                                rs.getInt("UserID"),
                                                rs.getString("username"),
                                                rs.getString("password"),
                                                rs.getInt("roleID"),
                                                rs.getString("avatar"),
                                                rs.getString("UserFullName"),
                                                rs.getString("gender"),
                                                rs.getString("UserPhone"),
                                                rs.getString("UserEmail"),
                                                rs.getString("Useraddress")
                                        ),
                                        rs.getDate("OrderDate"),
                                        rs.getString("Phone"),
                                        rs.getString("Address"),
                                        null,
                                        rs.getFloat("TotalPrice"),
                                        null,
                                        rs.getDate("DeliverDate"),
                                        rs.getString("CusFullname"),
                                        rs.getString("cusEmail")
                                ),
                                new Book(
                                        rs.getInt("BookID"),
                                        rs.getString("booktitle"),
                                        rs.getFloat("bookcost"),
                                        rs.getInt("stock"),
                                        rs.getInt("bookrate"),
                                        rs.getString("bookDesc"),
                                        new Author(
                                                rs.getInt("AuthorID"),
                                                rs.getString("AuthorName"),
                                                rs.getString("Bio")),
                                        new Publisher(
                                                rs.getInt("PublisherID"),
                                                rs.getString("PublisherName"),
                                                rs.getString("PublisherEmail"),
                                                rs.getString("PublisherPhone")
                                        ), 
                                        rs.getInt("BookStatus")),
                                rs.getInt("Quantity")
                        ),
                        rs.getTimestamp("RefundDate").toLocalDateTime(),
                        rs.getString("Reason"),
                        rs.getString("image"),
                        rs.getInt("RefundStatus")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addRefund(String odid, String reason, String image) {
        String query = "INSERT INTO Refund (OrderDetailID, Reason, Image, RefundStatus) VALUES (?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, odid);
            stm.setString(2, reason);
            stm.setString(3, image);
            stm.setInt(4, 0);
            stm.execute();
        } catch (Exception e) {
            try {
                stm = connection.prepareStatement("UPDATE Refund SET RefundStatus = 0 WHERE OrderDetailID = ?");
                stm.setString(1, odid);
                stm.execute();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateRefund(String odid, String reason, String image) {
        String query = "UPDATE Refund SET Reason = ?, Image = ? WHERE OrderDetailID = ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, reason);
            stm.setString(2, image);
            stm.setString(3, odid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actionRefund(String odid, int status, String refundReason) {
        String query = "UPDATE Refund SET RefundStatus = ?, DeclineReason = ? WHERE OrderDetailID = ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setInt(1, status);
            stm.setString(2, refundReason);
            stm.setString(3, odid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void add(OrderDetail od) {
        String query = "INSERT INTO OrderDetail (OrderID, BookID, Quantity, Price) VALUES (?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, od.getOrder().getId());
            stm.setInt(2, od.getBook().getId());
            stm.setInt(3, od.getQuantity());
            stm.setFloat(4, od.getBook().getFinalCost() * od.getQuantity());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        OrderDetailDAO d = new OrderDetailDAO();
        System.out.println(d.getAllRefund());
    }

    public void Delete(String oid) {
        try {
            String query = "DELETE FROM OrderDetail WHERE OrderID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, oid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
