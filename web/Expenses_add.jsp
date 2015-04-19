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
        <title>Expense</title>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="js/expense.js"></script>
    </head>
    <body>
        
            <section>

         <h1>Expenses Form</h1>
         
         <form>
        
         	<fieldset id="add_expense">
			  <legend> Add Expense</legend>
                          
                        <label for="account">Account</label>
                        <select id="account"></select>
                        <br>
                        <br>
                          
			  <label for="account_id">Account ID</label>
			  <input type="text" name="account_id" id="account_id">
                          <br>
                          <br>
			  
			  <label for="exp_amount">Expense Amount</label>
			  <input type="text" name="exp_amount" id="exp_amount">
                          <br>
                          <br>
			  
			  
			  <label for="exp_date">Expense Date</label>
			  <input type="date" name="exp_date" id="exp_date">
                          <br>
                          <br>
			  
			  <label for="exp_category">Expense Category</label>
			  <select id="exp_category" name="exp_category">
                                 <option> -- Select a Category -- </option>
			         <option id="1" class="category">Groceries</option>
				 <option id="2" class="category">Home Rent</option>
				 <option id="3" class="category">Car Insurance</option>
                                 <option id="4" class="category">Eating Out</option>
                                 <option id="5" class="category">Taxes/Fees</option>
			  </select>
                          <br>
                          <br>
                          
                    <input type="button" onclick="addExpense()" value="Add Expense"></button>
                    
		</fieldset>
          </form>
         
            </section>
        
         </body>
</html>
