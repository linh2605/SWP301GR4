/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.customer.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderItem;
import model.Product;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    public List<Order> getOrderUser(int userId) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "SELECT \n"
                + "    orders.*, \n"
                + "    orderstatus.Name AS StatusName, \n"
                + "    paymentmethod.Name AS PaymentMethodName\n"
                + "FROM \n"
                + "    sportshoponline.order AS orders\n"
                + "INNER JOIN \n"
                + "    sportshoponline.orderstatus AS orderstatus \n"
                + "    ON orders.StatusID = orderstatus.StatusID\n"
                + "INNER JOIN \n"
                + "    sportshoponline.paymentmethod AS paymentmethod \n"
                + "    ON orders.PaymentMethodID = paymentmethod.PaymentMethodID\n"
                + "WHERE orders.UserID = ?;";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //orderId,userId,fullName,orderDate,deliverDate,phone,email,address,paymentName,totalPrice,statusNam
                Order order = new Order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        format.parse(rs.getString("OrderDate")),
                        format.parse(rs.getString("DeliverDate")),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getString("PaymentMethodName"),
                        rs.getDouble("TotalPrice"),
                        rs.getString("StatusName"));
                order.setOrderDateString(format.format(format.parse(rs.getString("OrderDate"))));
                order.setDeliverDateString(format.format(format.parse(rs.getString("DeliverDate"))));
                orders.add(order);
            }
            return orders;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<OrderItem> getOrderDetail(int orderId) {
        String sql = "SELECT * FROM sportshoponline.orderdetail \n"
                + "inner join sportshoponline.product on sportshoponline.product.ProductID = sportshoponline.orderdetail.ProductID\n"
                + "inner join sportshoponline.productcategory on sportshoponline.product.ProductID = sportshoponline.productcategory.ProductID\n"
                + "inner join sportshoponline.category on sportshoponline.category.CategoryID = sportshoponline.productcategory.CategoryID\n"
                + "inner join sportshoponline.images on sportshoponline.images.ProductID = sportshoponline.product.ProductID\n"
                + "Where OrderID = ?";
        List<OrderItem> orderDetail = new ArrayList<>();
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderItem detail = new OrderItem();
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductPrice(rs.getBigDecimal("ProductPrice"));
                product.setStock(rs.getInt("Stock"));
                product.setProductRating(rs.getInt("ProductRating"));
                product.setProductDesc(rs.getString("ProductDesc"));
                product.setBrandID(rs.getInt("BrandID"));
                product.setSupplierID(rs.getInt("SupplierID"));
                product.setImage(rs.getString("Image"));
                
                detail.setProduct(product);
                detail.setCategory(rs.getString("CategoryName"));
                detail.setQuantity(rs.getInt("Quantity"));
                //orderId,userId,fullName,orderDate,deliverDate,phone,email,address,paymentName,totalPrice,statusNam
                orderDetail.add(detail);
            }
            return orderDetail;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Order getOrderByID(int id) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "SELECT \n"
                + "    orders.*, \n"
                + "    orderstatus.Name AS StatusName, \n"
                + "    paymentmethod.Name AS PaymentMethodName\n"
                + "FROM \n"
                + "    sportshoponline.order AS orders\n"
                + "INNER JOIN \n"
                + "    sportshoponline.orderstatus AS orderstatus \n"
                + "    ON orders.StatusID = orderstatus.StatusID\n"
                + "INNER JOIN \n"
                + "    sportshoponline.paymentmethod AS paymentmethod \n"
                + "    ON orders.PaymentMethodID = paymentmethod.PaymentMethodID\n"
                + "WHERE orders.OrderID = ?;";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                //orderId,userId,fullName,orderDate,deliverDate,phone,email,address,paymentName,totalPrice,statusNam
                Order order = new Order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        format.parse(rs.getString("OrderDate")),
                        format.parse(rs.getString("DeliverDate")),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getString("PaymentMethodName"),
                        rs.getDouble("TotalPrice"),
                        rs.getString("StatusName"));
                order.setStatusId(rs.getInt("StatusID"));
                order.setOrderDateString(format.format(format.parse(rs.getString("OrderDate"))));
                order.setDeliverDateString(format.format(format.parse(rs.getString("DeliverDate"))));
                return order;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void CancelOrder(int orderId) {
        String sql = "UPDATE sportshoponline.order SET sportshoponline.order.StatusID = 3 Where OrderID =  ?";
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, orderId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {

        OrderDAO userDAO = new OrderDAO();
        for (OrderItem arg : userDAO.getOrderDetail(1)) {
            System.out.println(arg);
        }
        //  System.out.println(userDAO.createUser(user));
//        System.out.println(userDAO.getAllUsers());
    }
}
