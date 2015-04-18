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
	    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
	
	
            <section id="login_section">
		<form action="LoginServlet">
                    
                  <fieldset id="login">
		    <legend>Please Login</legend>

			 
                        <label for="user_name">Username</label>
			<input type="text" name="user_name" id="user_name"/>
                        </br>	

		
                        <label for="pass">Password</label>
			<input type="password" name="pass" id="pass"/>
			</br>		

			<input type="submit" value="Sign In">
                  </fieldset>  
		
		</form>
            </section>    
	</body>
</html>
