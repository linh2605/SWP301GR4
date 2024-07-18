/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.BookDAO;
import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;
import model.Book;

/**
 *
 * @author THTP
 */
@WebServlet(name = "AddDiscount", urlPatterns = {"/AddDiscount"})
public class AddDiscount extends HttpServlet {



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
        BookDAO dao = new BookDAO();
        List<Book> lb = dao.getAll();
        request.setAttribute("lb", lb);
        request.getRequestDispatcher("./marketing/addDiscount.jsp").forward(request, response);
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
        try{
        String bookId = request.getParameter("bookId");
        String amount = request.getParameter("amount");
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        String did = request.getParameter("did");

      
//          if (isInvalidDateRange(fromdate, todate)) {
          if (isInvalidDateRange(fromdate, todate)) {
                response.getWriter().print("    <script>\n"
                        + "        alert(\"Error: End date cannot be before start date. Please choose a valid date range.\");\n"
                        + "        window.location = \"AddDiscount\";\n" // Đặt lại trang thêm giảm giá để người dùng nhập lại
                        + "    </script>");
                return;
            }
                int a = new DiscountDAO().addDiscount(bookId, amount, fromdate, todate);
        String messs = "";
          if (a == 0) {
            messs = "Add failed!Try again";
        } else {
            messs = "Add successfull!";
        }
        response.getWriter().print("    <script>\n"
                + "        alert(\"" + messs + "\");\n"
                + "        window.location = \"DiscountList\";\n"
                + "    </script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//       Hàm kiểm tra ngày kết thúc không trước ngày bắt đầu
    private boolean isInvalidDateRange(String startDate, String endDate) {
        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);
        return end.isBefore(start);
    }


}
