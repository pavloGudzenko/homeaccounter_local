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
        <title>Account</title>
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
            body{
                background-image: url("back.png");  
                background-repeat: repeat-y;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/account.js"></script>

    </head>
    <body>
        <section>

            <div id="accout_show">
                <table id="table_account" border="1">
                    <th>Account Name</th>
                    <th>Income Amount</th>
                    <th>Expense Amount</th>
                    <th>Balance</th>
                    <th>Account Description</th>
                    <th>Delete Account</th>
                </table>    
            </div>        

            
            <h1>Account Form</h1>

            <form>

                <fieldset id="add_account">

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
            
            
        <form id="forumdelete">
            <fieldset> 
                <div id="nowDelete"></div>
            </fieldset>
        </form>

        </section>

    </body>


</html>
