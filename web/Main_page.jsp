<%-- 
    Document   : Main_page
    Created on : 17-Apr-2015, 9:52:19 PM
    Author     : c0650853
--%>

<%@page import="beans.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomeAccounter</title>
    </head>
    <body>
     <%UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));%>
            <div id="ds">
                <h3>Welcome, <%= currentUser.getFirstName() + " " + currentUser.getLastName()%></h3>
                </div>
        <h1>HomeAccounter</h1>
        <br>
        <br>
        <a href="Account_add.jsp">Create New Account</a>  
        <br>
        <a href="Income_add.jsp">Add New Income</a>   
        <br>
        <a href="Expenses_add.jsp">Add New Expense</a>  
    </body>
</html>
