/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BlogController", urlPatterns = {"/view/blog"})
public class BlogController extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogDAO = new BlogDAO();
        
        String pageParam = request.getParameter("page");
        String searchParam = request.getParameter("search");
        
        int page = 1; // Default to the first page
        int pageSize = 6; // Set the desired page size
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
         
         List<Blog> blogs = blogDAO.getAllBlogs(searchParam);
        System.out.println("AAAAAAAA"+blogs.size());
        List<Blog> pagingBlog = blogDAO.Paging(blogs, page, pageSize);
        System.out.println(pagingBlog.size());
        request.setAttribute("blogs", pagingBlog);
        request.setAttribute("totalPages", blogs.size() % pageSize == 0 ? (blogs.size() / pageSize) : (blogs.size() / pageSize + 1));
        request.setAttribute("currentPage", page);
        request.setAttribute("searchParam", searchParam);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }
 
 
}
