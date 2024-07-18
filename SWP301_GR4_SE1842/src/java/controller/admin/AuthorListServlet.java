/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;


import dal.AuthorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.User;
import model.Author;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AuthorListServlet", urlPatterns = {"/authors"})
public class AuthorListServlet extends HttpServlet {

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
        request.setAttribute("currentpage", "Author");
        Header.Load(request, response);

        AuthorDAO ad = new AuthorDAO();
     
        String aid = request.getParameter("aid");

        if (aid != null) {
            try {
                Author cat = ad.getById(Integer.valueOf(aid));
                request.setAttribute("cat", cat);
                request.setAttribute("action", "update");
                
            } catch (Exception e) {
                response.sendError(404);
                return;
            }
            request.getRequestDispatcher("admin/author_list.jsp").forward(request, response);
            return;
        }
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("add")) {
                request.setAttribute("action", "add");
                request.getRequestDispatcher("admin/author_list.jsp").forward(request, response);
                return;
            } else {
                response.sendError(404);
                return;
            }
        }
        request.setAttribute("aList", ad.getAll());
        request.getRequestDispatcher("admin/author_list.jsp").forward(request, response);
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
        
        AuthorDAO ad = new AuthorDAO();
  

        String a_id = request.getParameter("a-id");
        String a_name = request.getParameter("a-name");
        String a_bio = request.getParameter("a-bio");

        if (a_name != null && a_bio != null) {
            String a_action = request.getParameter("a-action");
            if (a_action != null) {
                if (a_action.equals("add")) {
                    ad.add(a_name, a_bio);
                    response.sendRedirect("authors");
                    return;
                } else if (a_action.equals("update")) {
                    ad.update(a_id, a_name, a_bio);
                }
            }
        }

        response.sendRedirect("authors?aid=" + a_id);
    }

}
