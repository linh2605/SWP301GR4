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
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name="DeclineRefundServlet", urlPatterns={"/DeclineRefund"})
public class DeclineRefundServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String odid = request.getParameter("odid");
        String oid = request.getParameter("oid");
        String reason = request.getParameter("reasonDecline");
        System.out.println(new OrderDAO().getById(oid).getCusEmail());
        if (EmailServices.sendRefundUpdate(new OrderDAO().getById(oid), -1, reason)) {
            new OrderDetailDAO().actionRefund(odid, -1, reason);
        }
        response.sendRedirect("refunds?o=" + oid);
    }

}
