/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.HTMLElements.Html;
import controller.auth.EmailServices;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ApproveRefundServletJQuery", urlPatterns = {"/refund-approving"})
public class ApproveRefundServletJQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderDetailId = request.getParameter("orderdetailid");
        Order order = new OrderDAO().getById(request.getParameter("oid"));
        System.out.println(order.getCusEmail());
        if (EmailServices.sendRefundUpdate(order, 1, "")) {
            new OrderDetailDAO().actionRefund(orderDetailId, 1, "");
            StringBuilder html = new StringBuilder();
            html.append("<br><button disabled type=\"button\" class=\"btn mb-3 btn-primary\"><i class=\"ri-check-line\"></i>Approved</button>");
            response.getWriter().print(html.toString());
        } else {
            System.out.println("Sent fail");
        }
    }

}
