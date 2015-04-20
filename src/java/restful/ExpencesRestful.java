/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package restful;

import credentials.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

/**
 *
 * @author c0650853
 */
@Path("/expense")
public class ExpencesRestful {
    @GET
    @Produces("application/json")
    public Response findAll() throws IOException {
        return Response.ok(getResults("SELECT expence_id, exp_ammount, exp_date, account_name, "
                + "exp_category_name FROM expences JOIN accounts USING(account_id) "
                + "JOIN exp_categories USING (exp_category_id) ORDER BY account_name, expence_id")).build();
    }
    
    
    @GET
    @Path("/list/{expense_id}")
    @Produces("application/json")
    public Response find(@PathParam("expense_id") String expence_id) throws IOException {
        return Response.ok(getResultsById("SELECT * FROM expences WHERE expence_id = ?", expence_id)).build();
    }


    @POST
    @Consumes("application/json")
    @Produces("application/json")
    
    public Response doPost(JsonObject json) {
          int rowsInserted = 0;
          Response response;
                String account_id = json.getString("account_id");
                String exp_amount = json.getString("exp_amount");
                String exp_category_id = json.getString("exp_category_id");
                String exp_date = json.getString("exp_date");
         rowsInserted = doUpdate("INSERT INTO expences (account_id, exp_ammount, exp_category_id, exp_date) VALUES (?, ?, ?, ?)", account_id, exp_amount, exp_category_id, exp_date);
           if (rowsInserted == 0){
            response = Response.status(500).build();
           } else {
            response = Response.ok(json).build();
           }
           return response;
    }
    

    private JsonArray getResults(String query, String... params) throws IOException {
        JsonArray JSONArray = null;

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= params.length; i++) {
                pstmt.setString(i, params[i - 1]);
            }        
            
            ResultSet rs = pstmt.executeQuery();
            
            JsonArrayBuilder jsonArray = Json.createArrayBuilder();
            while (rs.next()) {
                jsonArray.add(Json.createObjectBuilder()
                        .add("account_name", rs.getString("account_name"))
                        .add("expence_id", Integer.toString(rs.getInt("expence_id")))
                        .add("exp_amount", Double.toString(rs.getDouble("exp_ammount")))
                        .add("exp_category_name", rs.getString("exp_category_name"))
                        .add("exp_date", rs.getString("exp_date")));               
            }
            
            JSONArray = jsonArray.build();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(IncomeRestful.class.getName()).log(Level.SEVERE, null, ex);
        }
        return JSONArray;
    }
    
    
    private JsonArray getResultsById(String query, String... params) throws IOException {
        JsonArray JSONArray = null;

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= params.length; i++) {
                pstmt.setString(i, params[i - 1]);
            }
            
            ResultSet rs = pstmt.executeQuery();
            
            JsonArrayBuilder jsonArray = Json.createArrayBuilder();
            while (rs.next()) {
                jsonArray.add(Json.createObjectBuilder()
                        .add("account_id", Integer.toString(rs.getInt("account_id")))
                        .add("expence_id", Integer.toString(rs.getInt("expence_id")))
                        .add("exp_amount", Double.toString(rs.getDouble("exp_ammount")))
                        .add("exp_category_id", Integer.toString(rs.getInt("exp_category_id")))
                        .add("exp_date", rs.getString("exp_date")));              
            }
            
            JSONArray = jsonArray.build();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(IncomeRestful.class.getName()).log(Level.SEVERE, null, ex);
        }
        return JSONArray;
    }    

    private int doUpdate(String query, String... params) {
        int numChanges = 0;
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= params.length; i++) {
                pstmt.setString(i, params[i - 1]);
            }
            numChanges = pstmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(IncomeRestful.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numChanges;
    }
    
    
    @DELETE
    @Path("{expence_id}")
    public Response remove(@PathParam("expence_id") String expence_id) {
        Response deleteResponse = null;
        int rowsDeleted = 0;
        
        rowsDeleted = doUpdate("DELETE FROM expences WHERE expence_id = ?", expence_id);
        
        if (rowsDeleted == 0){
           deleteResponse = Response.status(500).build();
        } else {
           deleteResponse = Response.noContent().build();
        }
       return deleteResponse; 
    }
    

    @PUT
    @Path("{expence_id}")
    @Consumes({"application/json"})
    @Produces({"application/json"})
    public Response edit(@PathParam("expence_id") String expence_id, JsonObject json) {
       int rowsUpdated = 0;
       Response response = null;
                String account_id = json.getString("account_id");
                String exp_ammount = json.getString("exp_amount");
                String exp_category_id = json.getString("exp_category_id");
                String exp_date = json.getString("exp_date");
         rowsUpdated = doUpdate("UPDATE product SET account_id = ?, exp_ammount =?, exp_category_id = ? exp_date = ? WHERE expence_id = ?", 
                                                 account_id, exp_ammount, exp_category_id, exp_date, expence_id);
           if (rowsUpdated == 0){
            response = Response.status(500).build();
           } else {
            response = Response.ok(json).build();
           }
           return response; 
    }
        
}
