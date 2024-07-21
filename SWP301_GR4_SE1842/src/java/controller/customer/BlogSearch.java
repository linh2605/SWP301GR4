/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BlogSearch", urlPatterns = {"/BlogSearch"})
public class BlogSearch extends HttpServlet {

    private static final int PAGE_SIZE = 6;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("query");
        int page = 1;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        BlogDAO blogDAO = new BlogDAO();
        if (searchQuery != null && !searchQuery.isEmpty()) {
            // Lấy tổng số bài đăng tương ứng với tiêu đề
            int totalBlogs = blogDAO.countBlogsByTitle(searchQuery);

            // Tính số trang
            int totalPages = (int) Math.ceil((double) totalBlogs / PAGE_SIZE);

            // Lấy danh sách bài đăng cho trang hiện tại
            List<Blog> foundBlogs = blogDAO.getBlogsByTitle(searchQuery, page, PAGE_SIZE);

            request.setAttribute("foundBlogs", foundBlogs);
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
        }

        request.getRequestDispatcher("/search-result.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
