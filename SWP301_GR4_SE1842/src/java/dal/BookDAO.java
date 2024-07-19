/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Author;
import model.Book;
import model.BookImage;
import model.Publisher;

/**
 *
 * @author ACER
 */
public class BookDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<Book> list;

    public List<Book> getAll() {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT\n"
                    + "                        b.BookID,\n"
                    + "                        b.BookTitle,\n"
                    + "                        b.BookCost,\n"
                    + "                        b.Stock,\n"
                    + "                        b.BookRate,\n"
                    + "                        b.BookDesc,\n"
                    + "                        a.AuthorID,\n"
                    + "                        a.AuthorName,\n"
                    + "                        a.Bio,\n"
                    + "                        p.PublisherID,\n"
                    + "                        p.PublisherName,\n"
                    + "                        p.PublisherEmail,\n"
                    + "                        p.PublisherPhone,\n"
                    + "                        c.CategoryID,\n"
                    + "						b.BookStatus\n"
                    + "                    FROM \n"
                    + "                        Book b\n"
                    + "                    LEFT JOIN \n"
                    + "                        Author a ON a.AuthorID = b.AuthorID\n"
                    + "                    LEFT JOIN \n"
                    + "                        Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "                    LEFT JOIN \n"
                    + "                        BookCategory c ON b.BookID = c.BookID";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(
                        new Book(
                                rs.getInt("BookID"),
                                rs.getString("booktitle"),
                                rs.getFloat("bookcost"),
                                rs.getInt("stock"),
                                rs.getInt("bookrate"),
                                rs.getString("bookDesc"),
                                new Author(
                                        rs.getInt("AuthorID"),
                                        rs.getString("AuthorName"),
                                        rs.getString("Bio")),
                                new Publisher(
                                        rs.getInt("PublisherID"),
                                        rs.getString("PublisherName"),
                                        rs.getString("PublisherEmail"),
                                        rs.getString("PublisherPhone")
                                ),
                                rs.getInt("BookStatus")
                        ));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public Book getCardBook(int id, String title, float price, int rate, Author author, int status) {
        Book b = new Book();
        b.setId(id);
        b.setTitle(title);
        b.setAuthor(author);
        b.setCost(price);
        b.setRate(rate);
        List<BookImage> iList = new BookImagesDAO().getImagesOfBook(id);
        b.setiList(iList);
        if (iList != null && !iList.isEmpty()) {
            if (iList.size() > 0) {
                b.setImg0(iList.get(0).getImage());
            }
            if (iList.size() > 1) {
                b.setImg1(iList.get(1).getImage());
            }
        }
        b.setStatus(status);
        return b;
    }

    public List<Book> getAllBookCard() {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Book LEFT JOIN Author on Book.AuthorID = Author.AuthorID";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((getCardBook(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("bookrate"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStock(int bookid, int stock) {
        list = new ArrayList<>();
        try {
            String query = "UPDATE Book Set Stock = ? where BookID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, stock);
            stm.setInt(2, bookid);
            stm.execute();
             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Book> getAllBookCardBySearch(String search) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT \n"
                    + "                        b.BookID, \n"
                    + "                        b.BookTitle, \n"
                    + "                        b.BookCost, \n"
                    + "                        b.Stock, \n"
                    + "                        b.BookRate, \n"
                    + "                        b.BookDesc, \n"
                    + "                        a.AuthorID, \n"
                    + "                        p.PublisherID, \n"
                    + "                        a.AuthorName, \n"
                    + "                        a.Bio, \n"
                    + "                        p.PublisherName, \n"
                    + "                        p.PublisherEmail, \n"
                    + "                        p.PublisherPhone,\n"
                    + "                           b.BookStatus\n"
                    + "                    FROM Book b\n"
                    + "                    LEFT JOIN BookCategory c ON b.BookID = c.BookID\n"
                    + "                    LEFT JOIN Author a ON b.AuthorID = a.AuthorID\n"
                    + "                    LEFT JOIN Publisher p ON b.PublisherID = p.PublisherID\n"
                    + " WHERE b.BookTitle LIKE ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, "%" + search + "%");
            System.out.println("Check " + search);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((getCardBook(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("bookrate"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        rs.getInt("BookStatus")
                )));
                System.out.println("Check1 " + search);
             
            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<Book> getBookCardByAuthorID(int id) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT \n"
                    + "                        b.BookID, \n"
                    + "                        b.BookTitle, \n"
                    + "                        b.BookCost, \n"
                    + "                        b.Stock, \n"
                    + "                        b.BookRate, \n"
                    + "                        b.BookDesc, \n"
                    + "                        a.AuthorID, \n"
                    + "                        p.PublisherID, \n"
                    + "                        a.AuthorName, \n"
                    + "                        a.Bio, \n"
                    + "                        p.PublisherName, \n"
                    + "                        p.PublisherEmail, \n"
                    + "                        p.PublisherPhone,\n"
                    + "						b.BookStatus\n"
                    + "                    FROM Book b\n"
                    + "                    LEFT JOIN BookCategory c ON b.BookID = c.BookID\n"
                    + "                    LEFT JOIN Author a ON b.AuthorID = a.AuthorID\n"
                    + "                    LEFT JOIN Publisher p ON b.PublisherID = p.PublisherID\n"
                    + "WHERE a.AuthorID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((getCardBook(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("bookrate"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        rs.getInt("BookStatus")
                )));
             
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new BookDAO().getBookCardByCategory(2).size());
    }

    public List<Book> getBookCardByCategory(int id) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT \n"
                    + "    b.BookID, \n"
                    + "    b.BookTitle, \n"
                    + "    b.BookCost, \n"
                    + "    b.Stock, \n"
                    + "    b.BookRate, \n"
                    + "    b.BookDesc, \n"
                    + "    a.AuthorID, \n"
                    + "    p.PublisherID, \n"
                    + "    a.AuthorName, \n"
                    + "    a.Bio, \n"
                    + "    p.PublisherName, \n"
                    + "    p.PublisherEmail, \n"
                    + "    p.PublisherPhone,\n"
                    + "b.BookStatus "
                    + "FROM Book b\n"
                    + "LEFT JOIN BookCategory c ON b.BookID = c.BookID\n"
                    + "LEFT JOIN Author a ON b.AuthorID = a.AuthorID\n"
                    + "LEFT JOIN Publisher p ON b.PublisherID = p.PublisherID\n"
                    + "WHERE c.CategoryID = ?";
            if (id == -1) {
                query = "SELECT DISTINCT \n"
                        + "    b.BookID, \n"
                        + "    b.BookTitle, \n"
                        + "    b.BookCost, \n"
                        + "    b.Stock, \n"
                        + "    b.BookRate, \n"
                        + "    b.BookDesc, \n"
                        + "    a.AuthorID, \n"
                        + "    p.PublisherID, \n"
                        + "    a.AuthorName, \n"
                        + "    a.Bio, \n"
                        + "    p.PublisherName, \n"
                        + "    p.PublisherEmail, \n"
                        + "    p.PublisherPhone,\n"
                        + "b.BookStatus "
                        + "FROM Book b\n"
                        + "LEFT JOIN BookCategory c ON b.BookID = c.BookID\n"
                        + "LEFT JOIN Author a ON b.AuthorID = a.AuthorID\n"
                        + "LEFT JOIN Publisher p ON b.PublisherID = p.PublisherID\n";
            }
            stm = connection.prepareStatement(query);
            if (id != -1) {
                stm.setInt(1, id);
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((getCardBook(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("bookrate"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        rs.getInt("BookStatus")
                )));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Book> getAllWithSubCategory() {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT\n"
                    + "                    b.BookID,\n"
                    + "                    b.BookTitle,\n"
                    + "                    b.BookCost,\n"
                    + "                    b.Stock,\n"
                    + "                    b.BookRate,\n"
                    + "                    b.BookDesc,\n"
                    + "                    a.AuthorID,\n"
                    + "                    a.AuthorName,\n"
                    + "                    a.Bio,\n"
                    + "                    p.PublisherID,\n"
                    + "                    p.PublisherName,\n"
                    + "                    p.PublisherEmail,\n"
                    + "                    p.PublisherPhone,\n"
                    + "b.BookStatus "
                    + "                    FROM \n"
                    + "                    Book b\n"
                    + "                    LEFT JOIN \n"
                    + "                    Author a ON a.AuthorID = b.AuthorID\n"
                    + "                    LEFT JOIN \n"
                    + "                    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "                    LEFT JOIN \n"
                    + "                    BookCategory c ON b.BookID = c.BookID";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(
                        new Book(
                                rs.getInt("BookID"),
                                rs.getString("booktitle"),
                                rs.getFloat("bookcost"),
                                rs.getInt("stock"),
                                rs.getInt("bookrate"),
                                rs.getString("bookDesc"),
                                new Author(
                                        rs.getInt("AuthorID"),
                                        rs.getString("AuthorName"),
                                        rs.getString("Bio")),
                                new Publisher(
                                        rs.getInt("PublisherID"),
                                        rs.getString("PublisherName"),
                                        rs.getString("PublisherEmail"),
                                        rs.getString("PublisherPhone")
                                ),
                                rs.getInt("BookStatus")
                        ));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public Book getById(int bookid) {
        try {
            String query = "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID,\n"
                    + "b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID\n"
                    + "LEFT JOIN Images i on i.bookid = b.bookid "
                    + "where b.bookid = ?";
            stm = connection.prepareCall(query);
            stm.setInt(1, bookid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return (new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("BookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                ));
            }
             
        } catch (Exception e) {
        }
        return null;
    }

    public List<Book> getByTitle(String title) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID,\n"
                    + "b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID WHERE BookTitle LIKE ?";
            stm = connection.prepareCall(query);
            stm.setString(1, "%" + title + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("bookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public boolean update(Book book) {
        String query = "UPDATE Book "
                + "SET BookTitle = ?, BookCost = ?, Stock = ?, BookDesc = ?, AuthorID = ?, PublisherID = ? "
                + "WHERE BookID = ?";

        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, book.getTitle());
            stm.setFloat(2, book.getCost());
            stm.setInt(3, book.getStock());
            stm.setString(4, book.getDesc());
            stm.setInt(5, book.getAuthor().getId());
            stm.setInt(6, book.getPublisher().getId());
            stm.setInt(7, book.getId());
            stm.execute();

             
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean changeStatus(int bookid, int status) {
        try {
            String query = "UPDATE Book SET BookStatus = ? WHERE BookID = ?";
            try (PreparedStatement stm = connection.prepareStatement(query)) {
                stm.setInt(1, status);
                stm.setInt(2, bookid);
                stm.execute();
             
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCategory(String bookid) {
        try {
            String query = "DELETE FROM BookCategory WHERE Bookid = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, bookid);
            stm.execute();

             
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean addCategory(String bookid, String categoryid, String subid) {
        try {
            String q = "INSERT INTO BookCategory(bookid, categoryid, subcategoryid) VALUES (?,?,?)";
            stm = connection.prepareStatement(q);
            stm.setString(1, bookid);
            stm.setString(2, categoryid);
            stm.setString(3, subid);
            stm.execute();
             
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean add(Book book) {
        String query = "INSERT INTO Book (BookTitle, BookCost, Stock, BookRate, BookDesc, AuthorID, PublisherID, BookStatus) "
                + "VALUES "
                + "(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, book.getTitle());
            stm.setFloat(2, book.getCost());
            stm.setInt(3, book.getStock());
            stm.setString(4, "0");
            stm.setString(5, book.getDesc());
            stm.setInt(6, book.getAuthor().getId());
            stm.setInt(7, book.getPublisher().getId());
            stm.setInt(8, 1);
            stm.execute();
             

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public int maxId() {
        try {
            String query = "SELECT MAX(BookId) as max FROM Book";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
             
                return rs.getInt("max");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Book> getByCategory(int id) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID,\n"
                    + " b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID\n"
                    + "WHERE c.CategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("BookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public List<Book> getBySubCategory(int scid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID, \n"
                    + " b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID\n"
                    + "WHERE c.SubCategoryID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, scid);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("BookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalBook() {
        try {
            String query = "select count(*) from Book";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
             
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalBookCategory(int cid) {
        try {

            String query = "";
            if (cid == -1) {
                query = "SELECT COUNT(DISTINCT b.BookID) AS TotalBooks\n"
                        + "FROM Book b\n"
                        + "LEFT JOIN BookCategory c ON b.BookID = c.BookID\n";

            } else {
                query = "SELECT COUNT(DISTINCT b.BookID) AS TotalBooks\n"
                        + "FROM Book b\n"
                        + "LEFT JOIN BookCategory c ON b.BookID = c.BookID\n"
                        + "WHERE c.CategoryID = ?;";
            }

            stm = connection.prepareStatement(query);
            if (cid != -1) {
                stm.setInt(1, cid);
            }

            rs = stm.executeQuery();
             
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalBookSubCategory(int scid) {
        try {

            String query = "SELECT COUNT(DISTINCT b.BookID) AS TotalBooks\n"
                    + "                    FROM Book b\n"
                    + "                    LEFT JOIN BookCategory c ON b.BookID = c.BookID\n"
                    + "                    WHERE c.SubCategoryID = ?;";
            stm = connection.prepareStatement(query);
            stm.setInt(1, scid);
            rs = stm.executeQuery();
             
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Book> pagingBook(int index) {
        list = new ArrayList<>();
        try {
            String query = "SELECT *\n"
                    + "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID, \n"
                    + " b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID\n"
                    + "ORDER BY b.BookID OFFSET ?\n"
                    + "ROWS FETCH NEXT 8 ROWS ONLY";
            stm = connection.prepareCall(query);
            stm.setInt(1, (index - 1) * 8);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("bookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public List<Book> pagingBookCategory(int index, int cid) {
        list = new ArrayList<>();
        try {
            String query = "";
            if (cid == -1) {
                query = "SELECT DISTINCT\n"
                        + "    b.BookID,\n"
                        + "    b.BookTitle,\n"
                        + "    b.BookCost,\n"
                        + "    b.Stock,\n"
                        + "    b.BookRate,\n"
                        + "    b.BookDesc,\n"
                        + "    a.AuthorID,\n"
                        + "    a.AuthorName,\n"
                        + "    a.Bio,\n"
                        + "    p.PublisherID,\n"
                        + "    p.PublisherName,\n"
                        + "    p.PublisherEmail,\n"
                        + "    p.PublisherPhone,\n"
                        + "    c.CategoryID, \n"
                        + " b.BookStatus "
                        + "FROM \n"
                        + "    Book b\n"
                        + "LEFT JOIN \n"
                        + "    Author a ON a.AuthorID = b.AuthorID\n"
                        + "LEFT JOIN \n"
                        + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                        + "LEFT JOIN \n"
                        + "    BookCategory c ON b.BookID = c.BookID\n"
                        + "ORDER BY b.BookID OFFSET ?\n"
                        + "ROWS FETCH NEXT 8 ROWS ONLY";
            } else {
                query = "SELECT DISTINCT\n"
                        + "    b.BookID,\n"
                        + "    b.BookTitle,\n"
                        + "    b.BookCost,\n"
                        + "    b.Stock,\n"
                        + "    b.BookRate,\n"
                        + "    b.BookDesc,\n"
                        + "    a.AuthorID,\n"
                        + "    a.AuthorName,\n"
                        + "    a.Bio,\n"
                        + "    p.PublisherID,\n"
                        + "    p.PublisherName,\n"
                        + "    p.PublisherEmail,\n"
                        + "    p.PublisherPhone,\n"
                        + "    c.CategoryID, \n"
                        + " b.BookStatus "
                        + "FROM \n"
                        + "    Book b\n"
                        + "LEFT JOIN \n"
                        + "    Author a ON a.AuthorID = b.AuthorID\n"
                        + "LEFT JOIN \n"
                        + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                        + "LEFT JOIN \n"
                        + "    BookCategory c ON b.BookID = c.BookID\n"
                        + "WHERE c.CategoryID = ? ORDER BY b.BookID OFFSET ?\n"
                        + "ROWS FETCH NEXT 8 ROWS ONLY";
            }

            stm = connection.prepareCall(query);
            if (cid == -1) {
                stm.setInt(1, (index - 1) * 8);
            } else {
                stm.setInt(1, cid);
                stm.setInt(2, (index - 1) * 8);
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("bookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public List<Book> pagingBookSubCategory(int index, int scid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID, \n"
                    + " b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID\n"
                    + "ORDER BY b.BookID OFFSET ?\n"
                    + "ROWS FETCH NEXT 8 ROWS ONLY";
            stm = connection.prepareCall(query);
            stm.setInt(1, scid);
            stm.setInt(2, (index - 1) * 8);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add((new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("bookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                )));
            }
             
        } catch (Exception e) {
        }
        return list;
    }

    public int Count() {
        try {
            String query = "select count(*) as cnt from [Book]";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
             
            while (rs.next()) {
                return rs.getInt("cnt");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int NumberOfSaledBook() {
        try {
            String query = "select count(*) as cnt from\n"
                    + "(select Quantity from OrderDetail d, [Order] o, OrderStatus s\n"
                    + "where d.OrderID = o.ID and o.StatusID = s.StatusID and s.StatusID = 3) as t";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
             
            while (rs.next()) {
                return rs.getInt("cnt");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Book> getBooksSortedByCate(String sortType, int cid, int index) {
        List<Book> list = new ArrayList<>();

        try {
            String query = "SELECT DISTINCT\n"
                    + "    b.BookID,\n"
                    + "    b.BookTitle,\n"
                    + "    b.BookCost,\n"
                    + "    b.Stock,\n"
                    + "    b.BookRate,\n"
                    + "    b.BookDesc,\n"
                    + "    a.AuthorID,\n"
                    + "    a.AuthorName,\n"
                    + "    a.Bio,\n"
                    + "    p.PublisherID,\n"
                    + "    p.PublisherName,\n"
                    + "    p.PublisherEmail,\n"
                    + "    p.PublisherPhone,\n"
                    + "    c.CategoryID, \n"
                    + " b.BookStatus "
                    + "FROM \n"
                    + "    Book b\n"
                    + "LEFT JOIN \n"
                    + "    Author a ON a.AuthorID = b.AuthorID\n"
                    + "LEFT JOIN \n"
                    + "    Publisher p ON p.PublisherID = b.PublisherID\n"
                    + "LEFT JOIN \n"
                    + "    BookCategory c ON b.BookID = c.BookID where c.CategoryID = ?\n";

            // Sắp xếp theo giá tiền (ASC hoặc DESC) tùy vào sortType
            if ("1".equals(sortType)) {
                query += "ORDER BY b.BookTitle ASC";
            } else if ("2".equals(sortType)) {
                query += "ORDER BY b.BookTitle DESC";
            } else if ("3".equals(sortType)) {
                query += "ORDER BY b.BookCost ASC";
            } else if ("4".equals(sortType)) {
                query += "ORDER BY b.BookCost DESC";
            } else if ("5".equals(sortType)) {
                query += "ORDER BY b.BookRate DESC";
            } else if ("6".equals(sortType)) {
                query += "ORDER BY b.BookRate ASC";
            }
            query += " OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";

            stm = connection.prepareCall(query);
            stm.setInt(1, cid);
            stm.setInt(2, (index - 1) * 8);
            rs = stm.executeQuery();

            while (rs.next()) {
                list.add(new Book(
                        rs.getInt("BookID"),
                        rs.getString("booktitle"),
                        rs.getFloat("bookcost"),
                        rs.getInt("stock"),
                        rs.getInt("bookrate"),
                        rs.getString("bookDesc"),
                        new Author(
                                rs.getInt("AuthorID"),
                                rs.getString("AuthorName"),
                                rs.getString("Bio")),
                        new Publisher(
                                rs.getInt("PublisherID"),
                                rs.getString("PublisherName"),
                                rs.getString("PublisherEmail"),
                                rs.getString("PublisherPhone")),
                        rs.getInt("BookStatus")
                ));
            }
             
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ nếu cần
        }

        return list;
    }

    public List<Book> sortBooks(List<Book> list, String sortType, int index) {
        // Sort the entire list
        switch (sortType) {
            case "1":
                Collections.sort(list, (b1, b2) -> b1.getTitle().compareTo(b2.getTitle()));
                break;
            case "2":
                Collections.sort(list, (b1, b2) -> b2.getTitle().compareTo(b1.getTitle()));
                break;
            case "3":
                Collections.sort(list, (b1, b2) -> Float.compare(b1.getCost(), b2.getCost()));
                break;
            case "4":
                Collections.sort(list, (b1, b2) -> Float.compare(b2.getCost(), b1.getCost()));
                break;
            case "5":
                Collections.sort(list, (b1, b2) -> Integer.compare(b2.getRate(), b1.getRate()));
                break;
            case "6":
                Collections.sort(list, (b1, b2) -> Integer.compare(b1.getRate(), b2.getRate()));
                break;
            default:
                break;
        }
        int startIndex = (index - 1) * 8;
        int endIndex = Math.min(startIndex + 8, list.size());
        return list.subList(startIndex, endIndex);
    }

    public void DeleteAuthor(String aid) {
        try {
            String query = "UPDATE Book SET AuthorID = ? WHERE AuthorID = ?";
            stm = connection.prepareCall(query);
            stm.setNull(1, Types.INTEGER);
            stm.setString(2, aid);
            stm.execute();
             
        } catch (Exception e) {
        }
    }

    public void DeletePublisher(String aid) {
        try {
            String query = "UPDATE Book SET PublisherID = ? WHERE PublisherID = ?";
            stm = connection.prepareCall(query);
            stm.setNull(1, Types.INTEGER);
            stm.setString(2, aid);
            stm.execute();
             
        } catch (Exception e) {
        }
    }

    public Book getSOBook() {

        try {
            String query = "select bookid, Amount as amount from discount where \n"
                    + "amount = (select max(Amount) from discount)";
            stm = connection.prepareCall(query);
            rs = stm.executeQuery();
             
            while (rs.next()) {
                return getById(rs.getInt("BookID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
