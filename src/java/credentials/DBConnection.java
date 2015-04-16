/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package credentials;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author c0650853
 */
public class DBConnection {
      public static Connection getConnection() throws ClassNotFoundException {
        Connection conn = null;
       try {
//             String hostname = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
//             String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
//             String username = System.getenv("adminHS3QcFF");
//             String password = System.getenv("fUk1m4ggUedy");
//
//        String jdbc = "jdbc:mysql://" + hostname + ":" + port + "/homeaccounter";
//        conn =  DriverManager.getConnection(jdbc, username, password);
            
          Class.forName("com.mysql.jdbc.Driver");
            String jdbc = "jdbc:mysql://localhost/homeaccounter";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(jdbc, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
        // http://homeaccounter-homeaccounterpr.rhcloud.com/
    }
}
