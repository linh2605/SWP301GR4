/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

@WebServlet(name = "HomeController", urlPatterns = {"/view/home"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdao = new CategoryDAO();
        List<Category> listC = cdao.getAllCategories();
        ProductDAO productDAO = new ProductDAO();
        request.setAttribute("listC", listC);
        String pageParam = request.getParameter("page");
        String searchParam = request.getParameter("search");
         String categoryParam = request.getParameter("category");
        int page = 1; // Default to the first page
        int pageSize = 5; // Set the desired page size
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        Integer categoryId = null;
        if (categoryParam != null && !categoryParam.isEmpty()) {
            categoryId = Integer.valueOf(categoryParam);
        }
         List<Product> products = productDAO.getAllProducts(searchParam, categoryId);

        List<Product> pagingProduct = productDAO.Paging(products, page, pageSize);
        System.out.println(pagingProduct.size());
        request.setAttribute("products", pagingProduct);
        request.setAttribute("totalPages", products.size() % pageSize == 0 ? (products.size() / pageSize) : (products.size() / pageSize + 1));
        request.setAttribute("currentPage", page);
        request.setAttribute("searchParam", searchParam);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
