/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.UserDao;
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
@WebServlet(name = "UserListServlet32", urlPatterns = {"/admin/users"})
public class UserControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4 || us.getRoleID() != 1) {
            response.sendError(404);
            return;
        }
        String action = request.getParameter("action");
        
        if (action != null) {
            String userid = request.getParameter("u");
            if (userid != null) {
                User user = new UserDao().getUserProfileByUserId(Integer.valueOf(userid));
                if (user == null) {
                    response.sendError(404);
                    return;
                }
                request.setAttribute("bList", user.getWishList());
                request.setAttribute("uv", user);
                request.getRequestDispatcher("admin/user_form.jsp").forward(request, response);
                return;
            }
        }

        request.setAttribute("uList", new UserDao().getAll());
        request.getRequestDispatcher("admin/user_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
