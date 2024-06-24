/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.OrderStatus;
import model.Order;
import model.Orders;
import model.User;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

    // Read all products
    public List<Orders> getAllOrderForUser(Integer userID, Integer statusId) {
        List<Orders> orders = new ArrayList<>();
        List<Object> list = new ArrayList<>();
        UserDAO userDAO = new UserDAO();
        try {
            StringBuilder query = new StringBuilder();
            query.append("""
                           SELECT o.*, od.Quantity, od.Price, p.ProductName,pm.name, s.name as sname FROM sportshoponline.order o
                           join orderdetail od
                           on o.OrderID = od.OrderID
                           Join product p 
                           on od.productId = p.productId
                           JOIN orderstatus s on o.statusId = s.StatusID 
                           JOIN paymentmethod pm on pm.PaymentMethodID = o.PaymentMethodID  where o.userID = ? """);

            list.add(userID);
            if (statusId != null) {
                query.append("  and o.statusID = ? ");
                list.add(statusId);
            }
            query.append(" ORDER BY o.orderID DESC");
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(query.toString());
            mapParams(preparedStatement, list);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Orders order = new Orders();
                    order.setOrderID(rs.getInt("OrderID"));
                    User u = userDAO.GetUserById(rs.getInt("UserID"));
                    order.setUser(u);
                    order.setOrderDate(rs.getDate("OrderDate"));
                    order.setDeliverDate(rs.getDate("DeliverDate"));
                    order.setPhone(rs.getString("Phone"));
                    order.setAddress(rs.getString("Address"));
                    order.setPaymentMethodID(rs.getInt("PaymentMethodID"));
                    order.setPaymentMethodName(rs.getString("name"));
                    order.setPrice(rs.getFloat("TotalPrice"));
                    order.setStatusName(rs.getString("sname"));
                    order.setProductName(rs.getString("ProductName"));
                    order.setStatusID(rs.getInt("StatusID"));
                    order.setQuantity(rs.getInt("Quantity"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> orders = new ArrayList<>();
        try {
            String query = "SELECT * FROM sportshoponline.orderstatus; ";
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(query);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    OrderStatus order = new OrderStatus();
                    order.setId(rs.getInt("StatusID"));
                    order.setName(rs.getString("Name"));
                    order.setDescription(rs.getString("Description"));
                    
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
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

    public List<Orders> Paging(List<Orders> orders, int page, int pageSize) {
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, orders.size());

        if (fromIndex > toIndex) {
            // Handle the case where fromIndex is greater than toIndex
            fromIndex = toIndex;
        }

        return orders.subList(fromIndex, toIndex);
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<OrderStatus> l = dao.getAllOrderStatus();
        for (OrderStatus b : l) {
            System.out.println(b);
        }
    }
}
