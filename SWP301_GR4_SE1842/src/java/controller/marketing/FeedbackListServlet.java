package controller.marketing;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.*;

/**
 *
 * @author THTP
 */
@WebServlet(name = "FeedbacksList", urlPatterns = {"/FeedbacksList"})
public class FeedbackListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            User u = (User) session.getAttribute("usersession");

            if (u == null) {
                resp.sendRedirect("./auth/login");
            } else if (u.getRoleID() == 1 || u.getRoleID() == 2) {
                String star = req.getParameter("star") == null ? "" : req.getParameter("star");
                String search = req.getParameter("search") == null ? "" : req.getParameter("search");
                String status = req.getParameter("status") == null ? "" : req.getParameter("status");
                BookReivewDAO brDAO = new BookReivewDAO();
                UserDao uDAO = new UserDao();
                BookDAO bDAO = new BookDAO();

                List<BookReview> brList = brDAO.getBookReviewAll(star, search);
                req.setAttribute("username", u.getFullName());
                req.setAttribute("feedbacksList", brList);
                req.setAttribute("uDAO", uDAO);
                req.setAttribute("bDAO", bDAO);

                req.setAttribute("fl", new FeedbackDAO().getListFeedback(status, search, star));
                req.setAttribute("currentpage", "FeedbackList");
                req.getRequestDispatcher("./marketing/FeedbacksList.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("./homepage");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
