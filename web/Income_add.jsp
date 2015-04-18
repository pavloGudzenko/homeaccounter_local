<%-- 
    Document   : Income_add
    Created on : 17-Apr-2015, 4:28:16 PM
    Author     : c0650853
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Income</title>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="js/income.js"></script>
    </head>
    <body>
            <section>

         <h1>Income Form</h1>
         
         <form>
        
         	<fieldset id="add_income">
			  <legend> Add Income</legend>
                          
                          <label for="account">Account</label>
                          <select name="account" id="account">
                                 <option></option>
                          </select>
                          <br>
                          <br>
			  
			  <label for="income_amount">Income Amount</label>
			  <input type="text" name="income_amount" id="income_amount">
                          <br>
                          <br>
			  
			  
			  <label for="income_date">Income Date</label>
			  <input type="date" name="income_date" id="income_date">
                          <br>
                          <br>
			  
			  <label for="income_category">Income Category</label>
			  <select id="income_category" name="income_category">
                                 <option> -- Select category -- </option>
                                 <option>1</option>
			         <option>Salary</option>
				 <option>Gift</option>
				 <option>Other</option>
			  </select>
                          <br>
                          <br>
                          
                    <input type="button" onclick="addIncome()" value="Add Income"></button>
                    
		</fieldset>
          </form>
         
            </section>
        
         </body>
</html>
