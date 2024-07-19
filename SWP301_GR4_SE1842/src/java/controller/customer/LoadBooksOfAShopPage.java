/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import controller.HTMLElements.Html;
import dal.AuthorDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Author;
import model.Book;
import model.Category;

/**
 *
 * @author ACER
 */
@WebServlet(name = "LoadBooksOfAShopPage", urlPatterns = {"/LoadBooksOfAShopPage"})
public class LoadBooksOfAShopPage extends HttpServlet {

    protected void process(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        BookDAO bd = new BookDAO();
        
        String indexPage = request.getParameter("index");
        
        if (indexPage == null || indexPage.trim().equals("")) {
            indexPage = "1";
        }

        String cid = request.getParameter("cid");
        String scid = request.getParameter("scid");
        String orderType = request.getParameter("orderType");

        List<Book> list = (List<Book>) request.getSession().getAttribute("allBooksShopPage");

        if (list == null) {
            list = bd.getAllBookCard();
        }
        
        switch (Integer.valueOf(orderType)) {
            case 1:
                Collections.sort(list, (Book o1, Book o2) -> {
                    int com = o1.getTitle().compareTo(o2.getTitle());
                    if (com > 0) {
                        return 1;
                    } else if (com < 0) {
                        return -1;
                    } else {
                        return 0;
                    }
                });
                break;
            case 2:
                Collections.sort(list, (Book o1, Book o2) -> {
                    int com = o1.getTitle().compareTo(o2.getTitle());
                    if (com > 0) {
                        return -1;
                    } else if (com < 0) {
                        return 1;
                    } else {
                        return 0;
                    }
                });
                break;
            case 3:
                Collections.sort(list, (Book o1, Book o2) -> {
                    float com = o1.getCost()- (o2.getCost());
                    if (com > 0) {
                        return 1;
                    } else if (com < 0) {
                        return -1;
                    } else {
                        return 0;
                    }
                });
                break;
            case 4:
                Collections.sort(list, (Book o1, Book o2) -> {
                    float com = o1.getCost()- (o2.getCost());
                    if (com > 0) {
                        return -1;
                    } else if (com < 0) {
                        return 1;
                    } else {
                        return 0;
                    }
                });
                break;
            case 5:
                Collections.sort(list, (Book o1, Book o2) -> {
                    float com = o1.getRate() - (o2.getRate());
                    if (com > 0) {
                        return -1;
                    } else if (com < 0) {
                        return 1;
                    } else {
                        return 0;
                    }
                });
                break;
            case 6:
                Collections.sort(list, (Book o1, Book o2) -> {
                    float com = o1.getRate() - (o2.getRate());
                    if (com > 0) {
                        return 1;
                    } else if (com < 0) {
                        return -1;
                    } else {
                        return 0;
                    }
                });
                break;
        }
        
        for (int i = (Integer.valueOf(indexPage) - 1) * 8; i < Integer.valueOf(indexPage) * 8; i++) {
            if (i >= list.size()) {
                break;
            }
            if (list.get(i).getStatus() == 1) {
                out.println(Html.getBookCardInShoppage(list.get(i), request));
            }
        }
        out.println("<input id=\"indexPage__sendfromServlet\" type=\"text\" value=\"" + indexPage + "\" hidden>");
    }

}
