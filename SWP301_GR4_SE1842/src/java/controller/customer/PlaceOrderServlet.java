/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import context.Config;
import controller.auth.EmailServices;
import controller.auth.Encode;
import dal.BookDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.PayMethodDAO;
import dal.UserCartDAO;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.PayMethod;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "PlaceOrderServlet", urlPatterns = {"/place-an-order"})
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO od = new OrderDAO();
        OrderDetailDAO odd = new OrderDetailDAO();

        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String paymethodid = request.getParameter("paymethodid");

        String createAccount = request.getParameter("createAccount");

        User user = (User) request.getSession().getAttribute("usersession");
        Order order = new Order();
        order.setCusFullname(fullname);
        order.setOrderDate(new java.sql.Date(new java.util.Date().getTime()));
        order.setPhone(phone);
        order.setCusEmail(email);
        order.setAddress(address);
        order.setPaymethod(new PayMethodDAO().getById(paymethodid));
        List<CartItem> cList = new ArrayList<>();
        if (user == null) {
            if (createAccount != null && createAccount.equals("on")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                User checkEmail = new UserDao().getByEmail(email);
                User checkUsername = new UserDao().getByUsername(username);

                request.setAttribute("pmList", new PayMethodDAO().getPaymethods());
                if (checkEmail != null && checkUsername != null) {
                    request.setAttribute("lastFullname", fullname);
                    request.setAttribute("lastPhone", phone);
                    request.setAttribute("lastAddress", address);
                    request.setAttribute("lastEmail", email);
                    request.setAttribute("lastUsername", username);

                    request.setAttribute("displayBlock", "display:block");
                    request.setAttribute("CrAccChecked", "checked");
                    request.setAttribute("usernameExistErr", "Username already exists!");
                    request.setAttribute("emailExistErr", "This email is linked to another account!");
                    request.getRequestDispatcher("client/checkout.jsp").forward(request, response);
                    return;
                }
                if (checkEmail != null) {
                    request.setAttribute("lastFullname", fullname);
                    request.setAttribute("lastPhone", phone);
                    request.setAttribute("lastAddress", address);
                    request.setAttribute("lastEmail", email);
                    request.setAttribute("lastUsername", username);
                    request.setAttribute("displayBlock", "display:block");
                    request.setAttribute("CrAccChecked", "checked");
                    request.setAttribute("emailExistErr", "This email is linked to another account!");
                    request.getRequestDispatcher("client/checkout.jsp").forward(request, response);
                    return;
                }
                if (checkUsername != null) {
                    request.setAttribute("lastFullname", fullname);
                    request.setAttribute("lastPhone", phone);
                    request.setAttribute("lastAddress", address);
                    request.setAttribute("lastEmail", email);
                    request.setAttribute("lastUsername", username);
                    request.setAttribute("displayBlock", "display:block");
                    request.setAttribute("CrAccChecked", "checked");
                    request.setAttribute("usernameExistErr", "Username already exists!");
                    request.getRequestDispatcher("client/checkout.jsp").forward(request, response);
                    return;
                }
                User newUser = new User();
                newUser.setUsername(username);
                newUser.setPassword(Encode.toSHA1(password));
                newUser.setFullName(fullname);
                newUser.setPhone(phone);
                newUser.setEmail(email);
                newUser.setAddress(address);
                newUser.setGender("Other");
                newUser.setAvatar("assets/profile.png");
                new UserDao().createUser(newUser);
                newUser = new UserDao().getById(new UserDao().maxId());
                request.getSession().setAttribute("usersession", newUser);
                order.setUser(newUser);
            }
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            order.setTotalPrice(Float.valueOf(String.format("%.2f", cart.getTotalWithDiscount())));
            cList = cart.getItems();
        } else {
            order.setUser(user);
            order.setTotalPrice(Float.valueOf(user.getTotalPriceInCart()));
            cList = user.getCarts();
            new UserCartDAO().clearCart(user.getId() + "");
            user.setCarts(new UserCartDAO().getCarts(user.getId() + ""));
            if (user.getAddress() == null || user.getAddress().isEmpty()) {
                user.setAddress(address);
            }
            if (user.getPhone() == null || user.getPhone().isEmpty()) {
                user.setPhone(phone);
            }
            if (user.getFullName() == null || user.getFullName().isEmpty()) {
                user.setFullName(fullname);
            }
            new UserDao().update(user);
            request.getSession().setAttribute("usersession", user);
        }
        od.placeOrder(order);
        order.setId(od.maxID() + "");
        OrderDetail ode = null;
        for (CartItem item : cList) {
            ode = new OrderDetail();
            ode.setBook(item.getBook());
            ode.setQuantity(item.getQuantity());
            ode.setOrder(order);
            odd.add(ode);
            new BookDAO().updateStock(item.getBook().getId(), item.getBook().getStock() - item.getQuantity());
        }
        if (Integer.parseInt(paymethodid) == 2) {
            float totalPrice = order.getTotalPrice();
            long grandTotal = Math.round(totalPrice);
            HttpSession session = request.getSession();
            session.setAttribute("ordersession", order);
            response.sendRedirect("PaymentServlet?total=" + grandTotal);
            return;
        }
        String host = Config.host;
        String link = host + request.getContextPath() + "/order?oid=" + Base64.getEncoder().encodeToString(order.getId().getBytes());
        EmailServices.send(order.getCusEmail(), "Detail for your order in RonaldoSportShop (BaH" + order.getId() + ")",
                String.format("Dear %s,\n"
                        + "<br>"
                        + "Thank you so much for placing an order on %s! We appreciate your business.<br>"
                        + "<br>"
                        + "We're currently processing your order and will send a confirmation email with all the details shortly. "
                        + "<br>In the meantime, your order information is <a href=\"my-account#account-info\">HERE</a> - feel free to reference this in any communication with us about your order.<br>"
                        + "<br>"
                        + "If you have any questions or need to make any changes to your order.<br>"
                        + "<br>"
                        + "Thanks again for shopping with us. We strive to make your experience a great one and look forward to getting your new product(s) out to you soon!<br>"
                        + "<br>"
                        + "Sincerely,\n"
                        + "%s", order.getCusFullname(), "RonaldoSportShop", link, "RonaldoSportShop"));
        request.setAttribute("order", order);
        request.setAttribute("od", ode);
        request.getSession().removeAttribute("cart");
        request.getRequestDispatcher("client/checkout_complete.jsp").forward(request, response);

    }

}
