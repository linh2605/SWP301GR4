/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.auth.NewPassword;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author zzako
 */
public class UserDAO extends DBContext {

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

        String sql = "INSERT INTO User (Username, Password, RoleID, Avatar, FullName, Gender, Email) VALUES (?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, "4");
            st.setString(4, u.getAvatar());
            st.setString(5, u.getFullName());
            st.setString(6, u.getGender());
            st.setString(7, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public User updateUser(String email, String newPassword) {
        String sql = "UPDATE [User]\n"
                + "SET Password = ?\n"
                + "WHERE Email = ? ";
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
        String sql = "SELECT * FROM dbo.[User] WHERE Email = ?";
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
        String sql = "SELECT * FROM dbo.[User] WHERE UserID=?";
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

        String sqlQuery = "UPDATE [dbo].[User] SET [Password] = ? WHERE UserID = ?";
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
        String sql = "SELECT * FROM dbo.[User] WHERE UserID = ? AND Password = ?";
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

    public User getByUsername(String username) {
        String sql = "SELECT * FROM dbo.[User] WHERE username = ?";

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
}
