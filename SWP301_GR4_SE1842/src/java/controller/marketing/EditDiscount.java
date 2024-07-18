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
import java.util.List;
import model.Book;
import model.Discount;

/**
 *
 * @author THTP
 */
@WebServlet(name = "EditDiscount", urlPatterns = {"/EditDiscount"})
public class EditDiscount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO dao = new BookDAO();
        List<Book> lb = dao.getAll();
        String did = request.getParameter("did");
        Discount d = new DiscountDAO().getDetailDiscount(did);
        if (d == null) {
            response.getWriter().print("    <script>\n"
                    + "        alert(\"This id discount not found!\");\n"
                    + "        window.location = \"DiscountList\";\n"
                    + "    </script>");
        } else {
            request.setAttribute("lb", lb);
            request.setAttribute("d", d);
            request.getRequestDispatcher("./marketing/updateDiscount.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String bookId = request.getParameter("bookId");
            String amount = request.getParameter("amount");
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String did = request.getParameter("did");
           
            int a = new DiscountDAO().updateDiscount(bookId, amount, fromdate, todate, did);
            String messs = "";
            if (a == 0) {
                messs = "Update failed!Try again";
            } else {
                messs = "Update successfull!";
            }
            response.getWriter().print("    <script>\n"
                    + "        alert(\"" + messs + "\");\n"
                    + "        window.location = \"DiscountList\";\n"
                    + "    </script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
