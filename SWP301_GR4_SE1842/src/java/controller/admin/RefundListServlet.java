/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name="RefundListServlet", urlPatterns={"/refunds"})
public class RefundListServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4|| us.getRoleID() == 3) {
            response.sendError(404);
            return;
        }
        
        Header.Load(request, response);
        request.setAttribute("currentmenu", "User");
        request.setAttribute("currentpage", "All refund products");
        
        
        String orderid = request.getParameter("o");
        if (orderid != null) {
            request.setAttribute("order", new OrderDAO().getById(orderid));
            request.setAttribute("refunds", new OrderDetailDAO().getRefundsByOrderId(orderid));
            request.getRequestDispatcher("admin/refund_details.jsp").forward(request, response);
            return;
        }
        
        request.setAttribute("rList", new OrderDAO().getOrderThatHasRefundBook());
        request.getRequestDispatcher("admin/refund_list.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
    }

}
