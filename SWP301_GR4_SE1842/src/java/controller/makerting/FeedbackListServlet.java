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

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usersession");

        if (user != null) {
            String pageParam = request.getParameter("page");
            String searchParam = request.getParameter("search");
            String subjectParam = request.getParameter("lesson");
            String statusParam = request.getParameter("status");
            Integer status = (statusParam != null && !statusParam.isEmpty()) ? Integer.valueOf(statusParam) : null;
            int page = 1; // Default to the first page
            int pageSize = 6; // Set the desired page size
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }
            FeedbackDao feedbackDAO = new FeedbackDao();
            List<Feedback> feedbacks = feedbackDAO.getFeedbacksWithParam(searchParam, status);
            List<Feedback> pagingFeedback = feedbackDAO.Paging(feedbacks, page, pageSize);
            System.out.println(feedbacks);
            request.setAttribute("feedbacks", pagingFeedback);
            request.setAttribute("totalPages", feedbacks.size() % pageSize == 0 ? (feedbacks.size() / pageSize) : (feedbacks.size() / pageSize + 1));
            request.setAttribute("currentPage", page);
            request.setAttribute("searchParam", searchParam);
            request.setAttribute("subjectParam", subjectParam);
            request.setAttribute("statusParam", statusParam);
            request.getRequestDispatcher("marketingFeedback.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/auth/login");
        }
    }
}
