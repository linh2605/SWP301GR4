/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import controller.HTMLElements.Html;
import controller.auth.UsernameChecking;
import dal.BookDAO;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "LoadBookDetail", urlPatterns = {"/LoadBookDetail"})
public class LoadBookDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out;
        try {
            out = response.getWriter();

            String bookid = request.getParameter("bookid");
            Book b = new BookDAO().getById(Integer.valueOf(bookid));
            
            out.print(Html.BookDetail(b, request.getSession()));
            
            
        } catch (IOException ex) {
        }

    }

}
