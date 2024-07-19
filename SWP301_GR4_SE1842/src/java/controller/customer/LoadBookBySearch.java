/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.HTMLElements.Html;
import static controller.customer.ShopServlet.findCommonBooks;
import dal.AuthorDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Book;

/**
 *
 * @author duong
 */
public class LoadBookBySearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        AuthorDAO ad = new AuthorDAO();
        BookDAO bd = new BookDAO();
        CategoryDAO cd = new CategoryDAO();

        req.setAttribute("listA", ad.getAll());
        req.setAttribute("listC", cd.getAll());

        int index = 1;

        //get total of books
        int count = bd.getTotalBook();

        String searchInput = req.getParameter("query");

        List<Book> list = bd.getAllBookCardBySearch(searchInput);

        if (list == null) {
            list = bd.getAllBookCard();

        }
        req.getSession().setAttribute("allBooksShopPage", list);
        List<Book> listP = new ArrayList<Book>();

        for (int i = 0; i < 4; i++) {
            if (i >= list.size()) {
                break;
            }
            if (list.get(i).getStatus() == 1) {
                listP.add(list.get(i));
            }
        }
        count = list.size();

        int endPage = count / 8;

        if (count % 8 != 0) {
            endPage++;
        }

        String bookListHTML = generateBookListHTML(listP);

        // Send the HTML as a response to the client
        resp.setContentType("text/html");
        resp.getWriter().write(bookListHTML);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AuthorDAO ad = new AuthorDAO();
        BookDAO bd = new BookDAO();
        CategoryDAO cd = new CategoryDAO();

        req.setAttribute("listA", ad.getAll());
        req.setAttribute("listC", cd.getAll());

        int index = 1;

        //get total of books
        int count = bd.getTotalBook();

        String searchInput = req.getParameter("searchInput");

        List<Book> list = bd.getAllBookCardBySearch(searchInput);

        if (list == null) {
            list = bd.getAllBookCard();

        }
        req.getSession().setAttribute("allBooksShopPage", list);
        List<Book> listP = new ArrayList<Book>();

        for (int i = 0; i < 7; i++) {

            if (i >= list.size()) {
                break;
            }
            listP.add(list.get(i));

        }
        count = list.size();

        int endPage = count / 8;

        if (count % 8 != 0) {
            endPage++;
        }

        req.setAttribute("listP", listP);
        req.setAttribute("endP", endPage);
        req.setAttribute("tag", index);
        req.getRequestDispatcher("client/shop.jsp").forward(req, resp);
    }

    private String generateBookListHTML(List<Book> bookList) {
        StringBuilder html = new StringBuilder();
        html.append("<div class='d-flex flex-nowrap'>"); // Create a horizontal flex container

        for (Book book : bookList) {
            html.append("<a href=\"detail?bid=" + book.getId() + "\">");
            html.append("<div class='card' style='width:100px; margin-right: 10px;'>"); // Set fixed width for the card and add margin
            html.append("<img class='card-img-top' src='").append(book.getImg0() + "?ran=" + Math.random()).append("' alt='Card image cap' style='width: 100px; height: 150px;'>"); // Set fixed image width and height
            html.append("<div class='card-body'>");
            html.append("<p class='card-title' style='font-size: 8pt;'>").append(book.getTitle()).append("</p>");
            html.append("<p class='card-text' style='font-size: 8pt;'>Author: ").append(book.getAuthor().getName()).append("</p>"); // Set font size to 12pt
            html.append("<p class='card-text' style='font-size: 8pt;'>Price: $").append(book.getCost()).append("</p>"); // Set font size to 12pt

            html.append("</div>");
            html.append("</div>");
            html.append("</a>");

        }

        html.append("</div>"); // Close the horizontal flex container
        return html.toString();
    }

}
