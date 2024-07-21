package controller.customer;

import dal.BookDAO;
import dal.SliderDAO;
import model.Book;
import model.Slider;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "homepage", urlPatterns = {"/homepage", ""})
public class homepage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Header.Load(request, response);

        BookDAO bd = new BookDAO();
        List<Book> list = bd.getAllBookCard();

        List<Book> sortedRate = new ArrayList<>(list);
        sortedRate.sort(Comparator.comparingInt(Book::getRate).reversed());
        
        List<Book> lbc1 = bd.getBookCardByCategory(1);
        List<Book> lbc2 = bd.getBookCardByCategory(2);
        List<Book> lbc3 = bd.getBookCardByCategory(3);
        
        request.setAttribute("list1", lbc1);
        request.setAttribute("list2", lbc2);
        request.setAttribute("list3", lbc3);
        request.setAttribute("list", list);
        request.setAttribute("sortedRate", sortedRate);
        request.setAttribute("soBook", bd.getSOBook());

        // Lấy các slider có trạng thái active
        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> activeSliders = sliderDAO.getActiveSliders();
        request.setAttribute("activeSliders", activeSliders);

        request.getRequestDispatcher("client/homepage.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
