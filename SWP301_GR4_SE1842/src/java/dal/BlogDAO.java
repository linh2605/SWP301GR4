/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class BlogDAO extends DBContext {

    public Blog getBlogById(int id) {
        String sql = "select b.*, u.FullName from blog b JOIN User u On b.createBy = u.UserID WHERE blogId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("blogId"));
                blog.setTitle(rs.getString("blog_title"));
                blog.setContent(rs.getString("content"));
                blog.setCreateAt(rs.getDate("createAt"));
                blog.setCreator(rs.getInt("createBy"));
                blog.setImage(rs.getString("img"));
                blog.setCreatorName("FullName");
                return blog;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Read all products
    public List<Blog> getAllBlogs(String searchParam) {
        List<Blog> blogs = new ArrayList<>();
        List<Object> list = new ArrayList<>();
        try {
            StringBuilder query = new StringBuilder();
            query.append("""
                         select b.*, u.FullName from blog b JOIN User u On b.createBy = u.UserID  where 1=1""");
            if (searchParam != null && !searchParam.trim().isEmpty()) {
                query.append(" AND b.blog_title LIKE ? ");
                list.add("%" + searchParam + "%");
            }
            query.append(" ORDER BY b.createAt DESC");
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(query.toString());
            mapParams(preparedStatement, list);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Blog blog = new Blog();
                    blog.setId(rs.getInt("blogId"));
                    blog.setTitle(rs.getString("blog_title"));
                    blog.setContent(rs.getString("content"));
                    blog.setCreateAt(rs.getDate("createAt"));
                    blog.setCreator(rs.getInt("createBy"));
                    blog.setImage(rs.getString("img"));
                    blog.setCreatorName("FullName");
                    blogs.add(blog);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date) {
                ps.setTimestamp(i++, new Timestamp(((Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else {
                ps.setString(i++, (String) arg);
            }

        }
    }

    public List<Blog> Paging(List<Blog> blogs, int page, int pageSize) {
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, blogs.size());

        if (fromIndex > toIndex) {
            // Handle the case where fromIndex is greater than toIndex
            fromIndex = toIndex;
        }

        return blogs.subList(fromIndex, toIndex);
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        List<Blog> l = dao.getAllBlogs("");
        for (Blog b : l) {
            System.out.println(b);
        }
    }
}
