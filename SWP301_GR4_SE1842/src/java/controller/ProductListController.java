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
import model.Product;

/**
 *
 * @author auiri
 */
@WebServlet(name = "ProductListController", urlPatterns = {"/view/products"})
public class ProductListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String catId = request.getParameter("catId");
        int catIdAsInt = 0;
        if (catId != null) {
            catIdAsInt = Integer.parseInt(catId);
        }
        String search = request.getParameter("search");
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        request.setAttribute("pList", pd.getAllProducts(search, catIdAsInt));

        request.setAttribute("cList", cd.getAllCategories());

        request.getRequestDispatcher("product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
