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
import model.SubCategory;

/**
 *
 * @author ACER
 */
public class SubCategoryDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<SubCategory> sList;

    public SubCategoryDAO() {
    }

    public List<SubCategory> getByCategory(int categoryId) {
        sList = new ArrayList<>();
        try {
            String query = "SELECT * FROM Subcategory WHERE CategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                sList.add(new SubCategory(rs.getInt("SubCategoryID"),
                        rs.getString("SubCategoryName"),
                        rs.getString("SubCategoryDesc")));
            }
        } catch (Exception e) {
        }
        return sList;
    }

    public List<SubCategory> getAll() {
        sList = new ArrayList<>();
        try {
            String query = "SELECT * FROM Subcategory ";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                sList.add(new SubCategory(rs.getInt("SubCategoryID"),
                        rs.getString("SubCategoryName"),
                        rs.getString("SubCategoryDesc")));
            }
        } catch (Exception e) {
        }
        return sList;
    }

    public List<SubCategory> getByBook(int bookid) {
        sList = new ArrayList<>();
        try {
            String query = "SELECT * FROM BookCategory b, subcategory s WHERE b.subcategoryid = s.subcategoryid and BookID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, bookid);
            rs = stm.executeQuery();
            while (rs.next()) {
                sList.add(new SubCategory(rs.getInt("SubCategoryID"),
                        rs.getString("SubCategoryName"),
                        rs.getString("SubCategoryDesc")));
            }
        } catch (Exception e) {
        }
        return sList;
    }

    public Category getCategoryOfSub(int subid) {
        Category c = null;
        try {
            String query = "SELECT * FROM Category b, subcategory s WHERE b.categoryid = s.categoryid and SubcategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, subid);
            rs = stm.executeQuery();
            while (rs.next()) {
                c = (new Category(rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("CategoryDesc")));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public SubCategory getById(String scid) {
        try {
            String query = "SELECT * FROM Subcategory WHERE SubCategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, scid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return (new SubCategory(rs.getInt("SubCategoryID"),
                        rs.getString("SubCategoryName"),
                        rs.getString("SubCategoryDesc")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        SubCategoryDAO sd = new SubCategoryDAO();
        System.out.println(sd.getById("10").getId());

    }

    public void update(String scid, String name, String desc) {
        try {
            String query = "UPDATE SubCategory \n"
                    + "SET SubCategoryName = ?,\n"
                    + "SubCategoryDesc = ?\n"
                    + "WHERE SubCategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, desc);
            stm.setString(3, scid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void add(String name, String desc, String cid) {
        try {
            String query = "INSERT INTO SubCategory (SubCategoryName, SubCategoryDesc, CategoryID) VALUES (?, ?, ?)";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, desc);
            stm.setString(3, cid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(String scid) {
        try {
            String query = "DELETE FROM SubCategory WHERE SubCategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, scid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
}
