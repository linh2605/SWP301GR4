/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.BookDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.UserDao;
import dal.WishListDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name="DashboardServlet", urlPatterns={"/dashboard"})
public class DashboardServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            response.sendError(404);
            return;
        }
        
        Header.Load(request, response);
        request.setAttribute("currentmenu", "Management");
        request.setAttribute("currentpage", "Dashboard");
        
        UserDao ud = new UserDao();
        BookDAO bd = new BookDAO();
        OrderDetailDAO odd = new OrderDetailDAO();
        OrderDAO od = new OrderDAO();
        
        request.setAttribute("usercnt", ud.Count());
        request.setAttribute("bookcnt", bd.Count());
        request.setAttribute("salecnt", bd.NumberOfSaledBook());
        request.setAttribute("ordercnt", od.Count());
        request.setAttribute("oList", new OrderDAO().getAll());
        request.setAttribute("wList", new WishListDAO().listMostWishedFor());
        request.setAttribute("income", od.getIncome());
        request.setAttribute("lost", od.getLost());
        
        
        
        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
    }

}
