/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderStatus;

/**
 *
 * @author ACER
 */
public class OrderStatusDAO extends DBContext  {
    
    PreparedStatement stm;
    ResultSet rs;
    List<OrderStatus> list;

    public OrderStatusDAO() {
    }
    
    public List<OrderStatus> getAll() {
        list = new ArrayList<>();
        try {
            String q = "select * from OrderStatus";
            stm = connection.prepareCall(q);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new OrderStatus(rs.getString("StatusID"), rs.getString("Name"), rs.getString("Description")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public OrderStatus getById(String pid) {
        try {
            String q = "select * from OrderStatus where StatusID = ?";
            stm = connection.prepareCall(q);
            stm.setString(1, pid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new OrderStatus(rs.getString("StatusID"), rs.getString("Name"), rs.getString("Description"));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        System.out.println(new OrderStatusDAO().getAll());
    }
}
