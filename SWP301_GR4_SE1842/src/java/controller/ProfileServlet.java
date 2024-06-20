/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.auth.Encode;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("Action");
        switch (action) {
            case "ChangePass":
                ChangePass(request, response);
                break;
            case "UpdateProfile":
                UpdateProfile(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void ChangePass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPass = request.getParameter("OldPassword");
        String newPass = request.getParameter("NewPassword");
        
        User u = (User) request.getSession().getAttribute("usersession");
        int uId = u.getId();
        
        String oldPassHash = oldPass; //Encode.toSHA1(oldPass);
        String newPassHash = newPass; //Encode.toSHA1(newPass);
        
        UserDAO udao = new UserDAO();
        String mess = udao.ChangePassword(uId, newPassHash, oldPassHash) ? "Change password successfully" : "Incorrect, Fail to change password, please check your old pass";
        
        response.getWriter().write(mess);
    }

    private void UpdateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = ((User) request.getSession().getAttribute("usersession")).getId();
        String userName = request.getParameter("userName");
        String userGender = request.getParameter("userGender");
        String userPhone = request.getParameter("userPhone");
        String userAddress = request.getParameter("userAddress");
        
        User uUpdate = new User(userId, userName, userGender, userPhone, userAddress);
        UserDAO udao = new UserDAO();
        
        boolean isSuccess = udao.UpdateProfile(uUpdate);
        String mess = isSuccess ? "Update profile successfully" : "Incorrect, Fail to update profile";
        response.getWriter().write(mess);
    }
}
