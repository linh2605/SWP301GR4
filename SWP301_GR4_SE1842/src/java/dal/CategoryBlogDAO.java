/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;

import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import model.CategoryBlog;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN-PC
 */
public class CategoryBlogDAO extends DBContext {

    public List<CategoryBlog> getAllCategories() {
        List<CategoryBlog> categories = new ArrayList<>();
        String sql = "SELECT * FROM categoryblog";
        try ( PreparedStatement stmt = connection.prepareStatement(sql);  ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                CategoryBlog category = new CategoryBlog();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

}
