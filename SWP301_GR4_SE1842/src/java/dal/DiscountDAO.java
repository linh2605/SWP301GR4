/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author THTP
 */
public class DiscountDAO extends DBContext {

    public ArrayList<Discount> getAllDiscount() {
        ArrayList<Discount> discounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Discount]";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                discounts.add(new Discount(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getFloat(3),
                        rs.getDate(4), rs.getDate(5),rs.getBoolean(6))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return discounts;
    }
   
    public Discount getDiscountByBookId(String bookid) {
        try {
            String query = "SELECT  [DiscountID]\n"
                    + "      ,[BookID]\n"
                    + "      ,[Amount]\n"
                    + "      ,[StartDate]\n"
                    + "      ,[EndDate],status\n"
                    + "  FROM [BookShopOnline].[dbo].[Discount] where status=1 and   GETDATE() between [StartDate] and [EndDate]  and [BookID] =  " + bookid;
            PreparedStatement stm = connection.prepareCall(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Discount(rs.getInt(1),
                        rs.getInt(2),
                        rs.getFloat(3),
                        rs.getDate(4), rs.getDate(5),rs.getBoolean(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Discount getDetailDiscount(String did) {

        try {
            String sql = "SELECT * FROM [Discount] "
                    + "where DiscountID = " + did;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Discount discounts = new Discount(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getFloat(3),
                        rs.getDate(4), rs.getDate(5),rs.getBoolean(6));
                return discounts;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int deleteDiscount(int discountId) {
    try {
        String sql = "DELETE FROM [dbo].[Discount] WHERE [DiscountID] = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, discountId);
        return preparedStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        return 0;
    }
}

    public int addDiscount(String bookId, String amount, String fromdate, String toDate) {
        try {
            String sql = "INSERT INTO [dbo].[Discount]\n"
                    + "           ([BookID]\n"
                    + "           ,[Amount]\n"
                    + "           ,[StartDate]\n"
                    + "           ,[EndDate],status)\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,1)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookId);
            preparedStatement.setString(2, amount);
            preparedStatement.setString(3, fromdate);
            preparedStatement.setString(4, toDate);
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int updateDiscount(String bookId, String amount, String fromdate, String toDate, String did) {
        try {
            String sql = "UPDATE [dbo].[Discount]\n"
                    + "   SET [BookID] = ?\n"
                    + "      ,[Amount] = ?\n"
                    + "      ,[StartDate] = ?\n"
                    + "      ,[EndDate] = ?\n"
                    + " WHERE [DiscountID] = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookId);
            preparedStatement.setString(2, amount);
            preparedStatement.setString(3, fromdate);
            preparedStatement.setString(4, toDate);
            preparedStatement.setString(5, did);
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    
    public int changeDiscountStatus(String status,String did) {
        try {
            String sql = "UPDATE [dbo].[Discount]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE [DiscountID] = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, did);
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }


}
