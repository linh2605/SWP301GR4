package controller.admin;

import dal.SliderDAO;
import model.Slider;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "SliderServlet", urlPatterns = {"/admin/slider", "/sliders"})
@MultipartConfig
public class SliderServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checkPermission(request, response)) {
            return;
        }
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "edit":
                showEditForm(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "toggle":
                toggleStatus(request, response);
                break;
            case "list":
            default:
                listSliders(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checkPermission(request, response)) {
            return;
        }

        String action = request.getParameter("action");

        switch (action) {
            case "delete":
                deleteSlider(request, response);
                break;
            case "save":
                saveSlider(request, response);
                break;
            default:
                response.sendRedirect("sliders");
                break;
        }
    }

    private boolean checkPermission(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() >= 3) {
            response.sendError(404);
            return false;
        }
        return true;
    }

    private void listSliders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> sliderList = sliderDAO.getAllSliders();
        request.setAttribute("sliderList", sliderList);
        request.getRequestDispatcher("/admin/slider_list.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SliderDAO sliderDAO = new SliderDAO();
        String id = request.getParameter("id");
        if (id != null) {
            Slider slider = sliderDAO.getSliderById(Integer.parseInt(id));
            request.setAttribute("slider", slider);
        }
        request.getRequestDispatcher("/admin/slider_form.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/slider_form.jsp").forward(request, response);
    }

    private void toggleStatus(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        SliderDAO sliderDAO = new SliderDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        sliderDAO.toggleStatus(id, status);
        response.sendRedirect(request.getContextPath() + "/sliders");
    }

    private void deleteSlider(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new SliderDAO().deleteSlider(id);
        response.sendRedirect("sliders");
    }

    private void saveSlider(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        Part imagePart = request.getPart("imageFile");
        String description = request.getParameter("description");
        int status = Integer.parseInt(request.getParameter("status"));

        String imageUrl = uploadImage(imagePart, request);

        Slider slider = new Slider(
                id == null || id.isEmpty() ? 0 : Integer.parseInt(id),
                title,
                imageUrl,
                description,
                status
        );

        SliderDAO sliderDAO = new SliderDAO();
        if (id == null || id.isEmpty()) {
            sliderDAO.addSlider(slider);
        } else {
            sliderDAO.updateSlider(slider);
        }
        response.sendRedirect("sliders");
    }

    private String uploadImage(Part imagePart, HttpServletRequest request) throws IOException {
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filePath = uploadPath + File.separator + fileName;
        imagePart.write(filePath);
        return UPLOAD_DIR + "/" + fileName;
    }
}
 