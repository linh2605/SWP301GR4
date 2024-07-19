/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AuthorDAO;
import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name="DeleteAuthor", urlPatterns={"/delete-author"})
public class DeleteAuthor extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4 || us.getRoleID() == 3) {
            response.sendError(404);
            return;
        }
        String aid = request.getParameter("aid");
        new BookDAO().DeleteAuthor(aid);
        new AuthorDAO().delete(aid);
        response.sendRedirect("authors");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
    }

}
