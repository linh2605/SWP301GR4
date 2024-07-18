/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RefundBook;

/**
 *
 * @author ACER
 */
@WebServlet(name="LoadRefundDetailJQuery", urlPatterns={"/refund-detail"})
public class LoadRefundDetailJQuery extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String orderdetailid = request.getParameter("orderdetailid");
        RefundBook rb = new OrderDetailDAO().getRefundById(orderdetailid);
        
        StringBuilder html = new StringBuilder();
        html.append("<h5>Reason:</h5>");
        html.append("<p>").append(rb.getReason()).append("</p>");
        html.append("<br><h5>Image: </h5>");
        html.append("<div style=\"width:100%;overflow-x:auto\">");
        html.append("<img id=\"image-refund__img\" src=\"").append(rb.getImage()).append("\" >");
        html.append("</div>");
        html.append("");
        
        
        PrintWriter out = response.getWriter();
        out.print(html.toString());
        
        
    }

}
