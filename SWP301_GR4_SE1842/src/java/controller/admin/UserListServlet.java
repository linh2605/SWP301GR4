/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.auth.Encode;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "UserListServlet", urlPatterns = {"/users"})
public class UserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            response.sendError(404);
            return;
        }

        Header.Load(request, response);
        request.setAttribute("currentmenu", "User");
        request.setAttribute("currentpage", "Users");
        String action = request.getParameter("action");
        if (action != null) {
            request.setAttribute("action", action);
            if (action.equals("view")) {
                String userid = request.getParameter("u");
                if (userid != null) {
                    User user = new UserDao().getUserProfileByUserId(Integer.valueOf(userid));
                    if (user == null) {
                        response.sendError(404);
                        return;
                    }
                    request.setAttribute("bList", user.getWishList());
                    request.setAttribute("uv", user);
                    request.setAttribute("uid", user.getId());
                    request.setAttribute("rList", new UserDao().getAllRole());
                    request.getRequestDispatcher("admin/user_form.jsp").forward(request, response);
                    return;
                }
            } else if (action.equals("add")) {
                request.setAttribute("currentpage", "User Add");
                request.setAttribute("rList", new UserDao().getAllRole());
                request.getRequestDispatcher("admin/user_form.jsp").forward(request, response);
                return;
            }
        }
        String fullnamesearch = request.getParameter("fullnamesearch");
        List<User> uList = new UserDao().getAll();
        if (fullnamesearch != null) {
            uList = new UserDao().getUserByFullName(fullnamesearch);
        }

        request.setAttribute("uList", uList);
        request.getRequestDispatcher("admin/user_list.jsp").forward(request, response);
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
        UserDao ud = new UserDao();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roleid = request.getParameter("roleid");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("view")) {
                String uid = request.getParameter("uid");
                User user = ud.getById(Integer.valueOf(uid));
                user.setFullName(fullname);
                user.setPhone(phone);
                user.setAddress(address);
                user.setEmail(email);
                user.setGender(gender);
                ud.update(user);
            } else if (action.equals("add")) {
                if (ud.getByUsername(username) == null) {
                    User user = new User();
                    user.setFullName(fullname);
                    user.setUsername(username);
                    user.setPassword(Encode.toSHA1(password));
                    user.setRoleID(Integer.valueOf(roleid));
                    ud.createUserAdmin(user);
                } else {
                    request.setAttribute("usernameexistmsg", "Username already exists!");
                    request.setAttribute("last_username", fullname);
                    request.setAttribute("last_username", username);
                    request.setAttribute("currentpage", "User Add");
                    request.setAttribute("rList", new UserDao().getAllRole());
                    request.setAttribute("action", action);
                    request.getRequestDispatcher("admin/user_form.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("users");
        }

    }

}
