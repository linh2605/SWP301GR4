/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

import dal.BookDAO;
import dal.PayMethodDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name="checkOut", urlPatterns={"/checkOut"})
public class checkOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setAttribute("pmList", new PayMethodDAO().getPaymethods());
        
        User user = (User) request.getSession().getAttribute("usersession");
        List<CartItem> items = new ArrayList<>();
        if (user == null) {
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart == null) {
                response.sendRedirect("viewCart");
                return;
            }
            items = cart.getItems();
        } else {
            items = user.getCarts();
        }
        boolean unable = false;
        BookDAO bd = new BookDAO();
        List<Book> unableList = new ArrayList();
        for (CartItem item : items) {
            if (bd.getById(item.getBook().getId()).getStatus() == 0) {
                unable = true;
                unableList.add(item.getBook());
            }
        }
        if (!unable) {
            request.getRequestDispatcher("client/checkout.jsp").forward(request, response);
        } else {
            StringBuilder err = new StringBuilder();
            err.append("Some books in your cart is unable right now! Please remove unable books to check out: ");
            for (Book b : unableList) {
                err.append("<span style=\"color:#000;font-style:italic;font-weight:bold; padding: .1rem .3rem; background: #e6fff2; margin-right: .2rem;border-radius:.2rem\">" + b.getTitle() + "<span>");
            }
            request.setAttribute("unablemsg", err.toString());
            request.getRequestDispatcher("client/cart.jsp").forward(request, response);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
