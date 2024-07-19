/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author ACER
 */
public class CategoryDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<Category> list;

    public CategoryDAO() {
    }

    public List<Category> getAll() {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Category";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                SubCategoryDAO scd = new SubCategoryDAO();
                Category a = new Category(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("CategoryDesc"),
                        scd.getByCategory(rs.getInt("CategoryID"))
                );
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getById(int categoryid) {
        try {
            String query = "SELECT * FROM Category WHERE CategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, categoryid);
            rs = stm.executeQuery();

            if (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("CategoryID"));
                category.setName(rs.getString("CategoryName"));
                category.setDesc(rs.getString("CategoryDesc"));

                return category;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

    public List<Category> getByBook(int bookid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM BookCategory b, Category c WHERE b.CategoryID = c.CategoryID AND BookID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, bookid);
            rs = stm.executeQuery();
            while (rs.next()) {
                SubCategoryDAO scd = new SubCategoryDAO();
                Category a = new Category(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("CategoryDesc"),
                        scd.getByCategory(rs.getInt("CategoryID"))
                );
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        CategoryDAO cs = new CategoryDAO();
        System.out.println(cs.getByBook(3).get(0).getName());
    }

    public void update(String cid, String name, String desc) {
        try {
            String query = "UPDATE Category \n"
                    + "SET CategoryName = ?,\n"
                    + "CategoryDesc = ?\n"
                    + "WHERE CategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, desc);
            stm.setString(3, cid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void add(String name, String desc) {
        try {
            String query = "INSERT INTO Category (CategoryName, CategoryDesc) VALUES (?, ?)";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, desc);

            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(String cid) {
        try {
            String query = "DELETE FROM Category WHERE CategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, cid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }

}
