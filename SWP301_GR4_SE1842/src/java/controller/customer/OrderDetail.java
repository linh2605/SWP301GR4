package controller.customer;

import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderID"));
            OrderDAO orderDAO = new OrderDAO();
            User u = (User) request.getSession().getAttribute("usersession");
            if (u == null) {
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
            if (u == null) {
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
