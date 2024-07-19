/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.marketing;

import dal.BookDAO;
import dal.BookReivewDAO;
import dal.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.BookReview;
import model.User;

/**
 *
 * @author THTP
 */
@WebServlet(name = "CustomerList", urlPatterns = {"/CustomerList"})
public class CustomerList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
             HttpSession session = req.getSession();
        User u = (User) session.getAttribute("usersession");

        if (u == null) {
            resp.sendRedirect("./auth/login");
        } else if (u.getRoleID() == 1 || u.getRoleID() == 2) {

            UserDao uDAO = new UserDao();

            List<User> uList = uDAO.getUsers("", "4", "", "1");
            req.setAttribute("username", u.getFullName());
            req.setAttribute("userList", uList);
            req.getRequestDispatcher("./marketing/CustomerList.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("./homepage");
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
    }

}
