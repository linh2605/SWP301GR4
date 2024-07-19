/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.marketing;

import dal.BookDAO;
import dal.DiscountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.*;

/**
 *
 * @author THTP
 */
@WebServlet(name = "DiscountList", urlPatterns = {"/DiscountList"})
public class DiscountList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            User u = (User) session.getAttribute("usersession");

            if (u == null) {
                resp.sendRedirect("./auth/login");
            } else if (u.getRoleID() == 1 || u.getRoleID() == 2) {

                DiscountDAO dDAO = new DiscountDAO();
                BookDAO bDAO = new BookDAO();

                List<Discount> brList = dDAO.getAllDiscount();
                req.setAttribute("username", u.getFullName());
                req.setAttribute("discountList", brList);
                req.setAttribute("bDAO", bDAO);
                req.getRequestDispatcher("./marketing/DiscountList.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("./homepage");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

}
