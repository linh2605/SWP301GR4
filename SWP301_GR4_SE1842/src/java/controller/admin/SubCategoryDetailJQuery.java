/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SubCategory;

/**
 *
 * @author ACER
 */
@WebServlet(name = "SubCategoryDetailJQuery", urlPatterns = {"/sub-category-detail"})
public class SubCategoryDetailJQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String scid = request.getParameter("scid");
        SubCategory scat = new SubCategoryDAO().getById(scid);
        String subCatData = "{\"id\" : \"" + scat.getId() + "\" , \"name\" : \"" + scat.getName() + "\" , \"desc\" : \"" + scat.getDesc() + "\"}";

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(subCatData);
        out.flush();
    }

}
