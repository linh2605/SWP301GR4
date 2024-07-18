/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.PublisherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Publisher;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "UpdatePublisher", urlPatterns = {"/update_publisher"})
public class UpdatePublisher extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            response.sendError(404);
            return;
        }
        String pid = request.getParameter("pid");
        if (pid != null) {
            request.setAttribute("cat", new PublisherDAO().getById(Integer.valueOf(pid)));
            request.setAttribute("action", "update");
        } else {
            request.setAttribute("action", "add");
        }

        request.getRequestDispatcher("admin/add_publisher.jsp").forward(request, response);
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
        String action = request.getParameter("c-action");
        String pid = request.getParameter("c-id");
        String name = request.getParameter("c-name");
        String mail = request.getParameter("c-email");
        String phonee = request.getParameter("c-phone");
        Publisher p = new Publisher();
        p.setName(name);
        p.setEmail(mail);
        p.setPhone(phonee);
        if (action.equals("update")) {
            p.setId(Integer.valueOf(pid));
            new PublisherDAO().update(p);
        } else if (action.equals("add")) {
            new PublisherDAO().add(p);
        }
        response.sendRedirect("publishers");
    }

}
