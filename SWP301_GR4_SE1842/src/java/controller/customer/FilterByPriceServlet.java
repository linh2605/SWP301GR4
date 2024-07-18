/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.HTMLElements.Html;
import dal.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import model.Book;

/**
 *
 * @author duong
 */
public class FilterByPriceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        
        
        String cid = req.getParameter("cid");
        String scid = req.getParameter("scid");
        String orderType = req.getParameter("orderType");
        double minPrice = Double.parseDouble(req.getParameter("minPrice"));
        double maxPrice = Double.parseDouble(req.getParameter("maxPrice"));
       

        PrintWriter out = resp.getWriter();

        BookDAO bd = new BookDAO();

        String indexPage = req.getParameter("index");
    
        if (indexPage == null || indexPage.trim().equals("")) {
            indexPage = "1";
        }
       
        List<Book> list = (List<Book>) req.getSession().getAttribute("allBooksShopPage");

        if (list == null) {
            list = bd.getAllBookCard();
        }
       
        for (int i = (Integer.valueOf(indexPage) - 1) * 8; i < Integer.valueOf(indexPage) * 8; i++) {
                if (i >= list.size()) {
                    break;
                }  
                if (list.get(i).getCost() >= minPrice && list.get(i).getCost() <= maxPrice) {
                    out.println(Html.getBookCardInShoppage(list.get(i), req));
                
                }   
        }
        out.println("<input id=\"indexPage__sendfromServlet\" type=\"text\" value=\"" + indexPage + "\" hidden>");
        
    }

}
