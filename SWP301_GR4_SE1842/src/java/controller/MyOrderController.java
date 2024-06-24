/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.OrderStatus;
import model.Orders;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MyOrderController", urlPatterns = {"/view/my-order"})
public class MyOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("usersession");
        if (currentUser != null) {
            String pageParam = request.getParameter("page");
            String statusParam = request.getParameter("status");

            int page = 1; // Default to the first page
            int pageSize = 6; // Set the desired page size
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }
            Integer status = (statusParam != null && !statusParam.isEmpty()) ? Integer.valueOf(statusParam) : null;
            List<OrderStatus> listStatus = orderDAO.getAllOrderStatus();
            List<Orders> orders = orderDAO.getAllOrderForUser(currentUser.getId(), status);
            List<Orders> pagingOrder = orderDAO.Paging(orders, page, pageSize);
            System.out.println(pagingOrder.size());
            request.setAttribute("order", pagingOrder);
            request.setAttribute("statusList", listStatus);
            request.setAttribute("totalPages", orders.size() % pageSize == 0 ? (orders.size() / pageSize) : (orders.size() / pageSize + 1));
            request.setAttribute("currentPage", page);
            request.setAttribute("statusParam", statusParam);
            request.getRequestDispatcher("my-order.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
