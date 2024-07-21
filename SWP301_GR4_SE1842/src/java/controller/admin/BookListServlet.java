package controller.admin;

import dal.AuthorDAO;
import dal.BookDAO;
import dal.BookImagesDAO;
import dal.CategoryDAO;
import dal.PublisherDAO;
import dal.SubCategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import model.Author;
import model.Book;
import model.Category;
import model.Publisher;
import model.User;

@WebServlet(name = "BookListServlet", urlPatterns = {"/products"})
@MultipartConfig
public class BookListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4 || us.getRoleID() == 3) {
            response.sendError(404);
            return;
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        request.setAttribute("currentmenu", "Management");
        request.setAttribute("currentpage", "Books");
        Header.Load(request, response);

        String action = request.getParameter("action");
        if (action == null) {
            showBookList(request, response);
        } else {
            switch (action) {
                case "view":
                    viewBook(request, response);
                    break;
                case "add":
                    addBookForm(request, response);
                    break;
                case "delete":
                    deleteBook(request, response);
                    break;
                case "reactivate":
                    reactivateBook(request, response);
                    break;
                default:
                    showBookList(request, response);
                    break;
            }
        }
    }

    private void showBookList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO bd = new BookDAO();
        request.setAttribute("bList", bd.getAllWithSubCategory());
        request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
    }

    private void viewBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        BookDAO bd = new BookDAO();
        request.setAttribute("book", bd.getById(Integer.valueOf(bookid)));
        request.setAttribute("aList", new AuthorDAO().getAll());
        request.setAttribute("pList", new PublisherDAO().getAll());
        request.setAttribute("cList", new CategoryDAO().getAll());
        request.setAttribute("cbList", new CategoryDAO().getByBook(Integer.valueOf(bookid)));
        request.setAttribute("scbList", new SubCategoryDAO().getByBook(Integer.valueOf(bookid)));
        request.setAttribute("action", "Update: ");
        request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
    }

    private void addBookForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("aList", new AuthorDAO().getAll());
        request.setAttribute("pList", new PublisherDAO().getAll());
        request.setAttribute("cList", new CategoryDAO().getAll());
        request.setAttribute("action", "Add new book");
        request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        BookDAO bd = new BookDAO();
        if (bd.changeStatus(Integer.valueOf(bookid), 0)) {
            response.sendRedirect("products");
        } else {
            request.setAttribute("errmsg", "Something went wrong, fail to deactivate!");
            request.setAttribute("bList", bd.getAllWithSubCategory());
            request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
        }
    }

    private void reactivateBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        BookDAO bd = new BookDAO();
        if (bd.changeStatus(Integer.valueOf(bookid), 1)) {
            response.sendRedirect("products");
        } else {
            request.setAttribute("errmsg", "Something went wrong, fail to reactivate!");
            request.setAttribute("bList", bd.getAllWithSubCategory());
            request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("usersession");
        if (us == null || us.getRoleID() == 4) {
            response.sendError(404);
            return;
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        Header.Load(request, response);
        BookDAO bd = new BookDAO();
        AuthorDAO ad = new AuthorDAO();
        PublisherDAO pd = new PublisherDAO();
        SubCategoryDAO scd = new SubCategoryDAO();
        CategoryDAO cd = new CategoryDAO();
        BookImagesDAO bid = new BookImagesDAO();
        boolean authorAdded = true;
        boolean publisherAdded = true;
        boolean bookAdded = true;
        boolean bookupdated = true;
        String action = request.getParameter("action");

        String bookid = request.getParameter("bookid");
        String title = request.getParameter("title");
        String stock = request.getParameter("stock");
        String cost = request.getParameter("cost");
        String desc = request.getParameter("desc");
        String authorid = request.getParameter("author");
        String publisherid = request.getParameter("publisher");
        String newauthoradding = request.getParameter("newauthoradding");
        String newpublisheradding = request.getParameter("newpublisheradding");
        String authorname = request.getParameter("authorName");
        String authorbio = request.getParameter("authorBio");
        String pname = request.getParameter("publisherName");
        String pemail = request.getParameter("publisherEmail");
        String pphone = request.getParameter("publisherPhone");

        if (Float.parseFloat(cost) <= 0) {
            request.setAttribute("errmsg", "Cost must be positive!");
            request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
            return;
        }

        Author author = null;
        if (newauthoradding != null) {
            if (authorname.trim().isEmpty() || authorbio.trim().isEmpty()) {
                handleFormError(request, response, bd, bookid, "Some fields are wrong! Check it out!", action);
                return;
            }
            author = new Author(authorname, authorbio);
            authorAdded = ad.add(author);
            author.setId(ad.maxId());
        } else {
            author = new AuthorDAO().getById(Integer.valueOf(authorid));
        }

        Publisher publisher = null;
        if (newpublisheradding != null) {
            if (pname.trim().isEmpty() || pemail.trim().isEmpty() || !isValidEmail(pemail) || pphone.trim().isEmpty() || !isValidPhone(pphone)) {
                handleFormError(request, response, bd, bookid, "Some fields are wrong! Check it out!", action);
                return;
            }
            publisher = new Publisher(pname, pemail, pphone);
            publisherAdded = pd.add(publisher);
            publisher.setId(pd.maxId());
        } else {
            publisher = new PublisherDAO().getById(Integer.valueOf(publisherid));
        }

        Book book = new Book(0, title, Float.valueOf(cost), Integer.valueOf(stock), 0, desc, author, publisher, 1);
        if (action.equals("Update: ")) {
            book.setId(Integer.valueOf(bookid));
            bookupdated = bd.update(book);
        } else if (action.equals("Add new book")) {
            bookAdded = bd.add(book);
            book.setId(bd.maxId());
        }

        updateBookCategories(request, bd, bookid, book, scd, cd);
        handleBookImages(request, bid, book);

        request.setAttribute("currentmenu", "Management");
        request.setAttribute("currentpage", "Books");
        request.setAttribute("action", action);
        if (!authorAdded || !publisherAdded || !bookAdded || !bookupdated) {
            handleFormError(request, response, bd, bookid, "Something went wrong, action failed!", action);
            return;
        }
        if (action.equals("Update: ")) {
            request.setAttribute("msg", "Update book successfully!");
        } else if (action.equals("Add new book")) {
            request.setAttribute("msg", "Add book successfully!");
        }
        request.setAttribute("book", bd.getById(book.getId()));
        request.setAttribute("aList", ad.getAll());
        request.setAttribute("pList", pd.getAll());
        request.setAttribute("cList", cd.getAll());
        request.setAttribute("cbList", cd.getByBook(book.getId()));
        request.setAttribute("scbList", scd.getByBook(book.getId()));
        request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
    }

    private void handleFormError(HttpServletRequest request, HttpServletResponse response, BookDAO bd, String bookid, String errorMessage, String action)
            throws ServletException, IOException {
        request.setAttribute("book", bd.getById(Integer.valueOf(bookid)));
        request.setAttribute("aList", new AuthorDAO().getAll());
        request.setAttribute("pList", new PublisherDAO().getAll());
        request.setAttribute("cList", new CategoryDAO().getAll());
        request.setAttribute("cbList", new CategoryDAO().getByBook(Integer.valueOf(bookid)));
        request.setAttribute("scbList", new SubCategoryDAO().getByBook(Integer.valueOf(bookid)));
        request.setAttribute("errmsg", errorMessage);
        request.setAttribute("action", action);
        request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
    }

    private boolean isValidEmail(String email) {
        return email.matches("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,7}\\b");
    }

    private boolean isValidPhone(String phone) {
        return phone.matches("^\\+?[1-9]\\d{1,14}$");
    }

    private void updateBookCategories(HttpServletRequest request, BookDAO bd, String bookid, Book book, SubCategoryDAO scd, CategoryDAO cd) {
        String[] selectedCategories = request.getParameterValues("category");
        bd.deleteCategory(bookid);
        for (String c : selectedCategories) {
            if (c.contains("sub")) {
                Category ca = scd.getCategoryOfSub(Integer.valueOf(c.substring(3)));
                bd.addCategory(book.getId() + "", ca.getId() + "", c.substring(3));
            } else {
                Category ca = cd.getById(Integer.valueOf(c));
                bd.addCategory(book.getId() + "", ca.getId() + "", null);
            }
        }
    }

    private void handleBookImages(HttpServletRequest request, BookImagesDAO bid, Book book)
            throws ServletException, IOException {
        Collection<Part> parts = request.getParts();
        String uploadDir = getServletContext().getRealPath("") + "assets"
                + File.separator + "img" + File.separator + "book_images";
        int i = 1;
        for (Part part : parts) {
            if (part.getSize() > 0 && part.getName().equals("images")) {
                String customFileName = book.getId() + "_" + i + ".jpg";
                String filePath = uploadDir + File.separator + customFileName;
                part.write(filePath);
                i++;
            }
        }
        if (i > 1) {
            bid.deleteExistingImage(book.getId());
        }
        for (int k = 1; k < i; k++) {
            bid.addBookImage(book.getId(), "assets" + File.separator + "img" + File.separator + "book_images" + File.separator + book.getId() + "_" + k + ".jpg");
        }
    }
}
