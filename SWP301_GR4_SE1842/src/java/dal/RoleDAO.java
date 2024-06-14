package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;

/**
 * DAO class for Role entity
 */
public class RoleDAO extends DBContext {

    /**
     * Retrieves all roles from the database.
     * 
     * @return a list of roles
     */
    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        String sql = "SELECT RoleID, RoleName FROM Role";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Role role = new Role(rs.getInt("RoleID"), rs.getString("RoleName"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roles;
    }

    /**
     * Retrieves a role by its ID.
     * 
     * @param roleId the ID of the role to retrieve
     * @return the role with the specified ID, or null if not found
     */
    public Role getRoleById(int roleId) {
        Role role = null;
        String sql = "SELECT RoleID, RoleName FROM Role WHERE RoleID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                role = new Role(rs.getInt("RoleID"), rs.getString("RoleName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }

    /**
     * Main method for testing the RoleDAO class.
     * 
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        RoleDAO rDAO = new RoleDAO();
        System.out.println(rDAO.getAllRoles());
    }
}
