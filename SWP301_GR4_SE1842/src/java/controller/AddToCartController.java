/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.UserCartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.User;
import model.UserCart;

/**
 *
 * @author auiri
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/view/AddToCartController"})
public class AddToCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usersession");
        if (user == null) {
            response.sendRedirect("../auth/login");
            return;
        }
        String isRemove = request.getParameter("isRemove");
        if (isRemove != null) {
            String index = request.getParameter("index");
            List<UserCart> carts = (ArrayList<UserCart>) session.getAttribute("carts");
            carts.remove(Integer.parseInt(index));
            session.setAttribute("carts", carts);
        } else {
            String pId = request.getParameter("pId");
            List<UserCart> carts = (ArrayList<UserCart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new ArrayList<UserCart>();
            }
            boolean isCartExist = false;
            if (pId != null) {
                Product p = new ProductDAO().getProductById(Integer.parseInt(pId));
                UserCart cart = new UserCart(0, user, p, 1);
                if (carts != null && carts.size() > 0) {
                    for (UserCart c : carts) {
                        if (c.getProduct().equals(p)) {
                            c.setQuantity(c.getQuantity() + 1);
                            isCartExist = true;
                        }
                    }
                }
                if (!isCartExist) {
                    carts.add(cart);
                }
                session.setAttribute("carts", carts);
            }
        }

        List<UserCart> carts = (ArrayList<UserCart>) session.getAttribute("carts");
        new UserCartDAO().updateCart(user.getId() + "", carts);
        
        response.sendRedirect("/products");
    }

}
