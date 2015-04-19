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
        <style>

            label, input { display:block; }
            input.text { margin-bottom:12px; width:95%; padding: .4em; }
            fieldset { padding:0; border:0; margin-top:25px; }
            h1 { font-size: 1.2em; margin: .6em 0; }
            div#users-contain { width: 350px; margin: 20px 0; }
            div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
            div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
            .ui-dialog .ui-state-error { padding: .3em; }
            .validateTips { border: 1px solid transparent; padding: 0.3em; }
            #forumupdate{
                display:none;
            }
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/income.js"></script>
    </head>
    <body>             
        <section>

            <h2>Add new Income</h2>

            <form>     
                <fieldset id="add_income">

                    <label for="account">Account</label>
                    <select id="account">
                    </select>
                    <br>
                    <br> 
                    <label for="income_amount">Income Amount</label>
                    <input type="text" name="income_amount" id="income_amount">
                    <br>


                    <label for="income_date">Income Date</label>
                    <input type="date" name="income_date" id="income_date">
                    <br>

                    <label for="income_category">Income Category</label>
                    <select id="income_category" name="income_category">
                        <option> -- Select a Category -- </option>
                        <option id="1" class="category">Salary</option>
                        <option id="2" class="category">Gift</option>
                        <option id="3" class="category">Other</option>
                    </select>
                    <br>
                    <br>



                    <input type="button" onclick="addIncome()" value="Add Income"></button>

                </fieldset>
            </form>

        </section>
        <br>
        <h1>All Incomes</h1>

        <div id="income_show">
            <table id="table_income" border="1">
                <th>Account</th>
                <th>Income Amount</th>
                <th>Income Category</th>
                <th>Income Date</th>
                <th colspan="2">To Change</th>
            </table>    
        </div>  


        <form id="forumupdate">
            <fieldset>
                <legend></legend>  
                <label for="account_2">Account</label>
                <select id="account_2" value="" class="text ui-widget-content ui-corner-all">

                </select>
                <label for="income_amount">Income Amount</label>
                <input type="text" name="income_amount" id="income_amount_2" value="" class="text ui-widget-content ui-corner-all">
                <label for="income_date">Income Date</label>
                <input type="text" name="income_date" id="income_date_2" value="" class="text ui-widget-content ui-corner-all">
                <label for="income_category">Income Category</label>
                <select id="income_category_2" name="income_category" value="" class="text ui-widget-content ui-corner-all">
                    <option> -- Select a Category -- </option>
                    <option id="1" class="category">Salary</option>
                    <option id="2" class="category">Gift</option>
                    <option id="3" class="category">Other</option>
                </select>

                <!-- Allow form submission with keyboard without duplicating the dialog button -->
                <div id="now"></div>
            </fieldset>
        </form>


    </body>
</html>
