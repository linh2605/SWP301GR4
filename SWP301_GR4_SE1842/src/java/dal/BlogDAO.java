/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public List<Blog> getAllBlogs(int page, int pageSize) {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM blog LIMIT ?, ?";
        int offset = (page - 1) * pageSize;
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, pageSize);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogId(rs.getInt("blog_id"));
                blog.setBlogTitle(rs.getString("blog_title"));
                blog.setDescription(rs.getString("description"));
                blog.setImg(rs.getString("img"));
                blog.setAuthorId(rs.getInt("author_id"));
                blog.setPostDate(rs.getDate("post_date"));
                blog.setBlogCategoryId(rs.getInt("blog_category"));
                blog.setStatus(rs.getString("status"));
                blog.setViews(rs.getInt("views"));
                blog.setActive(rs.getInt("active"));

                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public int getTotalBlogs() {
        String sql = "SELECT COUNT(*) AS total FROM blog";
        try ( PreparedStatement stmt = connection.prepareStatement(sql);  ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Blog> getLatestBlogs(int limit) {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM blog ORDER BY post_date DESC LIMIT ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogId(rs.getInt("blog_id"));
                blog.setBlogTitle(rs.getString("blog_title"));
                blog.setDescription(rs.getString("description"));
                blog.setImg(rs.getString("img"));
                blog.setAuthorId(rs.getInt("author_id"));
                blog.setPostDate(rs.getDate("post_date"));
                blog.setBlogCategoryId(rs.getInt("blog_category"));
                blog.setStatus(rs.getString("status"));
                blog.setViews(rs.getInt("views"));
                blog.setActive(rs.getInt("active"));

                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public List<Blog> getBlogsByTitle(String title, int page, int pageSize) {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM blog WHERE blog_title LIKE ? LIMIT ?, ?";
        int offset = (page - 1) * pageSize;
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + title + "%");
            stmt.setInt(2, offset);
            stmt.setInt(3, pageSize);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogId(rs.getInt("blog_id"));
                blog.setBlogTitle(rs.getString("blog_title"));
                blog.setDescription(rs.getString("description"));
                blog.setImg(rs.getString("img"));
                blog.setAuthorId(rs.getInt("author_id"));
                blog.setPostDate(rs.getDate("post_date"));
                blog.setBlogCategoryId(rs.getInt("blog_category"));
                blog.setStatus(rs.getString("status"));
                blog.setViews(rs.getInt("views"));
                blog.setActive(rs.getInt("active"));

                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public int countBlogsByTitle(String title) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS total FROM blog WHERE blog_title LIKE ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + title + "%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    
    

    public static void main(String[] args) {
        BlogDAO blogDAO = new BlogDAO();

        int page = 1;
        int pageSize = 2;
        List<Blog> blogs = blogDAO.getBlogsByTitle("Tâm", 1, 1);

        for (Blog blog : blogs) {
            System.out.println(blog);
        }

    }
}
