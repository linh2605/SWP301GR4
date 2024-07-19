/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin;

import dal.OrderDetailDAO;
import dal.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class Header {

    public static void Load(HttpServletRequest request, HttpServletResponse response) {
        if (new UserDao().getUserRefunding() != null) {
            request.setAttribute("notiCount", new UserDao().getUserRefunding().size());
        }
        request.setAttribute("usersRefunding", new UserDao().getUserRefunding());

    }

}
