/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Vnpay;

import Vnpay.PayModel;
import Vnpay.PayService;
import controller.auth.EmailServices;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Order;

/**
 *
 * @author ADMIN-PC
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("ordersession");
        String grandTotalStr = request.getParameter("total");
        Long grandTotal = Long.parseLong(grandTotalStr);
        PayModel payModel = new PayModel();
        payModel.setVnp_Ammount(grandTotal * 2500000);
        payModel.vnp_OrderInfo = "Thanh toán đơn hàng";
        payModel.vnp_OrderType = "topup";
        payModel.vnp_TxnRef = System.currentTimeMillis();
        PayService payService = new PayService();
        String paymentUrl = payService.payWithVNPAY(payModel, request);
        request.getSession().removeAttribute("cart");
                String host = context.Config.host;
        String link = host + request.getContextPath() + "/order?oid=" + Base64.getEncoder().encodeToString(order.getId().getBytes());
        EmailServices.send(order.getCusEmail(), "Detail for your order in RonaldoSportShop (BaH" + order.getId() + ")",
                String.format("Dear %s,\n"
                        + "<br>"
                        + "Thank you so much for placing an order on %s! We appreciate your business.<br>"
                        + "<br>"
                        + "We're currently processing your order and will send a confirmation email with all the details shortly. "
                        + "<br>In the meantime, your order information is <a href=\"%s\">HERE</a> - feel free to reference this in any communication with us about your order.<br>"
                        + "<br>"
                        + "If you have any questions or need to make any changes to your order.<br>"
                        + "<br>"
                        + "Thanks again for shopping with us. We strive to make your experience a great one and look forward to getting your new book(s) out to you soon!<br>"
                        + "<br>"
                        + "Sincerely,\n"
                        + "%s", order.getCusFullname(), "RonaldoSportShop", link, "RonaldoSportShop"));
        response.sendRedirect(paymentUrl);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
