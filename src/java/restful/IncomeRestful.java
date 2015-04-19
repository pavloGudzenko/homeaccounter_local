/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package restful;

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
import credentials.DBConnection;

/**
 *
 * @author c0650853
 */
@Path("/income")
public class IncomeRestful {
   @GET
    @Produces("application/json")
    public Response findAll() throws IOException {
        return Response.ok(getResults("SELECT income_id, inc_ammount, inc_date, account_name, "
                + "inc_category_name FROM incomes JOIN accounts USING(account_id) "
                + "JOIN inc_categories USING (inc_category_id) ORDER BY account_name, income_id")).build();
    }
    
    
    @GET
    @Path("/list/{income_id}")
    @Produces("application/json")
    public Response find(@PathParam("income_id") String income_id) throws IOException {
        return Response.ok(getResultsById("SELECT * FROM incomes WHERE income_id = ?", income_id)).build();
    }


    @POST
    @Consumes("application/json")
    @Produces("application/json")
    
    public Response doPost(JsonObject json) {
          int rowsInserted = 0;
          Response response;
                String account_id = json.getString("account_id");
                String inc_amount = json.getString("inc_amount");
                String inc_category_id = json.getString("inc_category_id");
                String inc_date = json.getString("inc_date");
         rowsInserted = doUpdate("INSERT INTO incomes (account_id, inc_ammount, inc_category_id, inc_date) VALUES (?, ?, ?, ?)", account_id, inc_amount, inc_category_id, inc_date);
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
                        .add("income_id", Integer.toString(rs.getInt("income_id")))
                        .add("inc_amount", Double.toString(rs.getDouble("inc_ammount")))
                        .add("inc_category_name", rs.getString("inc_category_name"))
                        .add("inc_date", rs.getString("inc_date")));              
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
                        .add("income_id", Integer.toString(rs.getInt("income_id")))
                        .add("inc_amount", Double.toString(rs.getDouble("inc_ammount")))
                        .add("inc_category_id", Integer.toString(rs.getInt("inc_category_id")))
                        .add("inc_date", rs.getString("inc_date")));              
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
    @Path("{income_id}")
    public Response remove(@PathParam("income_id") String income_id) {
        Response deleteResponse = null;
        int rowsDeleted = 0;
        
        rowsDeleted = doUpdate("DELETE FROM incomes WHERE income_id = ?", income_id);
        
        if (rowsDeleted == 0){
           deleteResponse = Response.status(500).build();
        } else {
           deleteResponse = Response.noContent().build();
        }
       return deleteResponse; 
    }
    

    @PUT
    @Path("/list/{income_id}")
    @Consumes({"application/json"})
    @Produces({"application/json"})
    public Response edit(@PathParam("income_id") String income_id, JsonObject json) {
       int rowsUpdated = 0;
       Response response = null;
                String account_id = json.getString("account_id");
                String inc_ammount = json.getString("inc_amount");
                String inc_category_id = json.getString("inc_category_id");
                String inc_date = json.getString("inc_date");
         rowsUpdated = doUpdate("UPDATE incomes SET account_id = ?, inc_ammount =?, inc_category_id = ?, inc_date = ? WHERE income_id = ?", 
                                                 account_id, inc_ammount, inc_category_id, inc_date, income_id);
           if (rowsUpdated == 0){
            response = Response.status(500).build();
           } else {
            response = Response.ok(json).build();
           }
           return response; 
    }
        
}
