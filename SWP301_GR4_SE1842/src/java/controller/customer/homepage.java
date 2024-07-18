/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.BookDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import model.Book;

/**
 *
 * @author Admin
 */
@WebServlet(name = "homepage", urlPatterns = {"/homepage", ""})
public class homepage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Header.Load(request, response);

        BookDAO bd = new BookDAO();
        List<Book> list = bd.getAllBookCard();

        List<Book> sortedRate = new ArrayList<>(list);
        sortedRate.sort(Comparator.comparingInt(Book::getRate).reversed());
        
        List<Book> lbc1 = bd.getBookCardByCategory(1);
        List<Book> lbc2 = bd.getBookCardByCategory(2);
        List<Book> lbc3 = bd.getBookCardByCategory(3);
        request.setAttribute("list1", lbc1);
        request.setAttribute("list2", lbc2);
        request.setAttribute("list3", lbc3);
        request.setAttribute("list", list);
        request.setAttribute("sortedRate", sortedRate);
        request.setAttribute("soBook", bd.getSOBook());
        request.getRequestDispatcher("client/homepage.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
