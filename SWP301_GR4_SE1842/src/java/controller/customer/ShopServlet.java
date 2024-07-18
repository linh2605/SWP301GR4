/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import controller.HTMLElements.Html;
import controller.auth.Encode;
import dal.AuthorDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import dal.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Author;
import model.Book;
import model.Category;

/**
 *
 * @author ptd81
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filter = "";
        AuthorDAO ad = new AuthorDAO();
        BookDAO bd = new BookDAO();
        CategoryDAO cd = new CategoryDAO();
        SubCategoryDAO scd = new SubCategoryDAO();

        request.setAttribute("listA", ad.getAll());
        request.setAttribute("listC", cd.getAll());

        int index = 1;

        //get total of books
        int count = bd.getTotalBook();

        String cid = request.getParameter("cid");
        String scid = request.getParameter("scid");
        String aid = request.getParameter("aid");
        List<Book> list = (List<Book>) request.getSession().getAttribute("allBooksShopPage");

        if (list == null) {
            list = bd.getAllBookCard();
        }

//        List<Book> commonElements = new ArrayList<>(list);
        if (cid != null) {
            scid = null;
            if (cid.equals("-1")) {
                count = bd.getTotalBookCategory(Integer.valueOf(cid));
                list = bd.getAllBookCard();
                aid = null;
                request.setAttribute("cid", cid);

            } else {
                count = bd.getTotalBookCategory(Integer.valueOf(cid));
                list = bd.getBookCardByCategory(Integer.valueOf(cid));
//                commonElements = findCommonBooks(listfake,commonElements);

                filter += filter + ">" + cd.getById(Integer.parseInt(cid)).getName();

                request.setAttribute("cid", cid);

            }
        }

        if (scid != null) {
            count = bd.getTotalBookSubCategory(Integer.valueOf(scid));
            list = bd.getBySubCategory(Integer.valueOf(scid));
//            commonElements = findCommonBooks(listfake,commonElements);
            filter += filter + ">" + scd.getById(scid).getName();
            request.setAttribute("scid", scid);

        }

        if (aid != null) {
            System.err.println("Check2");
            list = bd.getBookCardByAuthorID(Integer.valueOf(aid));
//            commonElements = bd.getBookCardByAuthorID(Integer.valueOf(aid));
            request.setAttribute("aid", aid);
        }

        request.getSession().setAttribute("allBooksShopPage", list);

//        list = commonElements;
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

        System.err.println(count);

        request.setAttribute("listP", listP);
        request.setAttribute("filter", filter);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("client/shop.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    public static List<Book> findCommonBooks(List<Book> list1, List<Book> list2) {
        List<Book> commonBooks = new ArrayList<>();

        for (Book book1 : list1) {
            for (Book book2 : list2) {
                if (book1.getId() == book2.getId()) {
                    commonBooks.add(book1);
                    break; // Once a common book is found, break inner loop
                }
            }
        }

        return commonBooks;
    }

}
