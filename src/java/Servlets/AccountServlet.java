/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import credentials.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;


/**
 *
 * @author c0650853
 */

@WebServlet("/account")
public class AccountServlet extends HttpServlet{
  
    
       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Content-Type", "text/plain-text");
        try (PrintWriter out = response.getWriter()) {
            if (!request.getParameterNames().hasMoreElements()) {
                // There are no parameters at all
              //  out.println(getResults("SELECT account_name FROM accounts"));
            } else {

                String account_name = request.getParameter("account_name");
              //  out.println(getResults("SELECT account_name FROM accounts WHERE account_name = ?", account_name));
            }
        } catch (IOException ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
        private String getResults(String query, String... params) throws IOException, ClassNotFoundException {
        StringBuilder sb = new StringBuilder();
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= params.length; i++) {
                pstmt.setString(i, params[i - 1]);
            }
            ResultSet rs = pstmt.executeQuery();
            sb.append("[");
            while (rs.next()) {

//                JsonObject JSON = new JsonObject();                
//               // JSON.put("account_id", rs.getInt("account_id"));
//                JSON.put("account_name", rs.getString("account_name"));
//               // JSON.put("description", rs.getString("description"));
//                
//                StringWriter output = new StringWriter();
//                JSON.writeJSONString(output);
//
//                String result = output.toString();
//
//                sb.append(result); 
//                sb.append("\n");
                
            }
            sb.append("]");
        } catch (SQLException ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb.toString();
    }
    
    
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Set<String> keySet = request.getParameterMap().keySet();
        try (PrintWriter out = response.getWriter()) {
            if (keySet.contains("account_name") && keySet.contains("description")) {

                String account_name = request.getParameter("account_name");
                String description = request.getParameter("description");
                doUpdate("INSERT INTO accounts (account_name, description) VALUES (?, ?)", account_name, description);
            } else {
                // There are no parameters at all
                out.println("Error: Not enough data to input.");
            }
        } catch (IOException ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
       private int doUpdate(String query, String... params) {
        int numChanges = 0;
//        try (
//                Connection conn = DBConnection.getConnection()) {
//            PreparedStatement pstmt = conn.prepareStatement(query);
//            for (int i = 1; i <= params.length; i++) {
//                pstmt.setString(i, params[i - 1]);
//            }
//            numChanges = pstmt.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return numChanges;
    }
    
}
