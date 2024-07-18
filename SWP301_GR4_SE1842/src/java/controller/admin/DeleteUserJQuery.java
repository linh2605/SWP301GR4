/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.UserDao;
import java.io.IOException;
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
@WebServlet(name="DeleteUserJQuery", urlPatterns={"/delete-user"})
public class DeleteUserJQuery extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            
            return;
        }
        UserDao ud = new UserDao();
        String uid = request.getParameter("uid");
        
        ud.deleteWishlist(Integer.valueOf(uid));
        ud.deleteRefund(Integer.valueOf(uid));
        ud.deleteOderDetail(Integer.valueOf(uid));
        ud.deleteOrder(Integer.valueOf(uid));
        ud.deleteFeedback(Integer.valueOf(uid));
        ud.deleteCart(Integer.valueOf(uid));
        
        new UserDao().delete(Integer.valueOf(uid));
        
    }

}
