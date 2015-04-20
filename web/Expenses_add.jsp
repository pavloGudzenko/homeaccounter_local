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
        <br>
        <h1>All Expenses</h1>

        <div id="expense_show">
            <table id="table_expense" border="1">
                <th>Account</th>
                <th>Expense Amount</th>
                <th>Expense Category</th>
                <th>Expense Date</th>
                <th colspan="2">To Change</th>
            </table>    
        </div>  


        <form id="forumupdate">
            <fieldset>
                <legend></legend>  
                <label for="account_2">Account</label>
                <select id="account_2" value="" class="text ui-widget-content ui-corner-all">

                </select>
                <label for="exp_amount_2">Income Amount</label>
                <input type="text" name="exp_amount_2" id="exp_amount_2" value="" class="text ui-widget-content ui-corner-all">
                <label for="exp_date_2">Income Date</label>
                <input type="date" name="exp_date_2" id="exp_date_2" value="" class="text ui-widget-content ui-corner-all">
                <label for="exp_category_2">Income Category</label>
                <select id="exp_category_2" name="exp_category_2" value="" class="text ui-widget-content ui-corner-all">
                        <option> -- Select a Category -- </option>
                        <option id="1" class="category">Groceries</option>
                        <option id="2" class="category">Home Rent</option>
                        <option id="3" class="category">Car Insurance</option>
                        <option id="4" class="category">Eating Out</option>
                        <option id="5" class="category">Taxes/Fees</option>
                </select>

                <!-- Allow form submission with keyboard without duplicating the dialog button -->
                <div id="now"></div>
            </fieldset>
        </form>
        
        
        
        <form id="forumdelete">
            <fieldset>
                <p>Do you want to delete chosen Expense?</p>  
                <div id="nowDelete"></div>
            </fieldset>
        </form>



    </body>
</html>
