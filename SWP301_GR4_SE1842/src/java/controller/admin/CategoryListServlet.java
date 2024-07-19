/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.SubCategory;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CategoryListServlet", urlPatterns = {"/categories"})
public class CategoryListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4|| us.getRoleID() == 3) {
            response.sendError(404);
            return;
        }
        
        request.setAttribute("currentmenu", "Management");
        request.setAttribute("currentpage", "Product Category");
        Header.Load(request, response);

        CategoryDAO cd = new CategoryDAO();
        SubCategoryDAO scd = new SubCategoryDAO();
        String cid = request.getParameter("cid");

        if (cid != null) {
            try {
                Category cat = cd.getById(Integer.valueOf(cid));
                request.setAttribute("cat", cat);
                request.setAttribute("action", "update");
                request.setAttribute("scList", scd.getByCategory(Integer.valueOf(cid)));
            } catch (Exception e) {
                response.sendError(404);
                return;
            }
            request.getRequestDispatcher("admin/subcategory_list.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("add")) {
                request.setAttribute("action", "add");
                request.getRequestDispatcher("admin/subcategory_list.jsp").forward(request, response);
                return;
            } else {
                response.sendError(404);
                return;
            }
        }

        request.setAttribute("cList", cd.getAll());
        request.getRequestDispatcher("admin/category_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            response.sendError(404);
            return;
        }
        
        CategoryDAO cd = new CategoryDAO();
        SubCategoryDAO scd = new SubCategoryDAO();

        String c_id = request.getParameter("c-id");
        String c_name = request.getParameter("c-name");
        String c_desc = request.getParameter("c-desc");

        if (c_name != null && c_desc != null) {
            String c_action = request.getParameter("c-action");
            if (c_action != null) {
                if (c_action.equals("add")) {
                    cd.add(c_name, c_desc);
                    response.sendRedirect("categories");
                    return;
                } else if (c_action.equals("update")) {
                    cd.update(c_id, c_name, c_desc);
                }
            }
        }

        String sc_name = request.getParameter("sc-name");
        String sc_desc = request.getParameter("sc-desc");
        String sc_id = request.getParameter("sc-id");
        if (sc_name != null && sc_desc != null) {
            String sc_action = request.getParameter("sc-action");
            if (sc_action != null && sc_action.equals("update")) {
                scd.update(sc_id, sc_name, sc_desc);
            } else if (sc_action != null && sc_action.equals("add")) {
                scd.add(sc_name, sc_desc, c_id);
            }
        }
        response.sendRedirect("categories?cid=" + c_id);
    }

}
