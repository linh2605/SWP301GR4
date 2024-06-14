/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.auth.NewPassword;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Role;
import model.User;

/**
 *
 * @author zzako
 */
public class UserDAO extends DBContext {

    public List<User> getAllUsers() {
        String sqlString = "SELECT * FROM User";
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

        String sqlQuery = "UPDATE User SET FullName = ?,Gender = ?,Phone = ?,Address = ? WHERE UserID=?";
        try {
            PreparedStatement st = new DBContext().getConnection().prepareStatement(sqlQuery);
            st.setString(1, u.getFullName());
            st.setString(2, u.getGender());
            st.setString(3, u.getPhone());
            st.setString(4, u.getAddress());
            st.setInt(5, u.getId());
            return st.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println(e);
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
    
    public List<User> filterUser(String role, String gender, int currentPage, int rowsPerPage) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM User u JOIN Role r ON u.RoleID = r.RoleID WHERE 1=1";
        if (role != null && !role.isEmpty()) {
            sql += " AND u.RoleID = ?";
        }
        if (gender != null && !gender.isEmpty()) {
            sql += " AND u.Gender = ?";
        }
        sql += " ORDER BY u.UserID LIMIT ? OFFSET ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            int index = 1;
            if (role != null && !role.isEmpty()) {
                ps.setInt(index++, Integer.parseInt(role));
            }
            if (gender != null && !gender.isEmpty()) {
                ps.setString(index++, gender);
            }
            ps.setInt(index++, rowsPerPage);
            ps.setInt(index, (currentPage - 1) * rowsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));

                Role r = new Role();
                r.setRole_id(rs.getInt("RoleID"));
                r.setRole_name(rs.getString("RoleName"));
                user.setRole(r);

                user.setAvatar(rs.getString("Avatar"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                user.setStatus(rs.getString("Status"));

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    /**
     * Gets the number of rows based on role and gender filters.
     *
     * @param role the role of the user
     * @param gender the gender of the user
     * @return the number of rows
     */
    public int getNumberOfRows(String role, String gender) {
        int numRows = 0;
        String sql = "SELECT COUNT(*) FROM User WHERE 1=1";
        if (role != null && !role.isEmpty()) {
            sql += " AND RoleID = ?";
        }
        if (gender != null && !gender.isEmpty()) {
            sql += " AND Gender = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int index = 1;
            if (role != null && !role.isEmpty()) {
                ps.setInt(index++, Integer.parseInt(role));
            }
            if (gender != null && !gender.isEmpty()) {
                ps.setString(index++, gender);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                numRows = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numRows;
    }

    /**
     * Retrieves a user by its ID.
     *
     * @param userId the ID of the user to retrieve
     * @return the user with the specified ID, or null if not found
     */
    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT * FROM User u JOIN Role r ON u.RoleID = r.RoleID WHERE u.UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));

                Role r = new Role();
                r.setRole_id(rs.getInt("RoleID"));
                r.setRole_name(rs.getString("RoleName"));
                user.setRole(r);

                user.setAvatar(rs.getString("Avatar"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                user.setStatus(rs.getString("Status"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public void addUser(String username, String password, String role, String fullName, String gender, String phone, String email, String address, String avatar) {
        String sql = "INSERT INTO User (Username, Password, RoleID, FullName, Gender, Phone, Email, Address, Avatar, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'unban')";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, Integer.parseInt(role));
            ps.setString(4, fullName);
            ps.setString(5, gender);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setString(8, address);
            ps.setString(9, avatar);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserRoleAndStatus(int userId, String role, String status) {
        String sql = "UPDATE User SET RoleID = ?, Status = ? WHERE UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(role));
            ps.setString(2, status);
            ps.setInt(3, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserPassword(int userId, String password) {
        String sql = "UPDATE User SET Password = ? WHERE UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, password);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        User user = new User();
        user.setEmail("dhcongminh@gmail.com");
        user.setUsername("dhcongminh");
        user.setPassword("asdfasdf");
        user.setFullName("dddd");
        user.setGender("Other");

      //  System.out.println(userDAO.createUser(user));
        System.out.println(userDAO.getAllUsers());
    }
}
