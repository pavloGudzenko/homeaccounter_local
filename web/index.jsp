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
        <link rel="stylesheet" type="text/css" href="main_css.css" />   
    </head>
    <body>

        <section class="container">
            <div class="login">
                <h1>Login to HomeAccounter</h1>
		<form action="LoginServlet">
		
			<input type="text" name="user_name" placeholder="enter username"/><br>		
		
			<input type="password" name="pass" placeholder="enter password"/>
			
			<input type="submit" value="submit">			
		
		</form>
            </div>
        </section>    
    </body>
</html>
