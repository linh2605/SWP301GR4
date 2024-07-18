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
import model.Publisher;

/**
 *
 * @author ACER
 */
public class PublisherDAO extends DBContext {
    
    private PreparedStatement stm;
    private ResultSet rs;
    private List<Publisher> list;

    public PublisherDAO() {
    }
    
    
    public List<Publisher> getAll() {
        list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Publisher";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Publisher p = new Publisher(
                        rs.getInt("PublisherID"),
                        rs.getString("PublisherName"),
                        rs.getString("PublisherEmail"),
                        rs.getString("PublisherPhone")
                );
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }


    public static void main(String[] args) {
        List<String> sList = new ArrayList();
        sList.add("a");
        sList.add("a");
        sList.add("a");
        sList.add("a");
        sList.add("a");
        String images = "";
        for (String i : sList) {
            images = images.concat(i + "|||||");
        }
        System.out.println(images);
    }

    public boolean add(Publisher p) {
        try {
            String query = "INSERT INTO Publisher(PublisherName, PublisherEmail, PublisherPhone) values (?, ?, ?)";
            stm = connection.prepareStatement(query);
            stm.setString(1, p.getName());
            stm.setString(2, p.getEmail());
            stm.setString(3, p.getPhone());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    
    }

    public boolean update(Publisher p) {
        try {
            String query = "UPDATE Publisher SET PublisherName = ?, PublisherEmail=?, PublisherPhone=? WHERE publisherid = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, p.getName());
            stm.setString(2, p.getEmail());
            stm.setString(3, p.getPhone());
            stm.setInt(4, p.getId());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    
    }
    
    public int maxId() {
        try {
            String query = "SELECT MAX(PublisherID) as max FROM Publisher";
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

    public Publisher getById(int id) {
        try {
            String query = "SELECT * FROM Publisher WHERE PublisherID = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Publisher p = new Publisher(
                        rs.getInt("PublisherID"),
                        rs.getString("PublisherName"),
                        rs.getString("PublisherEmail"),
                        rs.getString("PublisherPhone")
                );
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    
    }

    public void delete(String pid) {
        try {
            String query = "DELETE FROM Publisher WHERE publisherid = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, pid);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
}
