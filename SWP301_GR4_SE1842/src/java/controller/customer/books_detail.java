/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.BookDAO;
import dal.BookImagesDAO;
import dal.BookReivewDAO;
import dal.CategoryDAO;
import dal.DiscountDAO;
import dal.FeedbackDAO;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;
import model.BookImage;
import model.BookReview;
import model.Category;
import model.Discount;

/**
 *
 * @author ptd81
 */
@WebServlet(name = "books_detail", urlPatterns = {"/detail"})
public class books_detail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try ( PrintWriter out = response.getWriter()) {
            BookDAO bd = new BookDAO();
            DiscountDAO dd = new DiscountDAO();
            BookReivewDAO br = new BookReivewDAO(); 
            String id = request.getParameter("bid");
            Book b = bd.getById(Integer.valueOf(id));
            if (b == null) {
                response.sendError(404);
                return;
            }
            List<Book> lbc = bd.getByCategory(b.getId());
            List<BookReview> rv = br.getBookReviewAllById(b.getId());
      
            UserDao uDAO = new UserDao();
            BookDAO bDAO = new BookDAO();
            
            request.setAttribute("uDAO", uDAO);
            request.setAttribute("bDAO", bDAO);
            request.setAttribute("listFb", new FeedbackDAO().getListFeedbackByBook(id));
            request.setAttribute("countFb", new FeedbackDAO().countFeedbackByPid(id));
            request.setAttribute("avgFb", new FeedbackDAO().avgFeedbackByPid(id));
            
            request.setAttribute("listB", lbc);
            request.setAttribute("detail", b);
            request.setAttribute("listCmt", rv);
            request.setAttribute("countCmt", rv.size());
            
            request.getRequestDispatcher("client/book_detail.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
