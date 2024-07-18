/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.SubCategoryDAO;
import dal.PublisherDAO;
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
import model.Publisher;

/**
 *
 * @author ACER
 */
@WebServlet(name = "PublisherListServlet", urlPatterns = {"/publishers"})
public class PublisherListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            response.sendError(404);
            return;
        }
        
        request.setAttribute("currentmenu", "Management");
        request.setAttribute("currentpage", "Publisher");
        Header.Load(request, response);

        
  
        PublisherDAO pd = new PublisherDAO();
        
        String pid = request.getParameter("pid");

        if (pid != null) {
            try {
                Publisher cat = pd.getById(Integer.valueOf(pid));
                request.setAttribute("cat", cat);
                request.setAttribute("action", "update");
            } catch (Exception e) {
                response.sendError(404);
                return;
            }
            request.getRequestDispatcher("admin/publisher_list.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("add")) {
                request.setAttribute("action", "add");
                request.getRequestDispatcher("admin/publisher_list.jsp").forward(request, response);
                return;
            } else {
                response.sendError(404);
                return;
            }
        }

        request.setAttribute("pList", pd.getAll());
        request.getRequestDispatcher("admin/publisher_list.jsp").forward(request, response);
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
        
        
        PublisherDAO pd = new PublisherDAO();
    }

}
