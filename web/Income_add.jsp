<%-- 
    Document   : Income_add
    Created on : 17-Apr-2015, 4:28:16 PM
    Author     : c0650853
--%>

<%@page import="beans.UserBean"%>
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
            table { margin: 1em 0; border-collapse: collapse; width: 100%; }
            table td { border: 1px solid green; padding: .6em 10px; text-align: left; }
            table th { border: 1px solid green; padding: .6em 10px; text-align: left; background-color: #F0F0B2;}
            .ui-dialog .ui-state-error { padding: .3em; }
            .validateTips { border: 1px solid transparent; padding: 0.3em; }
            #forumupdate{
                display:none;
            }
            #forumdelete{
                display:none;
            }
            #user{
                display:none;
            }
            body{
                background-image: url("back.png");  
                background-repeat: repeat-y;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            
                        .button {
                -moz-box-shadow: 0px 10px 14px -7px #3e7327;
                -webkit-box-shadow: 0px 10px 14px -7px #3e7327;
                box-shadow: 0px 10px 14px -7px #3e7327;
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77b55a), color-stop(1, #72b352));
                background:-moz-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:-webkit-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:-o-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:-ms-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b55a', endColorstr='#72b352',GradientType=0);
                background-color:#77b55a;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;
                border:1px solid #4b8f29;
                display:inline-block;
                cursor:pointer;
                color:#ffffff;
                font-family:arial;
                font-size:13px;
                font-weight:bold;
                padding:6px 12px;
                text-decoration:none;
                text-shadow:0px 1px 0px #5b8a3c;
            }
            .button:hover {
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #72b352), color-stop(1, #77b55a));
                background:-moz-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:-webkit-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:-o-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:-ms-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#72b352', endColorstr='#77b55a',GradientType=0);
                background-color:#72b352;
            }
            .button:active {
                position:relative;
                top:1px;
            }

            #new_income{
                border: solid 1px #3e7327;
                width: 300px;
                margin: 15px;
                padding-left:25px;
                padding-bottom: 25px;
            }
                       #nav_bar {
                clear: left;
                margin: 0;
                padding: 0;

            }
            #nav_bar ul {
                list-style: none;
                padding: .5em 1em .5em 0;
                margin-bottom: 0;
                border-top: 1px solid green;

            }
            #nav_bar li {
                display: inline;
                padding: .2em 1.5em;
                border-right: 1px solid green;
            }

            #nav_bar a {
                color: black;
                font-weight: bold;

            }
            #nav_bar a.current { 
                text-decoration: none;
            }	

            #nav_bar a:hover, a:focus{ 
                font-weight: bold;
                color: #631963;
            }

            header 
            {
                border-bottom: 1px solid green;

                background: -moz-linear-gradient(45deg, white 0%, #B297DB 75%, black 100%);
                background: -webkit-linear-gradient(45deg, white 0%, #B297DB 75%, black 100%);
                background: -o-linear-gradient(45deg, white 0%,  #B297DB 75%, black 100%);
                background: linear-gradient(45deg, white 0%, #B297DB 75%, black 100%);
                padding-left: 0;
                padding-right: 0;
                padding-top: 1px;
                padding-bottom: 0;
            }	
            header h1 {
                margin-bottom: 0;
                margin-top: 0.5em;
            }
            header h2 {
                margin-top: 0;
                padding-bottom: 0.25em;
            }

        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/income.js"></script>
    </head>
    <body>       
        <header>
            <nav id = "nav_bar">
                <center>
                    <ul>
                        <li><a href="Account_add.jsp">Accounts</a></li>
                        <li><a href="Income_add.jsp">Incomes</a></li>
                        <li><a href="Expenses_add.jsp">Expenses</a></li>
                    </ul>
                </center>
            </nav>  
        </header>
        <section>

            <%UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));%>
            <div id="ds">
                <input type="text" value="<%= currentUser.getUsername()%>" id="user">
            </div>

            <h2>Add new Income</h2>

            <form id="new_income">     
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



                    <input type="button" onclick="addIncome()" value="Add Income" class="button"></button>

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
                <input type="date" name="income_date" id="income_date_2" value="" class="text ui-widget-content ui-corner-all">
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


        <form id="forumdelete">
            <fieldset> 
                <div id="nowDelete"></div>
            </fieldset>
        </form>


    </body>
</html>
