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
            String sql = "SELECT * FROM `User`";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(new User(
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
                ));

            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean delete(int uid) {
        String sql = "DELETE FROM [User] WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
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
            String sql = "SELECT * FROM [User] where Username like '%" + search + "%'";
            if (!role.isEmpty()) {//nếu biến role là trống thì thì bỏ qua điều kiện if 
                sql += " and RoleID=" + role;// nếu biến role không trống thì cộng thêm chuỗi điều kiện lọc theo role
            }
            if (!gender.isEmpty()) {//nếu biến gender là trống thì bỏ qua điều kiện if
                sql += " and Gender='" + gender + "'";
            }
            sql += "  order by [UserID] OFFSET ? ROWS FETCH NEXT 6  ROWS ONLY";
            System.out.println(sql);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, (curpage - 1) * 6);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(new User(
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
                ));

            }
            connection.close();
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new UserDao().createUserAdmin(new User("dhcongminhhh", "asdfasdf", 1, "", "docongminh", "Male", "", "", "")));
    }

    public int countUsers(String search, String role, String gender, String index) {
        int curpage = Integer.valueOf(index);
        try {
            String sql = "SELECT COUNT(*) FROM [User] where Username like '%" + search + "%'";
            if (!role.isEmpty()) {
                sql += " and RoleID=" + role;
            }
            if (!gender.isEmpty()) {
                sql += " and Gender='" + gender + "'";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            connection.close();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean createUser(User u) {

        String sql = "  INSERT INTO `User`\n"
                + "  (Username, Password, RoleID, Avatar, UserFullName, Gender, UserEmail)\n"
                + "  VALUES(?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, "4");
            st.setString(4, u.getAvatar());
            st.setString(5, u.getFullName());
            st.setString(6, u.getGender());
            st.setString(7, u.getEmail());
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean createUserAdmin(User u) {

        String sql = "  INSERT INTO `User`\n"
                + "  (Username, Password, RoleID, Avatar, UserFullName, Gender, UserPhone, UserEmail, UserAddress)\n"
                + "  VALUES(?,?,?,?,?,?,?,?,?)";

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
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public User getUserProfileByUserId(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM [User] WHERE UserID = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
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
                        rs.getString(10),
                        new WishListDAO().getWishListObject(rs.getString(1))
                );
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getByUsername(String username) {
        String sql = "SELECT * FROM dbo.[User] WHERE username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getByEmail(String email) {
        String sql = "SELECT * FROM dbo.[User] WHERE UserEmail = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getById(int id) {
        String sql = "SELECT * FROM dbo.[User] WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
                        rs.getString(10),
                        new WishListDAO().getWishListObject(rs.getString(1))
                );
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkPassword(String username, String password) throws Exception {
        String sql = "SELECT * FROM dbo.[User] WHERE Username=? AND Password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            connection.close();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public User getUser(String username, String password) {
        String sql = "SELECT * FROM `User` WHERE Username=? AND Password=?";
        User u = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                        rs.getString(10),
                        new WishListDAO().getWishListObject(rs.getString(1))
                );
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
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
                list.add(new Role(rs.getInt(1), rs.getString(2)));
            }
            connection.close();
            return list;
        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean update(User u) {
        try {
            String sql = "UPDATE [User] SET "
                    + "Avatar = ?,"
                    + "UserFullName = ?,"
                    + "Gender = ?,"
                    + "UserPhone = ?,"
                    + "UserEmail = ?,"
                    + "UserAddress = ?,"
                    + "Password = ? "
                    + "WHERE UserID = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u.getAvatar());
            stm.setString(2, u.getFullName());
            stm.setString(3, u.getGender());
            stm.setString(4, u.getPhone());
            stm.setString(5, u.getEmail());
            stm.setString(6, u.getAddress());
            stm.setString(7, u.getPassword());
            stm.setInt(8, u.getId());
            stm.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRole(String roleId, String uid) {
        try {
            String sql = "UPDATE [User] SET [RoleID] = '" + roleId + "' WHERE [UserID] = '" + uid + "';";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();

            connection.close();
            return true;
        } catch (Exception e) {
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
        if (list.isEmpty()) {
            return null;
        }
        return list;
    }

    public int Count() {
        try {
            String query = "select count(*) as cnt from [user]";
            PreparedStatement stm = connection.prepareCall(query);
            ResultSet rs = stm.executeQuery();
            connection.close();
            while (rs.next()) {
                return rs.getInt("cnt");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int maxId() {
        try {
            String query = "select max(UserID) as max from [user]";
            PreparedStatement stm = connection.prepareCall(query);
            ResultSet rs = stm.executeQuery();
            connection.close();
            while (rs.next()) {
                return rs.getInt("max");
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
     public boolean deleteWishlist(int uid) {
        String sql = "DELETE FROM [UsersWishList] WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
      public boolean deleteCart(int uid) {
        String sql = "DELETE FROM [UserCart] WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
       public boolean deleteFeedback(int uid) {
        String sql = "DELETE FROM [Feedback] WHERE fbCusID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
        public boolean deleteOrder(int uid) {
        String sql = "DELETE FROM [Order] WHERE UserID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
         public boolean deleteOderDetail(int uid) {
        String sql = "delete from OrderDetail where OrderID = (select distinct OrderID from OrderDetail od join [Order] o on o.ID = od.OrderDetalID where o.UserID = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
          public boolean deleteRefund(int uid) {
        String sql = "delete from Refund where OrderDetalID in (select r.OrderDetalID from Refund r join OrderDetail od on r.OrderDetalID = od.OrderDetalID join [Order] o on o.ID = od.OrderID where o.UserID = ? )";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
          
       
}
