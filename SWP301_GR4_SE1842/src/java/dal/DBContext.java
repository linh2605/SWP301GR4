package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/SportShopOnline";
            String user = "root";
            String password = "Tu@n12345";
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error " + e.getMessage() + " at DBContext");
            return null;
        }
    }
    
    public static void main(String[] args) {
        System.out.println(new DBContext().getConnection());
    }
      
}
