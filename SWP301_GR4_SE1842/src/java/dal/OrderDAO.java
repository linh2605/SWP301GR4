/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

/**
 *
 * @author ACER
 */
public class OrderDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Order> list;

    public OrderDAO() {
    }

    public List<Order> getAll() {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Order]";
            stm = connection.prepareCall(query);
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
                list.add(
                        order
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatus(int odid, int statusid) {
        try {
            String query = "update [order] set statusId = ? where ID = ?";
            stm = connection.prepareCall(query);
            stm.setInt(1, statusid);
            stm.setInt(2, odid);
            stm.execute();
        } catch (Exception e) {
        }
    }

    public int maxID() {
        try {
            String query = "select max(ID) as max from [order]";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("max");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Order getById(String id) {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Order] o, PaymentMethod p, OrderStatus s\n"
                    + "WHERE o.PayMethodID = p.PaymentMethodID\n"
                    + "AND o.StatusID = s.StatusID\n"
                    + "AND o.ID = ?";
            stm = connection.prepareCall(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                User user = null;
                if (rs.getString("UserID") != null && !rs.getString("UserID").trim().equals("")) {
                    user = new UserDao().getById(rs.getInt("UserID"));
                }
                return (new Order(
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
        return null;
    }

    public int Count() {
        try {
            String query = "select count(*) as cnt from [order]";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("cnt");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public float getIncome() {
        try {
            String query = "select sum(Price) as income from [Order] o\n"
                    + "join OrderDetail od on o.ID = od.OrderID\n"
                    + "where o.StatusID = 3";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("income");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public float getLost() {
        try {
            String query = "select sum(Price) as lost from refund r\n"
                    + "join orderdetail od on r.OrderDetalID = od.OrderDetalID\n"
                    + "Where r.RefundStatus = 1";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("lost");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Order> getOrdersOfACustomer(int userid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Order] Where UserID = ?";
            stm = connection.prepareCall(query);
            stm.setInt(1, userid);
            rs = stm.executeQuery();
            while (rs.next()) {
                User user = null;
                if (rs.getString("UserID") != null && !rs.getString("UserID").trim().equals("")) {
                    user = new UserDao().getById(rs.getInt("UserID"));
                }
                list.add(
                        (new Order(
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
                        ))
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (list.isEmpty()) {
            return null;
        }
        return list;
    }

    public HashMap<Order, Integer> getOrderThatHasRefundBook() {
        HashMap<Order, Integer> refundsIncludeStatus = new HashMap<>();
        try {
            String query = "SELECT distinct u.UserID, [Order].ID, [Order].CusFullname, r.RefundStatus FROM\n"
                    + "Refund r\n"
                    + "left join (SELECT OrderDetalID, OrderID,  b.BookID, Quantity, Price,\n"
                    + "BookTitle, BookCost, Stock, BookRate, BookDesc, a.AuthorID, AuthorName,\n"
                    + "Bio, p.PublisherID, PublisherName, PublisherEmail, PublisherPhone\n"
                    + "FROM OrderDetail o, Book b, Publisher p, Author a\n"
                    + "WHERE b.AuthorID = a.AuthorID\n"
                    + "AND b.PublisherID = p.PublisherID\n"
                    + "AND o.BookID = b.BookID) od on r.OrderDetalID = od.OrderDetalID\n"
                    + ", [Order]\n"
                    + "left join [User] u on u.UserID = [Order].UserID\n"
                    + "WHERE [Order].ID = od.OrderID";
            stm = connection.prepareCall(query);
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
            String query = "INSERT INTO dbo.[Order] (UserID, CusFullname, OrderDate, Phone, CusEmail, Address, PayMethodID, TotalPrice, StatusID)\n"
                    + "VALUES\n"
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareCall(query);
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
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void Delete(String oid) {
        try {
            String query = "DELETE From [Order] Where ID = ?";
            stm = connection.prepareCall(query);
            stm.setString(1, oid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
