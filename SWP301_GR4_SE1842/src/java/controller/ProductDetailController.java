/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.FeedbackDao;
import dal.ProductDetailsDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import model.Feedback;
import model.Feedbacks;
import model.ProductDetails;
import model.User;

/**
 *
 * @author auiri
 */
public class ProductDetailController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private ProductDetailsDao productDetailsDao;
    private FeedbackDao feedbackDao;

    public void init() {
        productDetailsDao = new ProductDetailsDao();
        feedbackDao = new FeedbackDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("pId"));
        ProductDetails product = productDetailsDao.selectProduct(productId);
        List<Feedbacks> feedbackList = feedbackDao.getAllFeedbackByProduct(productId);
        request.setAttribute("product", product);
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("product-details.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usersession");
        if (action.equals("add")) {
            int pId = Integer.parseInt(request.getParameter("pid"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String content = request.getParameter("content");
            boolean isAdded = feedbackDao.addFeedback(pId, user.getId(), rating, content);
            if (isAdded) {
                session.setAttribute("notification", "Feedback add successfully! ");
            }else{
                session.setAttribute("notificationErr", "Feedback add Failed! ");
                
            }
            response.sendRedirect("product?pId="+pId);
        }
    }

}
