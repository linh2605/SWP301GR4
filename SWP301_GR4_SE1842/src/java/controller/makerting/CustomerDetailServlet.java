/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.makerting;

<<<<<<<< HEAD:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerListServlet.java
========
package controller.makerting;

import controller.auth.Encode;
>>>>>>>> origin/thinhkc:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerDetailServlet.java
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<<< HEAD:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerListServlet.java
import java.util.List;
========
>>>>>>>> origin/thinhkc:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerDetailServlet.java
import model.User;

/**
 *
 * @author zzako
 */
<<<<<<<< HEAD:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerListServlet.java
public class CustomerListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
========
public class CustomerDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
>>>>>>>> origin/thinhkc:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerDetailServlet.java
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
<<<<<<<< HEAD:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerListServlet.java
            out.println("<title>Servlet CustomerListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerListServlet at " + request.getContextPath() + "</h1>");
========
            out.println("<title>Servlet CustomerDetailSerlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerDetailSerlet at " + request.getContextPath () + "</h1>");
>>>>>>>> origin/thinhkc:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerDetailServlet.java
            out.println("</body>");
            out.println("</html>");
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
<<<<<<<< HEAD:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerListServlet.java
            throws ServletException, IOException {          
        UserDAO udao = new UserDAO();
        List<User> userlist = udao.getAllUsers();
        request.setAttribute("listUser", userlist);
        List<User> listfilter = udao.getAllUsersSortedByName();
        request.setAttribute("listfilter", listfilter);     
        request.getRequestDispatcher("view/CustomerList.jsp").forward(request, response);
    }
========
    throws ServletException, IOException {
        String idraw = request.getParameter("id");
        int id = Integer.parseInt(idraw);        
        UserDAO udao = new UserDAO();     
        User user = udao.GetUserById(id);
        request.setAttribute("user", user); 
        request.getRequestDispatcher("view/CustomerDetail.jsp").forward(request, response);
    } 
>>>>>>>> origin/thinhkc:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerDetailServlet.java

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
<<<<<<<< HEAD:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerListServlet.java
            throws ServletException, IOException {
        
========
    throws ServletException, IOException {
        String idraw = request.getParameter("id");
        int id = Integer.parseInt(idraw);
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");        
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        
        pass = Encode.toSHA1(pass);
        UserDAO udao = new UserDAO();
        request.getRequestDispatcher("view/CustomerDetail.jsp").forward(request, response);
>>>>>>>> origin/thinhkc:SWP301_GR4_SE1842/src/java/controller/makerting/CustomerDetailServlet.java
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
