/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.customer;

import dal.CategoryDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class Header {
    public static void Load(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("listC", new CategoryDAO().getAll());
    }
}
