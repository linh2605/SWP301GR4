/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/auth/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        // Mã băm cho mật khẩu
        password = Encode.toSHA1(password);
        UserDAO ud = new UserDAO();
        User u = ud.getUser(username, password);
        if (u == null) {
            request.setAttribute("errmsg", "Username or password is incorrect!");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.removeAttribute("carts");
            session.setAttribute("usersession", u);
            if (u.getRoleID() != 4) {

                if (u.getRoleID() == 2) {
                    response.sendRedirect("../view/mktdashboard.jsp");
                }
                if (u.getRoleID() == 1) {
                    response.sendRedirect("../admin/adminDashboard.jsp");
                }
                if (u.getRoleID() == 3) {
                    response.sendRedirect("../sale/saleDashboard.jsp");
                }

            } else {
                response.sendRedirect("../view/home");
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
