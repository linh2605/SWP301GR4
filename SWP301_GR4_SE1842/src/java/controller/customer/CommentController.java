/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.BookDAO;
import dal.BookReivewDAO;
import dal.WishListDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Book;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CommenController", urlPatterns = {"/user/comment"})
public class CommentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session = request.getSession();
        User u = (User) session.getAttribute("usersession");
        if ( u == null) {
            request.getRequestDispatcher("/auth/login-register.jsp").forward(request, response);
        }
        
        String bookid = (String) request.getParameter("idBook");
        String star = (String) request.getParameter("star");
        String message = (String) request.getParameter("comment");
        
        BookReivewDAO bd = new BookReivewDAO();
        System.err.println("CheckComment");
        System.err.println(star);
        System.err.println(message);
        System.err.println(bookid);
         System.err.println(u.getId());
        bd.add(u.getId(), star, message,bookid);

//        boolean isAdded = new BookReivewDAO().addFeedback(bookid, uid, star, message);
        
        String referrer = request.getHeader("referer");
        response.sendRedirect(referrer);
    }
}
