package dal;

 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO extends DBContext {
 
    // Read a category by its ID
    public Category getCategoryById(int categoryID) {
        String sql = "SELECT * FROM Category WHERE CategoryID = ?";
        try (PreparedStatement ps = new DBContext().getConnection().prepareStatement(sql)) {
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setCategoryDesc(rs.getString("CategoryDesc"));
                return category;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Read all categories
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try (Statement stmt = new DBContext().getConnection().createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setCategoryDesc(rs.getString("CategoryDesc"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<Category> l =c.getAllCategories();
        for(Category s : l){
            System.out.println(s);
        }
    }
}
