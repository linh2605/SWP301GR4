/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author zzako
 */
public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
            if (instance == null || instance.trim().isEmpty()) {
                url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
            }
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, userID, password);
            System.out.println("===== CONNECTED DB: " + connection + "=====\n");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    private final String serverName = "localhost";
    private final String dbName = "SportShopOnline"; //Database name is HERE  <==
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "trung2003";
    
    
    //test connection
    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println(db.connection);
    }

}
