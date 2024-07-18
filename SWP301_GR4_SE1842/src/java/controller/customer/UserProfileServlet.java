package controller.customer;

import controller.auth.Encode;
import dal.OrderDAO;
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
 * Servlet implementation class UserProfileServlet
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/my-account"})
public class UserProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("usersession");
        if (u == null) {
            response.sendRedirect("auth/login");
            return;
        }
        request.setAttribute("oList", new OrderDAO().getOrdersOfACustomer(u.getId()));
        request.getRequestDispatcher("client/user_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("usersession");
        if (u == null) {
            response.sendRedirect("auth/login");
            return;
        }
        
        request.setAttribute("oList", new OrderDAO().getOrdersOfACustomer(u.getId()));
        request.setAttribute("duplicateEmail", "false");

        String avatar = request.getParameter("imageBase64");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String crpass = request.getParameter("crpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");

        if (new UserDao().getByEmail(email) != null) {
            if (new UserDao().getByEmail(email).getId() != u.getId()) {
                request.setAttribute("errmsgemail", email + " already links to another account!");
                request.getRequestDispatcher("client/user_profile.jsp").forward(request, response);
                return;
            }
        }
//         if (!Encode.toSHA1(crpass).equals(u.getPassword())) {
//            request.setAttribute("errmsgpass", "Your password is incorrect!");
//            request.getRequestDispatcher("client/user_profile.jsp").forward(request, response);
//            return;
//        }
        

        u.setAvatar(avatar);
        u.setFullName(fullname);
        u.setPhone(phone);
        u.setAddress(address);
        u.setEmail(email);
        u.setGender(gender);

        if (newpass != null && !newpass.trim().isEmpty()) {
            if (repass != null && !repass.trim().isEmpty()) {
                String encodedNewpass = Encode.toSHA1(newpass.trim());
                String encodedRepass = Encode.toSHA1(repass.trim());
                if (!encodedNewpass.equals(encodedRepass)) {
                    request.setAttribute("errmsgpass", "New password and re-entered password do not match!");
                    request.getRequestDispatcher("client/user_profile.jsp").forward(request, response);
                    return;
                }
                u.setPassword(encodedNewpass);
            } else {
                request.setAttribute("errmsgpass", "Please re-enter the new password.");
                request.getRequestDispatcher("client/user_profile.jsp").forward(request, response);
                return;
            }
        }

        if (new UserDao().update(u)) {
            request.setAttribute("successmsg", "Update successfully");
        } else {
            request.setAttribute("errmsg", "Update failed");
        }
        
        request.getRequestDispatcher("client/user_profile.jsp").forward(request, response);
    }
}
