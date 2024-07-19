/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.PayMethod;

/**
 *
 * @author ACER
 */
public class PayMethodDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<PayMethod> list;

    public PayMethodDAO() {
    }

    public List<PayMethod> getPaymethods() {
        list = new ArrayList<>();
        try {
            String q = "select * from PaymentMethod";
            stm = connection.prepareCall(q);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new PayMethod(rs.getString("PaymentMethodID"), rs.getString("Name"), rs.getString("Description")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public PayMethod getById(String paymethodid) {
        try {
            String q = "select * from PaymentMethod where paymentmethodid = ?";
            stm = connection.prepareCall(q);
            stm.setString(1, paymethodid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return (new PayMethod(rs.getString("PaymentMethodID"), rs.getString("Name"), rs.getString("Description")));
            }
        } catch (Exception e) {
        }
        return null;

    }

}
