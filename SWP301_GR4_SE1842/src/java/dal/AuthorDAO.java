/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Author;

/**
 *
 * @author ACER
 */
public class AuthorDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<Author> list;

    public AuthorDAO() {
    }

    public List<Author> getAll() {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Author";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Author a = new Author(
                        rs.getInt("AuthorID"),
                        rs.getString("AuthorName"),
                        rs.getString("Bio")
                );
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean update(Author author) {
        try {
            String query = "UPDATE Author SET authorname = ?, bio = ? WHERE authorid = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, author.getName());
            stm.setString(2, author.getBio());
            stm.setInt(3, author.getId());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public boolean update(String aid,String name, String Bio) {
        try {
            String query = "UPDATE Author SET authorname = ?, bio = ? WHERE authorid = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, Bio);
            stm.setString(3, aid);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean add(Author author) {
        try {
            String query = "INSERT INTO Author(authorname, bio) values (?, ?)";
            stm = connection.prepareStatement(query);
            stm.setString(1, author.getName());
            stm.setString(2, author.getBio());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
     public boolean add(String name,String Bio) {
        try {
            String query = "INSERT INTO Author(authorname, bio) values (?, ?)";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, Bio);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public int maxId() {
        try {
            String query = "SELECT MAX(AuthorID) as max FROM Author";
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

    public Author getById(int authorid) {
        try {
            String query = "SELECT * FROM Author WHERE AuthorID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, authorid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Author a = new Author(
                        rs.getInt("AuthorID"),
                        rs.getString("AuthorName"),
                        rs.getString("Bio")
                );
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
     public Author getById(String authorid) {
        try {
            String query = "SELECT * FROM Author WHERE AuthorID = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, authorid);
            rs = stm.executeQuery();
            while (rs.next()) {
                    Author a = new Author(
                        rs.getInt("AuthorID"),
                        rs.getString("AuthorName"),
                        rs.getString("Bio")
                );
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        AuthorDAO ad = new AuthorDAO();
        System.out.println(ad.getAll().get(0).getName());
    }

    public void delete(String aid) {
        try {
            String query = "DELETE FROM Author WHERE authorid = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, aid);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

}
