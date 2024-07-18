/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

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
@WebServlet(name="WishListServlet", urlPatterns={"/wishlist"})
public class WishListServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("usersession");
        if (u == null) {
            response.sendRedirect("auth/login");
            return;
        }
        
        Header.Load(request, response);
        User updateWishListUser = new UserDao().getById(u.getId());
        request.setAttribute("listP", updateWishListUser.getWishList());
        request.getSession().setAttribute("usersession", updateWishListUser);
        request.getRequestDispatcher("client/wishlist.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
