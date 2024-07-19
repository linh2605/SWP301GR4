package controller.auth;

import dal.UserDao;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/reset-password")
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("verifyStatus") != null && (int) req.getSession().getAttribute("verifyStatus") == 1) {
            req.getRequestDispatcher("auth/newPassword.jsp").forward(req, resp);
            return;
        }
        req.getRequestDispatcher("auth/forgotPassword.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        User user = new UserDao().getByEmail(email);
        if (user == null) {
            request.setAttribute("err", "This email has not been registered in the system.");
            request.setAttribute("emailInputted", email);
            request.getRequestDispatcher("auth/forgotPassword.jsp").forward(request, response);
            return;
        }
        String OTP = EmailServices.sendOTPResetPassword(user);
        if (OTP != null) {
            HttpSession session = request.getSession();
            session.setAttribute("otp", OTP);
            session.setAttribute("user-resetpassword", user);
            session.setAttribute("expireTime", System.currentTimeMillis() + 600000);
            session.setAttribute("action", "forgot-password");
            request.getRequestDispatcher("auth/EnterOtp.jsp").forward(request, response);
        }

    }

}
