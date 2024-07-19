/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.RefundBook;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "LoadOrderDetailJQuery", urlPatterns = {"/LoadOrderDetailJQuery"})
public class LoadOrderDetailJQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out;
        try {
            out = response.getWriter();
            String orderid = request.getParameter("orderid");
            Order order = new OrderDAO().getById(orderid);
            boolean isUnavailable = false;
            long cntDays = 0;
            System.out.println(order);
            if (order.getDeliverDate() == null) {
                isUnavailable = true;
            } else {
                cntDays = calculateDaysBetween(order.getDeliverDate(), new Date());
            }
            if (cntDays > 7) {
                isUnavailable = true;
            }
            List<OrderDetail> odList = new OrderDetailDAO().getByOrder(orderid);
            StringBuilder html = new StringBuilder();
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("usersession");
            int i = 1;
            for (OrderDetail od : odList) {
                html.append("<tr role=\"row\" class=\"odd\">");
                html.append("<td>").append(i).append("</td>");
                html.append("<td><img class=\"img-fluid rounded\" src=\"").append(od.getBook().getiList().get(0).getImage()).append("?ran=" + Math.random() + "\" alt=\"\"></td>");
                html.append("<td>").append(od.getBook().getTitle()).append("</td>");
                html.append("<td>").append(od.getQuantity()).append("</td>");
                html.append("<td>").append(od.getPrice()).append("</td>");
                if (u == null || u.getRoleID() == 4) {
                    html.append("<td>");
                    if (order.getStatus().getId().equals("3")) {
                        if (!od.isRefund()) {
                            if (!isUnavailable) {
                                html.append("<div id=\"refund__btn\" data-toggle=\"modal\" data-target=\"#refundConfirmation\">\n"
                                        + "            <p onclick=\"loadOrderDetailId(" + od.getId() + ")\">               Refund      </p>      \n"
                                        + "                           </div>");
                            }

                            html.append("<br><a href=\"detail?bid=" + od.getBook().getId() + "\">Review</a>");
                        } else {
                            RefundBook refund = new OrderDetailDAO().getRefundById(od.getId());
                            if (refund.getRefundStatus() == 0) {
                                html.append("You sent a request to refund this order! Please wait for being contacted!<br>");
                                html.append("<div  id=\"refund__btn\" data-toggle=\"modal\" data-target=\"#refundEdit\">");
                                html.append("<p onclick=\"loadRefundReason(" + od.getId() + ")\">               Edit      </p>");
                                html.append("</div>");
                            } else if (refund.getRefundStatus() == 1) {
                                html.append("Your refund request was <span style=\"color:green\">APPROVED</span>! Check your email for more information!");
                            } else if (refund.getRefundStatus() == -1) {
                                html.append("Your refund request was <span style=\"color:tomato\">DECLINED</span>! Check your email for more information!");
                                if (!isUnavailable) {
                                    html.append("<div id=\"refund__btn\" data-toggle=\"modal\" data-target=\"#refundConfirmation\">\n"
                                            + "            <p onclick=\"loadOrderDetailId(" + od.getId() + ")\">               Refund again      </p>      \n"
                                            + "                           </div>");
                                }

                                html.append("<br><a href=\"#\">Review</a>");
                            }
                        }
                    }
                    html.append("</td>");
                }
                html.append("</tr>");
                i++;
            }

            String htmlContent = html.toString();
            String encodedOrderId = Base64.getEncoder().encodeToString(order.getId().getBytes());

            String data = String.format("%s", htmlContent, encodedOrderId);
            
            out.print(data);
        } catch (IOException ex) {
            Logger.getLogger(LoadOrderDetailJQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private long calculateDaysBetween(Date startDate, Date endDate) {
        long millisecondsInADay = 24 * 60 * 60 * 1000;
        long daysBetween = (endDate.getTime() - startDate.getTime()) / millisecondsInADay;
        return daysBetween;
    }

}
