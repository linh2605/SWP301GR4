package controller.managerUser;

import dal.RoleDAO;
import dal.UserDAO;
import extensions.EmailSenderResetPassword;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.List;
import model.Role;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserDetailController", urlPatterns = {"/admin/userDetail"})
public class UserDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDAO userDAO = new UserDAO();
        User user = userDAO.GetUserById(userId);
        List<Role> roles = new RoleDAO().getAllRoles(); // Assuming UserDAO has this method to get all roles

        request.setAttribute("user", user);
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("userDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();

        if ("add".equals(action)) {
            // Handle adding new user
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String fullName = request.getParameter("fullName");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String avatar = request.getParameter("avatar");

            String password = EmailSenderResetPassword.generateRandomPassword();
            userDAO.addUser(username, password, role, fullName, gender, phone, email, address, avatar);

            EmailSenderResetPassword.sendPasswordEmail(email, password);

        } else if ("edit".equals(action)) {
            // Handle editing user
            int userId = Integer.parseInt(request.getParameter("userId"));
            String roleName = request.getParameter("role");
            String status = request.getParameter("status");

            userDAO.updateUserRoleAndStatus(userId, roleName, status);

        } else if ("generatePassword".equals(action)) {
            // Handle generating new password
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user = userDAO.GetUserById(userId);
            String newPassword = EmailSenderResetPassword.generateRandomPassword();

            userDAO.updateUserPassword(userId, newPassword);
            EmailSenderResetPassword.sendPasswordEmail(user.getEmail(), newPassword);
        }

        response.sendRedirect("userManager");
    }

}
