/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Base64;
import model.Order;

/**
 *
 * @author ACER
 */
@WebServlet(name="ViewOrderServlet", urlPatterns={"/order"})
public class ViewOrderServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String oid = request.getParameter("oid");
        byte[] bytes = Base64.getDecoder().decode(oid);
        String oid_decode = new String(bytes);
        Order order = new OrderDAO().getById(oid_decode);
        if (order == null) {
            response.sendError(404);
            return;
        }
        request.setAttribute("order", order);
        request.getRequestDispatcher("client/view-order.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
