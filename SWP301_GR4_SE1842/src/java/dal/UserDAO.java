/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.auth.NewPassword;
import controller.customer.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.AbstractList;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.Order;
import model.Role;
import model.User;

/**
 *
 * @author zzako
 */
public class UserDAO extends DBContext {

    public List<User> getAllUsers() {
        String sqlString = "SELECT * FROM User WHERE RoleID = 4";
        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlString);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User();
                Role role = new Role();
                user.setId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setAvatar(rs.getString("Avatar"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                userList.add(user);
            }

            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public User getUser(String username, String password) {
        String sql = "SELECT * FROM User WHERE Username=? AND Password=?";
        User u = null;

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public boolean createUser(User u) {

        String sql = "INSERT INTO User (Username, Password, RoleID, Avatar, FullName, Gender, Phone, Email, Address) "
                + "VALUES (?, ?,? , ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, "4");
            st.setString(4, u.getAvatar());
            st.setString(5, u.getFullName());
            st.setString(6, u.getGender());
            st.setString(7, u.getPhone());
            st.setString(8, u.getEmail());
            st.setString(9, u.getAddress());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public User updateUser(String email, String newPassword) {
        String sql = "UPDATE User \n"
                + "                SET Password = ?\n"
                + "                WHERE Email = ?";
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, email);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return getByEmail(email);
    }

    public User getByEmail(String email) {
        String sql = "SELECT * FROM User WHERE Email = ?";
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;

    }

    public User GetUserById(int id) {
        String sql = "SELECT * FROM User WHERE UserID=?";
        User u = null;

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
            return u;
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;
    }

    public boolean ValidateUserID(int id) {
        if (GetUserById(id) == null) {
            return false; // khong tồn tại user
        }
        return true; // tồn tại user
    }

    public boolean ChangePassword(int userId, String newPass, String olPass) {
        if (!ValidateUserID(userId)) {
            return false;
        }

        if (!validateOldPass(userId, olPass)) {
            return false;
        }

        String sqlQuery = "UPDATE User SET Password = ? WHERE UserID = ?";
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlQuery);
            st.setString(1, newPass);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean validateOldPass(int uId, String oldPass) {
        String sql = "SELECT * FROM User WHERE UserID = ? AND Password = ?";
        User u = null;

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, uId);
            st.setString(2, oldPass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean UpdateProfile(User u) {

        String sqlQuery = "UPDATE User SET FullName = ?, Gender = ?,Phone = ?,Address = ?, Email =? , Password = ?, Username = ? WHERE UserID=?";
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlQuery);
            st.setString(1, u.getFullName());
            st.setString(2, u.getGender());
            st.setString(3, u.getPhone());
            st.setString(4, u.getAddress());
            st.setString(5, u.getEmail());
            st.setString(6, u.getPassword());
            st.setString(7, u.getUsername());
            st.setInt(8, u.getId());
            return st.executeUpdate() > 0;

        } catch (SQLException e) {
        }
        return false;
    }

    public User getByUsername(String username) {
        String sql = "SELECT * FROM User WHERE username = ?";

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setRoleID(rs.getInt(4));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

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

    public List<OrderDetail> getOrderDetail(int orderId) {
        String sql = "SELECT * FROM sportshoponline.orderdetail\n"
                + "inner join sportshoponline.product on sportshoponline.orderdetail.ProductID = sportshoponline.orderdetail.ProductID\n"
                + "inner join sportshoponline.productcategory on sportshoponline.product.ProductID = sportshoponline.productcategory.ProductID\n"
                + "inner join sportshoponline.category on sportshoponline.category.CategoryID = sportshoponline.productcategory.CategoryID\n"
                + "inner join sportshoponline.subcategory on sportshoponline.subcategory.sub = sportshoponline.productcategory.SubCategoryID";
        List<OrderDetail> orderDetail = new ArrayList<>();
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //orderId,userId,fullName,orderDate,deliverDate,phone,email,address,paymentName,totalPrice,statusNam
            }
            return orderDetail;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> filterUsers(String keyword) {
        String sqlString = "SELECT * FROM `user` WHERE `FullName` LIKE ? OR `Email` LIKE ? OR `Phone` LIKE ?";
        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlString);
            String searchPattern = "%" + keyword + "%";
            st.setString(1, searchPattern);
            st.setString(2, searchPattern);
            st.setString(3, searchPattern);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setAvatar(rs.getString("Avatar"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                userList.add(user);
            }

            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public List<User> getAllUsersSortedByName() {
        String sqlString = "SELECT * FROM `user` ORDER BY `FullName` ASC";
        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlString);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setAvatar(rs.getString("Avatar"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                userList.add(user);
            }

            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public void deleteUser(int userID) {
        String sqlString = "DELETE FROM `user` WHERE UserID = ?";

        try (PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlString); ResultSet rs = st.executeQuery();) {

            st.setInt(1, userID);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getUsersByFullName(String fullname) {
        List<User> uList = new ArrayList();
        String sql = "SELECT * FROM User WHERE FullName Like ? AND RoleID = 4";
        User u = null;

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, "%" + fullname + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                u = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
                uList.add(u);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }

        return uList;
    }

    public static void main(String[] args) {

//        try {
//            UserDAO userDAO = new UserDAO();
//            for (Order arg : userDAO.getOrderUser(2)) {
//                System.out.println(arg);
//            }
//        } catch (ParseException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//      //  System.out.println(userDAO.createUser(user));
//        System.out.println(userDAO.getAllUsers());
    }

}
