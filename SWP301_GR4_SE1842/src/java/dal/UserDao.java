package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class UserDao extends DBContext {

    public ArrayList<User> getAll() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User"; // Không cần dấu ngoặc vuông
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean delete(int uid) {
        String sql = "DELETE FROM User WHERE UserID = ?"; // Không cần dấu ngoặc vuông

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public ArrayList<User> getUsers(String search, String role, String gender, String index) {
        ArrayList<User> users = new ArrayList<>();
        int curpage = Integer.valueOf(index);
        try {
            String sql = "SELECT * FROM User WHERE Username LIKE ?";
            if (!role.isEmpty()) {
                sql += " AND RoleID = ?";
            }
            if (!gender.isEmpty()) {
                sql += " AND Gender = ?";
            }
            sql += " LIMIT ?, 6"; // Sử dụng LIMIT cho phân trang
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + search + "%");
            int paramIndex = 2;
            if (!role.isEmpty()) {
                preparedStatement.setString(paramIndex++, role);
            }
            if (!gender.isEmpty()) {
                preparedStatement.setString(paramIndex++, gender);
            }
            preparedStatement.setInt(paramIndex, (curpage - 1) * 6);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress")
                ));
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int countUsers(String search, String role, String gender) {
        try {
            String sql = "SELECT COUNT(*) FROM User WHERE Username LIKE ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + search + "%");
            if (!role.isEmpty()) {
                sql += " AND RoleID = ?";
            }
            if (!gender.isEmpty()) {
                sql += " AND Gender = ?";
            }
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean createUser(User u) {
        String sql = "INSERT INTO User (Username, Password, RoleID, Avatar, UserFullName, Gender, UserEmail) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, 4); // Giả định RoleID là 4
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

    public boolean createUserAdmin(User u) {
        String sql = "INSERT INTO User (Username, Password, RoleID, Avatar, UserFullName, Gender, UserPhone, UserEmail, UserAddress) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRoleID());
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

    public User getUserProfileByUserId(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM User WHERE UserID = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getByUsername(String username) {
        String sql = "SELECT * FROM User WHERE Username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getByEmail(String email) {
        String sql = "SELECT * FROM User WHERE UserEmail = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getById(int id) {
        String sql = "SELECT * FROM User WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress"),
                        new WishListDAO().getWishListObject(rs.getString("UserID"))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkPassword(String username, String password) {
        String sql = "SELECT * FROM User WHERE Username = ? AND Password = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            return rs.next(); // Nếu có kết quả thì mật khẩu đúng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUser(String username, String password) {
        String sql = "SELECT * FROM User WHERE Username = ? AND Password = ?";
        User u = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress"),
                        new WishListDAO().getWishListObject(rs.getString("UserID"))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Role";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                list.add(new Role(rs.getInt("RoleID"), rs.getString("RoleName")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public boolean update(User u) {
        try {
            String sql = "UPDATE User SET Avatar = ?, UserFullName = ?, Gender = ?, UserPhone = ?, UserEmail = ?, UserAddress = ?, Password = ? WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u.getAvatar());
            stm.setString(2, u.getFullName());
            stm.setString(3, u.getGender());
            stm.setString(4, u.getPhone());
            stm.setString(5, u.getEmail());
            stm.setString(6, u.getAddress());
            stm.setString(7, u.getPassword());
            stm.setInt(8, u.getId());
            int rowsUpdated = stm.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRole(String roleId, String uid) {
        try {
            String sql = "UPDATE User SET RoleID = ? WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, roleId);
            stm.setString(2, uid);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> getUserRefunding() {
        List<User> list = new ArrayList<>();
        OrderDetailDAO odd = new OrderDetailDAO();
        List<RefundBook> rbList = odd.getAllRefund();
        for (RefundBook rbook : rbList) {
            list.add(rbook.getOrderDetail().getOrder().getUser());
        }
        return list.isEmpty() ? null : list;
    }

    public int Count() {
        try {
            String query = "SELECT COUNT(*) AS cnt FROM User";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int maxId() {
        try {
            String query = "SELECT MAX(UserID) AS max FROM User";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("max");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean deleteWishlist(int uid) {
        String sql = "DELETE FROM UsersWishList WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteCart(int uid) {
        String sql = "DELETE FROM UserCart WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteFeedback(int uid) {
        String sql = "DELETE FROM Feedback WHERE fbCusID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteOrder(int uid) {
        String sql = "DELETE FROM `Order` WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteOrderDetail(int uid) {
        String sql = "DELETE FROM OrderDetail WHERE OrderID IN (SELECT DISTINCT OrderID FROM OrderDetail od JOIN `Order` o ON o.ID = od.OrderID WHERE o.UserID = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteRefund(int uid) {
        String sql = "DELETE FROM Refund WHERE OrderDetailID IN (SELECT r.OrderDetailID FROM Refund r JOIN OrderDetail od ON r.OrderDetailID = od.OrderDetailID JOIN `Order` o ON o.ID = od.OrderID WHERE o.UserID = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean updateAvatar(User user) {
        try {
            String sql = "UPDATE User SET Avatar = ? WHERE UserID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getAvatar());
            stmt.setInt(2, user.getId());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> getUserByFullName(String fullnamesearch) {
        String sql = "SELECT * FROM User WHERE UserFullName LIKE ?";
        List<User> uList = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + fullnamesearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                uList.add(new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getString("Avatar"),
                        rs.getString("UserFullName"),
                        rs.getString("Gender"),
                        rs.getString("UserPhone"),
                        rs.getString("UserEmail"),
                        rs.getString("UserAddress"),
                        new WishListDAO().getWishListObject(rs.getString("UserID")))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return uList;
    }
    
    public static void main(String[] args) {
        System.out.println(new UserDao().getUserByFullName("cong"));
    }
}
