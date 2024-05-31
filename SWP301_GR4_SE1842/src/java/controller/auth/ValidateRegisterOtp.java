/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import model.User;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/validateregisterOtp")
public class ValidateRegisterOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        RequestDispatcher dispatcher = null;

        if (value == otp) {

            User user = (User) request.getSession().getAttribute("registerUser");
            user.setPassword(Encode.toSHA1(user.getPassword()));
            UserDAO ud = new UserDAO();
            ud.createUser(user);
            request.setAttribute("ms1", "You signed up successful");
            request.getSession().removeAttribute("registerUser");

            
            session.setAttribute("usersession", ud.getUser(user.getUsername(), user.getPassword()));
            response.sendRedirect("../view/home");

        } else {
            request.setAttribute("message", "wrong otp");

            dispatcher = request.getRequestDispatcher("EnterregisterOtp.jsp");
            dispatcher.forward(request, response);

        }

    }

}
