/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author ACER
 */
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
        request.setAttribute("currentpage", "Product");
        Header.Load(request, response);
        BookDAO bd = new BookDAO();
        String action = request.getParameter("action");
        if (action != null) {
            String bookid = request.getParameter("bookid");
            if (action.equals("view")) {
                request.setAttribute("book", bd.getById(Integer.valueOf(bookid)));
                request.setAttribute("aList", new AuthorDAO().getAll());
                request.setAttribute("pList", new PublisherDAO().getAll());
                request.setAttribute("cList", new CategoryDAO().getAll());
                request.setAttribute("cbList", new CategoryDAO().getByBook(Integer.valueOf(bookid)));
                request.setAttribute("scbList", new SubCategoryDAO().getByBook(Integer.valueOf(bookid)));
                request.setAttribute("action", "Update: ");
                request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
                return;
            }
            if (action.equals("add")) {
                request.setAttribute("aList", new AuthorDAO().getAll());
                request.setAttribute("pList", new PublisherDAO().getAll());
                request.setAttribute("cList", new CategoryDAO().getAll());
                request.setAttribute("action", "Add new book");
                request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
                return;
            }
            if (action.equals("delete")) {
                if (bd.changeStatus(Integer.valueOf(bookid), 0)) {
                    response.sendRedirect("books");
                    return;
                } else {
                    request.setAttribute("errmsg", "Something went wrong, fail to deactivate!");
                    request.setAttribute("bList", bd.getAllWithSubCategory());
                    request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
                    return;
                }
            }
        }
        request.setAttribute("bList", bd.getAllWithSubCategory());
        request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
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
        //================GET VALUES===================
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
            request.setAttribute("errmsg", "Cost must be postive!");
            request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
            return;
        }
        //================ADDING NEW AUTHOR, PUBLISHER===================
        Author author = null;
        if (newauthoradding != null) {
            if (authorname.trim().equals("") || authorbio.trim().equals("")) {
                if (action.equals("Update: ")) {
                    request.setAttribute("book", bd.getById(Integer.valueOf(bookid)));
                    request.setAttribute("aList", new AuthorDAO().getAll());
                    request.setAttribute("pList", new PublisherDAO().getAll());
                    request.setAttribute("cList", new CategoryDAO().getAll());
                    request.setAttribute("cbList", new CategoryDAO().getByBook(Integer.valueOf(bookid)));
                    request.setAttribute("scbList", new SubCategoryDAO().getByBook(Integer.valueOf(bookid)));
                    request.setAttribute("action", "Update: ");
                } else {
                    request.setAttribute("aList", new AuthorDAO().getAll());
                    request.setAttribute("pList", new PublisherDAO().getAll());
                    request.setAttribute("cList", new CategoryDAO().getAll());
                    request.setAttribute("action", "Add new book");
                }
                request.setAttribute("errmsg", "Some fields are wrong! Check it out!");
                request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
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
            if (pname.trim().equals("")
                    || pemail.trim().equals("")
                    || !pemail.trim().matches("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,7}\\b")
                    || pphone.trim().equals("")
                    || !pphone.trim().matches("^\\+?[1-9]\\d{1,14}$")) {
                if (action.equals("Update: ")) {
                    request.setAttribute("book", bd.getById(Integer.valueOf(bookid)));
                    request.setAttribute("aList", new AuthorDAO().getAll());
                    request.setAttribute("pList", new PublisherDAO().getAll());
                    request.setAttribute("cList", new CategoryDAO().getAll());
                    request.setAttribute("cbList", new CategoryDAO().getByBook(Integer.valueOf(bookid)));
                    request.setAttribute("scbList", new SubCategoryDAO().getByBook(Integer.valueOf(bookid)));
                    request.setAttribute("action", "Update: ");
                } else {
                    request.setAttribute("aList", new AuthorDAO().getAll());
                    request.setAttribute("pList", new PublisherDAO().getAll());
                    request.setAttribute("cList", new CategoryDAO().getAll());
                    request.setAttribute("action", "Add new book");
                }
                request.setAttribute("errmsg", "Some fields are wrong! Check it out!");
                request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
                return;
            }
            publisher = new Publisher(pname, pemail, pphone);
            publisherAdded = pd.add(publisher);
            publisher.setId(pd.maxId());
        } else {
            publisher = new PublisherDAO().getById(Integer.valueOf(publisherid));
        }
        //================BOOK ACTION===================
        Book book = new Book(0, title, Float.valueOf(cost), Integer.valueOf(stock), 0, desc, author, publisher, 1);
        if (action.equals("Update: ")) {
            book.setId(Integer.valueOf(bookid));
            bookupdated = bd.update(book);
        } else if (action.equals("Add new book")) {
            bookAdded = bd.add(book);
            book.setId(bd.maxId());
        }
        //================CATEGORY===================
        String[] selectedCategories = request.getParameterValues("category");
        Category ca = null;
        bd.deleteCategory(bookid);
        for (String c : selectedCategories) {
            if (c.contains("sub")) {
                ca = scd.getCategoryOfSub(Integer.valueOf(c.substring(3)));
                bd.addCategory(book.getId() + "", ca.getId() + "", c.substring(3));
            } else {
                ca = cd.getById(Integer.valueOf(c));
                bd.addCategory(book.getId() + "", ca.getId() + "", null);
            }
        }
        //================IMAGE===================
        Collection<Part> parts = request.getParts();
        String uploadDir = getServletContext().getRealPath("") + "assets"
                + File.separator + "img" + File.separator + "book_images";
        int i = 1;
        for (Part part : parts) {
            if (part.getSize() > 0) {
                if (part.getName().equals("images")) {
                    String fileName = getFileName(part); // Extracts the submitted file name
                    String customFileName = book.getId() + "_" + i + ".jpg"; // Your custom name
                    String filePath = uploadDir + File.separator + customFileName;
                    part.write(filePath);
                    i++;
                }
            }

        }
        if (action.equals("Update: ")) {
            bid.deleteExistingImage(book.getId());
        }
        for (int k = 1; k <= 5; k++) {
            bid.addBookImage(
                    book.getId(),
                    "assets" + File.separator
                    + "img" + File.separator
                    + "book_images" + File.separator
                    + book.getId() + "_" + k + ".jpg"
            );
        }
        //==============================================
        request.setAttribute("currentmenu", "Management");
        request.setAttribute("currentpage", "Products");
        request.setAttribute("action", action);
        if (!authorAdded || !publisherAdded || !bookAdded || !bookupdated) {
            request.setAttribute("book", bd.getById(book.getId()));
            request.setAttribute("aList", ad.getAll());
            request.setAttribute("pList", pd.getAll());
            request.setAttribute("cList", cd.getAll());
            request.setAttribute("cbList", cd.getByBook(Integer.valueOf(bookid)));
            request.setAttribute("scbList", scd.getByBook(Integer.valueOf(bookid)));
            request.setAttribute("errmsg", "Something went wrong, action fail!");
            request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
            return;
        }
        if (action.equals("Update: ")) {
            request.setAttribute("book", bd.getById(book.getId()));
            request.setAttribute("aList", ad.getAll());
            request.setAttribute("pList", pd.getAll());
            request.setAttribute("cList", cd.getAll());
            request.setAttribute("cbList", cd.getByBook(Integer.valueOf(bookid)));
            request.setAttribute("scbList", scd.getByBook(Integer.valueOf(bookid)));
            request.setAttribute("msg", "Update book succesfully!");
            request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
            return;
        } else if (action.equals("Add new book")) {
            request.setAttribute("book", bd.getById(book.getId()));
            request.setAttribute("aList", ad.getAll());
            request.setAttribute("pList", pd.getAll());
            request.setAttribute("cList", cd.getAll());
            request.setAttribute("cbList", cd.getByBook(book.getId()));
            request.setAttribute("scbList", scd.getByBook(book.getId()));
            request.setAttribute("msg", "Add book succesfully!");
            request.getRequestDispatcher("admin/book_form.jsp").forward(request, response);
            return;
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public void deleteImages(String directoryPath, String[] fileNames) {
        File directory = new File(directoryPath);
        if (directory.exists() && directory.isDirectory()) {

            File[] files = directory.listFiles(file -> {
                for (String name : fileNames) {
                    if (file.getName().equals(name)) {
                        return true;
                    }
                }
                return false;
            });
            if (files != null) {
                for (File file : files) {
                    file.delete();
                }
            }
        }
    }

}
