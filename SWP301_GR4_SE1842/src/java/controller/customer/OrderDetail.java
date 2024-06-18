/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author Admin
 */
public class OrderDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderID"));
            OrderDAO orderDAO = new OrderDAO();
            User u = (User) request.getSession().getAttribute("usersession");
            if(u == null){
               response.sendRedirect("view/home.jsp");
               return;
            }
            if (u.getRoleID() != 4) {
                request.setAttribute("errmsg", "Please try with role customter!");
                request.getRequestDispatcher("login-register.jsp").forward(request, response);
                return;
            }
            List<OrderItem> orderDetails = new ArrayList<>();
            orderDetails = orderDAO.getOrderDetail(orderId);
            Order order = orderDAO.getOrderByID(orderId);
            request.setAttribute("orderItems", orderDetails);
            request.setAttribute("order", order);
            request.getRequestDispatcher("view/orderDetail.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderID"));
            OrderDAO orderDAO = new OrderDAO();
            User u = (User) request.getSession().getAttribute("usersession");
            if(u == null){
               response.sendRedirect("view/home.jsp");
               return;
            }
            if (u.getRoleID() != 4) {
                request.setAttribute("errmsg", "Please try with role customter!");
                request.getRequestDispatcher("login-register.jsp").forward(request, response);
                return;
            }
            orderDAO.CancelOrder(orderId);
            List<OrderItem> orderDetails = new ArrayList<>();
            orderDetails = orderDAO.getOrderDetail(orderId);
            Order order = orderDAO.getOrderByID(orderId);
            request.setAttribute("orderItems", orderDetails);
            request.setAttribute("order", order);
            request.getRequestDispatcher("view/orderDetail.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
