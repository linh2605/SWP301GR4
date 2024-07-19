import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dal.ProductDetailsDao;
import dal.FeedbackDao;
import model.ProductDetails;
import model.Feedback;

public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDetailsDao productDetailsDao;
    private FeedbackDao feedbackDao;

    public void init() {
        productDetailsDao = new ProductDetailsDao();
        feedbackDao = new FeedbackDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int productId = Integer.parseInt(request.getParameter("pId"));
        ProductDetails product = productDetailsDao.selectProduct(productId);
        List<Feedback> feedbackList = feedbackDao.selectFeedbackByProductId(productId);
        System.out.println("hello");
        request.setAttribute("product", product);
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("product-details.jsp").forward(request, response);
    }

    
    
    
}
