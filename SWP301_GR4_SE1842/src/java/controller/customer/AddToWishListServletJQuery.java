/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.BookDAO;
import dal.WishListDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AddToWishListServletJQuery", urlPatterns = {"/add-to-wishlist"})
public class AddToWishListServletJQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        User user = (User) request.getSession().getAttribute("usersession");
        if (user == null) {
            return;
        }
        PrintWriter out = response.getWriter();
        WishListDAO wd = new WishListDAO();
        //if adding
        if (wd.addToWishList(user.getId() + "", bookid)) {
        } //if removing
        else {
            wd.removeFromWishList(user.getId() + "", bookid);
        }
        user.setWishList(wd.getWishListObject(user.getId() + ""));
        request.getSession().setAttribute("usersession", user);
        out.print("wishlist (" + user.getWishList().size() + ")");
    }
}
