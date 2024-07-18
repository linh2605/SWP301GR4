/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.BookDAO;
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
import model.Book;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddCart", urlPatterns = {"/AddCart"})
public class AddCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String service = request.getParameter("service");
            User user = (User) session.getAttribute("usersession");
            boolean userLogined = false;
            if (user != null) {
                userLogined = true;
            }
            if (service == null) {
                service = "display";
            }

            if (service.equals("display")) {
                int numOfBooksInCart = 0;
                float totalPrice = 0;
                List<CartItem> cList = null;
                int id = Integer.parseInt(request.getParameter("id"));
                int quantity = 1;
                BookDAO bd = new BookDAO();
                Book b = bd.getById(id);
                if (b.getStatus() == 0) {
                    return;
                }
                CartItem item = new CartItem(b, quantity);
                if (!userLogined) {
                    Cart cart = new Cart(new ArrayList<CartItem>(), 0);
                    if (session.getAttribute("cart") != null) {
                        cart = (Cart) session.getAttribute("cart");
                    }

                    cList = cart.getItems();
                    cart.addItem(item);
                    totalPrice = cart.getTotalWithDiscount();
                    numOfBooksInCart = cart.getQuantity();
                    session.setAttribute("cart", cart);
                } else {
                    System.out.println("UserLogined");
                    new UserCartDAO().addCart(user.getId() + "", b.getId() + "", quantity, b.getFinalCost()*quantity);
                    user.setCarts(new UserCartDAO().getCarts(user.getId() + ""));
                    session.setAttribute("usersession", user);
                    cList = user.getCarts();
                    totalPrice = Float.valueOf(user.getTotalPriceInCart());
                    numOfBooksInCart = user.getBookQuantityInCart();
                }

                StringBuilder html = new StringBuilder();
                html.append("<div class=\"cart-total\">");

                if (numOfBooksInCart != 0) {
                    html.append("<span class=\"text-number\">");
                    html.append(numOfBooksInCart);
                    html.append("</span>");
                }

                html.append("<span class=\"text-item\"> Shopping Cart\n"
                        + "                                </span>");
                html.append(" <span class=\"price\">");
                html.append("$").append(String.format("%.2f", totalPrice));
                html.append("<i class=\"fas fa-chevron-down\"></i> </span> </div>");
                html.append("<div class=\"cart-dropdown-block\" >");
                html.append(" <div style=\"height: 20rem ;overflow-y: auto\">");
                for (CartItem c : cList) {
                    html.append("<div class=\" single-cart-block \">");
                    html.append("<div class=\"cart-product\">");
                    html.append("<a href=\"detail?bid=").append(c.getBook().getId()).append("\" class=\"image\">");
                    html.append(" <img src=\"").append(c.getBook().getiList().get(0).getImage()).append("\">");
                    html.append("</a>");
                    html.append("<div class=\"content\">\n");
                    html.append("<h3 class=\"title\">");
                    html.append("<a href=\"detail?bid=")
                            .append(c.getBook().getId())
                            .append("\">")
                            .append(c.getBook().getTitle())
                            .append("</a></h3>");
                    html.append("<p class=\"price\">");
                    html.append("<span class=\"qty\">")
                            .append(c.getQuantity())
                            .append(" book(s)</span> $ ")
                            .append(String.format("%.2f", (c.getQuantity() * c.getBook().getFinalCost())))
                            .append("</p>");
                    html.append("</div>\n"
                            + "</div>\n"
                            + "</div>");
                }

                html.append("<div class=\" single-cart-block \">\n"
                        + "<div class=\"btn-block\">\n"
                        + "<a href=\"viewCart\" class=\"btn\">View Cart <i class=\"fas fa-chevron-right\"></i></a>\n"
                        + "<a href=\"checkOut\" class=\"btn btn--primary\">Check Out <i class=\"fas fa-chevron-right\"></i></a>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
                out.print(html.toString());
            }

            if (service.equals("del")) {
                int id = Integer.valueOf(request.getParameter("id"));
                if (user == null) {
                    Cart c = (Cart) session.getAttribute("cart");
                    c.removeItem(id);
                } else {
                    new UserCartDAO().deleteCart(id + "", user.getId() + "");
                    user.setCarts(new UserCartDAO().getCarts(user.getId() + ""));
                    session.setAttribute("usersession", user);
                }
                response.sendRedirect("viewCart");
            }
            if (service.equals("add")) {
                int id = Integer.valueOf(request.getParameter("id"));
                int quantity = Integer.valueOf(request.getParameter("quantity"));
                Book book = new BookDAO().getById(id);
                if (user == null) {
                    Cart c = (Cart) session.getAttribute("cart");
                    if (quantity <= book.getStock() && quantity > 0) {
                        c.changeQuantity(id, quantity);
                    } else if (quantity > book.getStock()) {
                        c.changeQuantity(id, book.getStock());
                    }
                } else {
                    System.out.println(quantity + " |  " + user.getId() + " | \n" + id);
                    if (quantity <= book.getStock() && quantity >= 0) {
                        if (quantity == 0) {
                            new UserCartDAO().deleteCart(id + "", user.getId() + "");
                        } else {
                            new UserCartDAO().updateCart(user.getId() + "", id + "", quantity);
                        }
                        user.setCarts(new UserCartDAO().getCarts(user.getId() + ""));
                        session.setAttribute("usersession", user);
                    } else if (quantity > book.getStock()) {
                        if (quantity == 0) {
                            new UserCartDAO().deleteCart(id + "", user.getId() + "");
                        } else {
                            new UserCartDAO().updateCart(user.getId() + "", id + "", book.getStock());
                        }
                        user.setCarts(new UserCartDAO().getCarts(user.getId() + ""));
                        session.setAttribute("usersession", user);
                    }
                }
                response.sendRedirect("viewCart");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
