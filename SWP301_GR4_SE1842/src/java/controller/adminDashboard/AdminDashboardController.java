/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminDashboard;

import dal.DashboardDAO;
import dto.DashboardStats;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AdminDashboardController", urlPatterns = {"/admin/adminDashboard"})
public class AdminDashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        
        if (startDate != null) {
            startDate = startDate.isEmpty() ? null : startDate;
        }
        if (endDate != null) {
            endDate = endDate.isEmpty() ? null : endDate;
        }

        DashboardDAO dashboardDAO = new DashboardDAO();
        DashboardStats stats = dashboardDAO.getDashboardStats(startDate, endDate);
        request.setAttribute("topProducts", dashboardDAO.getTopProductsTrendByQuantity(7));
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
