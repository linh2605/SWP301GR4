/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
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

        HttpSession session = request.getSession();
        session.setAttribute("currCate", 0);
        session.setAttribute("currBrand", 0);
        session.setAttribute("currSearch", "");

        String catId = request.getParameter("catId");
        String brandId = request.getParameter("brandId");
        String search = request.getParameter("search");

        int catIdAsInt = 0;
        int brandIdAsInt = 0;
        if (catId != null) {
            try {
                catIdAsInt = Integer.parseInt(catId);
                session.setAttribute("currCate", catIdAsInt);
            } catch (Exception e) {
                catIdAsInt = 0;
            }
        }
        if (brandId != null) {
            try {
                brandIdAsInt = Integer.parseInt(brandId);
                session.setAttribute("currBrand", brandIdAsInt);
            } catch (Exception e) {
                brandIdAsInt = 0;
            }
        }
        if (search != null && !search.trim().equals("")) {
            session.setAttribute("currSearch", search);
        }
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        BrandDAO bd = new BrandDAO();
        int pageSize = 8;
        int page = 1;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                page = 1;
            }
        }
        List<Product> products = pd.getAllProductsOnShop(search, catIdAsInt, brandIdAsInt);
        List<Product> pagingProduct = pd.Paging(products, page, pageSize);
        request.setAttribute("pList", pagingProduct);
        request.setAttribute("brList", bd.getAllBrands());
        request.setAttribute("cList", cd.getAllCategories());
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", products.size() % pageSize == 0 ? (products.size() / pageSize) : (products.size() / pageSize + 1));

        request.getRequestDispatcher("product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
