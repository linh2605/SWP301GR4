package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;
    
//    public Connection getConnection() {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            String url = "jdbc:mysql://localhost:3306/SportShopOnline";
//            String user = "root";
//            String password = "123456";
//            connection = DriverManager.getConnection(url, user, password);
//            return connection;
//        } catch (SQLException | ClassNotFoundException e) {
//            System.err.println("Error " + e.getMessage() + " at DBContext");
//            return null;
//        }
//    }
    public DBContext() {
        try {
            String url = "jdbc:mysql://localhost:3306/SportShopOnline";
            String username = "root";
            String password = "123456"; // Thay doi tren tung may
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
      
}
