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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="js/account.js"></script>
    </head>
    <body>
            <section>

         <h1>Account Form</h1>
         
         <form>
        
         	<fieldset id="add_account">
			  <legend> Add Account</legend>
                          
                          <label for="account">Account</label>
                          <select id="account"></select>
                          <br>
                          <br>
			  
			  <label for="account_name">Account Name</label>
			  <input type="text" name="account_name" id="account_name">
                          <br>
                          <br>
			  
                          <label for="description">Description</label>
			  <textarea name="description" id="description"></textarea>

                          <br>
                          <br>
                          
                    <input type="button" onclick="addAccount()" value="Add Income"></button>
                    
		</fieldset>
          </form>
         
            </section>
        
         </body>
         
      <script type="text/JavaScript">
        //get a reference to the select element
         var $select = $('#account');
        //request the JSON data and parse into the select element
        $.ajax({
          url: 'app/account',
          method: 'GET'
          dataType:'JSON',
          success:function(data){
            //clear the current content of the select
            $select.html('');
            //iterate over the data and append a select option
            $.each(json, function(key, val){
              $select.append('<option id="' + val.account_id + '">' + val.account_name + '</option>');
            })
          },
          error:function(){</strong>
            //if there is an error append a 'none available' option
            $select.html('<option id="-1">none available</option>');
          }
        });
  </script>  
  
</html>
