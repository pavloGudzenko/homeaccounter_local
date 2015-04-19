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
         <script src="js/account.js"></script>

    </head>
    <body>
        <section>

            <div id="accout_show">
                <table id="table_account" border="1">
                    <th>Account Name</th>
                    <th>Account Description</th>
                    <th colspan="2">To Change</th>
                </table>    
            </div>        






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


</html>
