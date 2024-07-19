/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

/**
 *
 * @author ACER
 */
public class OrderDetailDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<OrderDetail> list;

    public OrderDetailDAO() {
    }

    public OrderDetail getById(String id) {
        try {
            String query = "SELECT * FROM OrderDetail WHERE OrderDetalID = ?";
            stm = connection.prepareCall(query);
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
            String query = "SELECT * FROM OrderDetail where OrderID = ?";
            stm = connection.prepareCall(query);
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
            String query = "SELECT * FROM \n"
                    + "                    Refund r, \n"
                    + "                    (SELECT OrderDetalID, OrderID,  b.BookID, Quantity, Price, \n"
                    + "                    BookTitle, BookCost, Stock, BookRate, BookDesc, a.AuthorID, AuthorName, \n"
                    + "                    Bio, p.PublisherID, PublisherName, PublisherEmail, PublisherPhone, b.BookStatus\n"
                    + "                    FROM OrderDetail o, Book b, Publisher p, Author a \n"
                    + "                    WHERE b.AuthorID = a.AuthorID \n"
                    + "                    AND b.PublisherID = p.PublisherID \n"
                    + "                    AND o.BookID = b.BookID) od, [User] u, [Order]\n"
                    + "                    WHERE r.OrderDetalID = od.OrderDetalID\n"
                    + "                    AND [Order].ID = od.OrderID\n"
                    + "                    AND u.UserID = [Order].UserID";
            stm = connection.prepareCall(query);
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
                                        ), rs.getInt("BookStatus")),
                                rs.getInt("Quantity")
                        ),
                        rs.getTimestamp("RefundDate").toLocalDateTime(),
                        rs.getString("Reason"),
                        rs.getString("image"),
                        rs.getInt("RefundStatus")
                )
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<RefundBook> getRefundsByOrderId(String oid) {
        List<RefundBook> list = new ArrayList<>();
        try {
            String query = "SELECT \n"
                    + "r.OrderDetalID,\n"
                    + "od.OrderID,\n"
                    + "od.BookID,\n"
                    + "od.Quantity,\n"
                    + "r.RefundDate,\n"
                    + "r.Reason,\n"
                    + "r.[Image],\n"
                    + "r.RefundStatus,\n"
                    + "r.DeclineReason\n"
                    + "FROM refund r\n"
                    + "join OrderDetail od ON od.OrderDetalID = r.OrderDetalID\n"
                    + "join [Order] o ON od.OrderID = o.ID\n"
                    + "where od.OrderID = ?";
            stm = connection.prepareCall(query);
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
            String query = "SELECT \n"
                    + "r.OrderDetalID,\n"
                    + "od.OrderID,\n"
                    + "od.BookID,\n"
                    + "od.Quantity,\n"
                    + "r.RefundDate,\n"
                    + "r.Reason,\n"
                    + "r.[Image],\n"
                    + "r.RefundStatus,\n"
                    + "r.DeclineReason\n"
                    + "FROM refund r\n"
                    + "join OrderDetail od ON od.OrderDetalID = r.OrderDetalID\n"
                    + "join [Order] o ON od.OrderID = o.ID\n"
                    + "where r.OrderDetalID = ?";
            stm = connection.prepareCall(query);
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
            String query = "SELECT * FROM \n"
                    + "Refund r, \n"
                    + "(SELECT OrderDetalID, OrderID,  b.BookID, Quantity, Price, \n"
                    + "BookTitle, BookCost, Stock, BookRate, BookDesc, a.AuthorID, AuthorName, \n"
                    + "Bio, p.PublisherID, PublisherName, PublisherEmail, PublisherPhone, b.BookStatus\n"
                    + "FROM OrderDetail o, Book b, Publisher p, Author a \n"
                    + "WHERE b.AuthorID = a.AuthorID \n"
                    + "AND b.PublisherID = p.PublisherID \n"
                    + "AND o.BookID = b.BookID) od, [User] u, [Order]\n"
                    + "WHERE r.OrderDetalID = od.OrderDetalID\n"
                    + "AND [Order].ID = od.OrderID\n"
                    + "AND u.UserID = [Order].UserID\n"
                    + "AND u.UserID = ?";
            stm = connection.prepareCall(query);
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
                                        ), rs.getInt("BookStatus")),
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
        String query = "INSERT INTO Refund (OrderDetalID, Reason, [Image], RefundStatus) VALUES (?, ?, ?, ?)";
        try {
            stm = connection.prepareCall(query);
            stm.setString(1, odid);
            stm.setString(2, reason);
            stm.setString(3, image);
            stm.setInt(4, 0);
            stm.execute();
        } catch (Exception e) {
            try {
                stm = connection.prepareCall("update Refund set RefundStatus = 0 where OrderDetalID = ?");
                stm.setString(1, odid);
                stm.execute();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateRefund(String odid, String reason, String image) {
        String query = "UPDATE Refund SET Reason = ?, [Image] = ? WHERE OrderDetalID = ?";
        try {
            stm = connection.prepareCall(query);
            stm.setString(1, reason);
            stm.setString(2, image);
            stm.setString(3, odid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actionRefund(String odid, int status, String refundReason) {
        String query = "UPDATE Refund \n"
                + "SET RefundStatus = ?, DeclineReason = ?\n"
                + "WHERE OrderDetalID = ?";
        try {
            stm = connection.prepareCall(query);
            stm.setInt(1, status);
            stm.setString(2, refundReason);
            stm.setString(3, odid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void add(OrderDetail od) {
        String query = "INSERT INTO dbo.OrderDetail (OrderID, BookID, Quantity, Price)\n"
                + "VALUES \n"
                + "(?, ?, ?, ?)";
        try {
            stm = connection.prepareCall(query);
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
        System.out.println(d.getRefundById("15"));
    }

    public void Delete(String oid) {
        try {
            String query = "DELETE From OrderDetail Where OrderID = ?";
            stm = connection.prepareCall(query);
            stm.setString(1, oid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
