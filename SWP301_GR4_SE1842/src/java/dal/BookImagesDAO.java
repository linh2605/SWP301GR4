/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.BookImage;

/**
 *
 * @author ACER
 */
public class BookImagesDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<BookImage> list;

    public List<BookImage> getImagesOfBook(int bookid) {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Images WHERE BookID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, bookid);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new BookImage(
                        rs.getInt("ImageID"),
                        rs.getString("image"))
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean addBookImage(int bookid, String image) {
        try {
            String query = "INSERT INTO Images (Image, bookid) VALUES (?, ?)";
            stm = connection.prepareStatement(query);
            stm.setString(1, image);
            stm.setInt(2, bookid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void deleteExistingImage(int bookid) {
        try {
            String delete = "DELETE FROM Images WHERE BookID = ?";
            stm = connection.prepareStatement(delete);
            stm.setInt(1, bookid);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BookImage getImage(int bookid, int index) {
        try {
            String query = "WITH NumberedRows AS (\n"
                    + "    SELECT *, ROW_NUMBER() OVER (ORDER BY ImageID) AS rn\n"
                    + "    FROM Images\n"
                    + "    WHERE BookID = ?\n"
                    + ")\n"
                    + "SELECT * FROM NumberedRows WHERE rn = ?;";
            stm = connection.prepareStatement(query);
            stm.setInt(1, bookid);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                return (new BookImage(
                        rs.getInt("ImageID"),
                        rs.getString("image"))
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        BookImagesDAO bid = new BookImagesDAO();
        bid.deleteExistingImage(1);
    }

}
