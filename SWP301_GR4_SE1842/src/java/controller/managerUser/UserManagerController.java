/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerUser;

import dal.BlogDAO;
import dal.RoleDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.User;

import java.io.IOException;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserManagerController", urlPatterns = {"/admin/userManager"})
public class UserManagerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int RECORDS_PER_PAGE = 5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role = request.getParameter("role");
        String gender = request.getParameter("gender");
        request.setAttribute("role", role);
        RoleDAO rDAO = new RoleDAO();
        request.setAttribute("roles", rDAO.getAllRoles());
        int currentPage = 1;
        int recordsPerPage = RECORDS_PER_PAGE;

        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        UserDAO userDao = new UserDAO();
        List<User> userList = userDao.filterUser(role, gender, currentPage, recordsPerPage);
        int rows = userDao.getNumberOfRows(role, gender);

        int nOfPages = rows / recordsPerPage;
        if (rows % recordsPerPage > 0) {
            nOfPages++;
        }

        request.setAttribute("userList", userList);
        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.getRequestDispatcher("userManager.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }
 
 
}
