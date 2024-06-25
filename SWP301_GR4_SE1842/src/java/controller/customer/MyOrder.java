package controller.customer;

import dal.UserDAO;
import dal.OrderDAO;
import java.util.stream.Collectors;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class MyOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
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
            OrderDAO orderDAO = new OrderDAO();
            List<Order> orders = new ArrayList<>();

            orders = orderDAO.getOrderUser(u.getId());
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("view/myorders.jsp").forward(request, response);
            return;
        } catch (ParseException ex) {
            Logger.getLogger(MyOrder.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
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
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String orderDateString = request.getParameter("orderDate");
            String deliverDateString = request.getParameter("deleverDate");
            int status = Integer.parseInt(request.getParameter("status"));
            Date orderDate = format.parse(orderDateString);
            Date deliverDate = format.parse(deliverDateString);

            OrderDAO orderDAO = new OrderDAO();
            List<Order> orders = orderDAO.getOrderUser(u.getId());
            List<Order> filterOrders = orders.stream().filter(order -> {
                return !order.getOrderDate().before(orderDate) && order.getDeliverDate().before(deliverDate);
            }).collect(Collectors.toList());

            if (status != 0) {
                filterOrders = filterOrders.stream().filter(order -> {
                    return order.getStatusId() == status;
                }).collect(Collectors.toList());
            }

            request.setAttribute("orders", filterOrders);
            request.setAttribute("selectStatus", status);
            request.setAttribute("orderDate", orderDateString);
            request.setAttribute("deliverDate", deliverDateString);
            request.getRequestDispatcher("view/myorders.jsp").forward(request, response);
            response.getWriter().println(orderDateString);
            return;
        } catch (ParseException ex) {
            Logger.getLogger(MyOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("../view/home");

    }
}
