<%-- 
    Document   : login_page
    Created on : 8-Apr-2015, 10:02:13 PM
    Author     : c0650853
--%>

<%@page  language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
		<form action="LoginServlet">

			Please enter your username 		
			<input type="text" name="user_name"/><br>		
		
			Please enter your password
			<input type="text" name="pass"/>
			
			<input type="submit" value="submit">			
		
		</form>
	</body>
</html>
