/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

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
import model.User;

/**
 *
 * @author Admin
 */
public class MyOrder extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            User u = (User) request.getSession().getAttribute("usersession");
            if(u.getRoleID() != 4){
                request.setAttribute("errmsg", "Please try with role customter!");
                request.getRequestDispatcher("login-register.jsp").forward(request, response);
                return;
            }
            UserDAO userDAO = new UserDAO();
            List<Order> orders = new ArrayList<>();
            orders = userDAO.getOrderUser(u.getId());
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("CustomerList.jsp").forward(request, response);
            return;
        } catch (ParseException ex) {
            Logger.getLogger(MyOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("../view/home");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
