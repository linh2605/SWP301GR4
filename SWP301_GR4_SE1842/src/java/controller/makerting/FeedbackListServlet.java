package controller.makerting;

import controller.customer.*;
import dal.FeedbackDao;
import model.Feedback;
import model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/view/marketing-feedback")
public class FeedbackListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 10;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usersession");

        if (user != null) {
            int page = 1;
            if (request.getParameter("page") != null) {
                try {
                    page = Integer.parseInt(request.getParameter("page"));
                } catch (NumberFormatException e) {
                    // Ignore and use default page number 1
                }
            }
            
            FeedbackDao feedbackDAO = new FeedbackDao();
            List<Feedback> feedbacks = feedbackDAO.getFeedbacks(page, PAGE_SIZE);
            int totalFeedbacks = feedbackDAO.getFeedbackCount();
            int totalPages = (int) Math.ceil(totalFeedbacks / (double) PAGE_SIZE);
           
            request.setAttribute("feedbacks", feedbacks);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("marketingFeedback.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/auth/login");
        }
    }
}
