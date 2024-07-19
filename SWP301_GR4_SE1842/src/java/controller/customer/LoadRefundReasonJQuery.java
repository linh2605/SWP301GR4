/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

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
@WebServlet(name="LoadRefundReasonJQuery", urlPatterns={"/LoadRefundReason"})
public class LoadRefundReasonJQuery extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String odid = request.getParameter("orderid");
        RefundBook rb = new OrderDetailDAO().getRefundById(odid);
        StringBuilder html = new StringBuilder();
        
        html.append("<div style=\"width: 100%\">");
        html.append("<textarea id=\"reasonRefundTA-edit\" style=\"width:100%;\" placeholder=\"Reason\">");
        html.append(rb.getReason());
        html.append("</textarea>");
        html.append("<span class=\"form-message\"></span>");
        html.append("</div>");
        html.append("<div class=\"col-12 profile-image__container\">");
        html.append("<div class=\"profile-image__buttons\">");
        html.append("<label for=\"imageUpload-editrefund\" class=\"button\">");
        html.append("<i class=\"fa-solid fa-upload\"></i>");
        html.append("</label></div>");
        html.append("<div>");
        html.append("<img id=\"preview-image-editrefund\" \n" + "src=\"");
        html.append(rb.getImage());
        html.append("\"\n" + " alt=\"Defect image\" >");
        html.append("</div>");
        html.append("<input type=\"file\" name=\"image\" id=\"imageUpload-editrefund\" style=\"display:none;\"></div>");
        html.append("<input value=\"");
        html.append(rb.getImage());
        html.append("\" name=\"imageBase64-editrefund\" id=\"imageBase64-editrefund\" hidden></div> ");
        
        response.getWriter().print(html.toString());
    }

}
