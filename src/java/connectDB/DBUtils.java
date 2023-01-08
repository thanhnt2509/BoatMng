/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectDB;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Legion
 */
public class DBUtils {

    public static Connection makeConnection() throws Exception {
        Connection conn= null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url= "jdbc:sqlserver://localhost:1433;databaseName=BoatManagement9";
        conn= DriverManager.getConnection(url, "sa", "12345");
        return conn;
    }
    
}
