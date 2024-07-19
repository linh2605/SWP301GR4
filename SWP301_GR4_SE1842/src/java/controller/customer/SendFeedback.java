/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dal.BookDAO;
import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author DUCHIEUPC.COM
 */
@WebServlet(name = "SendFeedback", urlPatterns = {"/SendFeedback"})
public class SendFeedback extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendFeedback at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("usersession") == null) {
            response.sendRedirect("./auth/login");
        } else {
            String pdProID = request.getParameter("proID");
            request.setAttribute("product", new BookDAO().getById(Integer.valueOf(pdProID)));
            request.getRequestDispatcher("./client/sendfeedback.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         FeedbackDAO fdao = new FeedbackDAO();
        HttpSession session = request.getSession();
        String content = request.getParameter("feedbackContent");
        String rate = request.getParameter("rate");
        String img = request.getParameter("proimage");
        String proid = request.getParameter("pid");
        int userId = 5;
        Object o = session.getAttribute("usersession");
        User user = (User) o;
        userId = user.getId();

        // Log giá trị của proid để kiểm tra
        System.out.println("Received PID: " + proid);

        if (proid == null || proid.isEmpty()) {
            // Xử lý trường hợp pid null hoặc rỗng
            System.out.println("PID is null or empty.");
            response.sendRedirect("./errorPage"); // Chuyển hướng đến trang lỗi hoặc xử lý phù hợp
            return;
        }

        fdao.insertFeedback(proid, userId, content, rate, img);
        response.sendRedirect("./detail?bid=" + proid);
    }



/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
@Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
