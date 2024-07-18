/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BlogController", urlPatterns = {"/Blog"})
public class BlogController extends HttpServlet {

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
              String[] value = (request.getParameterValues("value") == null) ? new String[]{"", "", ""} : request.getParameterValues("value");
        String order = request.getParameter("order")==null?"NTO":request.getParameter("order");
        ArrayList<Blog> bloList = new BlogDAO().getAllPost(value, order);
        int pageSize = 9;
        int page;
        if (request.getParameter("page") == null) {
            page = 1;
        } else {
            page = Integer.parseInt(request.getParameter("page"));
        }
        request.setAttribute("totalPage", (bloList.size() / pageSize) + 1);
        List<Blog> pageList;
        try {
            pageList = (List<Blog>) bloList.subList((page - 1) * pageSize, page * pageSize);
        } catch (Exception e) {
            pageList = (List<Blog>) bloList.subList((page - 1) * pageSize, bloList.size());
        }

        request.setAttribute("bloList", pageList);
        ArrayList<Blog> reList = new BlogDAO().getRecentPost();
        ArrayList<String> catList = new BlogDAO().getCatPost();
        request.setAttribute("reList", reList);
        request.setAttribute("catList", catList);
        boolean[] checkValue = new boolean[catList.size()];

        for (int i = 0; i < checkValue.length; i++) {
            if (checkBox(catList.get(i), value)) {
                checkValue[i] = true;
            } else {
                checkValue[i] = false;
            }
        }
        request.setAttribute("checkValue", checkValue);
        if (value != null) {
            request.setAttribute("value", value);
            if (order.equals("NTO")) {
                request.setAttribute("order", "NTO");
            } else {
                request.setAttribute("order", "OTN");
            }
        }
        if (order != null) {
            if (order.equals("NTO")) {
                request.setAttribute("NTO", "checked");
            } else {
                request.setAttribute("OTN", "checked");
            }
        }

        request.setAttribute("page", page);
//        request.setAttribute("value", value);
        request.getRequestDispatcher("./client/blog.jsp").forward(request, response);
    }

    private static boolean checkBox(String s, String[] arrString) {
        if (arrString == null) {
            return false;
        }
        for (int i = 0; i < arrString.length; i++) {
            if (arrString[i].equals(s)) {
                return true;
            }
        }
        return false;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
