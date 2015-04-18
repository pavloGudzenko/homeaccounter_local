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
@Path("/account")
public class AccountRestful {
     @GET
    @Produces("application/json")
    public Response findAll() throws IOException {
        return Response.ok(getResults("SELECT * FROM accounts")).build();
    }
    
    
    @GET
    @Path("{account_id}")
    @Produces("application/json")
    public Response find(@PathParam("account_id") String income_id) throws IOException {
        return Response.ok(getResults("SELECT * FROM accounts WHERE account_id = ?", income_id)).build();
    }


    @POST
    @Consumes("application/json")
    @Produces("application/json")   
    public Response doPost(JsonObject json) {
          int rowsInserted = 0;
          Response response;                
                String account_name = json.getString("account_name");
                String description = json.getString("description");
         rowsInserted = doUpdate("INSERT INTO accounts (account_name, description) VALUES (?, ?)", account_name, description);
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
                        .add("account_id", Integer.toString(rs.getInt("account_id")))
                        .add("account_name", Integer.toString(rs.getInt("account_name")))
                        .add("description", Double.toString(rs.getDouble("description"))));              
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
    @Path("{account_id}")
    public Response remove(@PathParam("account_id") String account_id) {
        Response deleteResponse = null;
        int rowsDeleted = 0;
        
        rowsDeleted = doUpdate("DELETE FROM accounts WHERE account_id = ?", account_id);
        
        if (rowsDeleted == 0){
           deleteResponse = Response.status(500).build();
        } else {
           deleteResponse = Response.noContent().build();
        }
       return deleteResponse; 
    }
    

    @PUT
    @Path("{account_id}")
    @Consumes({"application/json"})
    @Produces({"application/json"})
    public Response edit(@PathParam("account_id") String account_id, JsonObject json) {
       int rowsUpdated = 0;
       Response response = null;
                String account_name = json.getString("account_name");
                String description = json.getString("description");
         rowsUpdated = doUpdate("UPDATE product SET account_name = ?, description =? WHERE account_id = ?", 
                                                 account_name, description, account_id);
           if (rowsUpdated == 0){
            response = Response.status(500).build();
           } else {
            response = Response.ok(json).build();
           }
           return response; 
    }
          
}
