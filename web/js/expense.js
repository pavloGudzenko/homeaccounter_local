 $(document).ready(function(){

    
var id11;

    $.ajax({
        url: 'app/expense',
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        success: function(data) {

            $.each(data, function(key, item) {
                $("#table_expense").append("<tr id=" + item.expence_id + "><td><span id=name>" + item.account_name + "</span></td><td>" + item.exp_amount + "</td><td>" + item.exp_category_name + "</td><td>" + item.exp_date + "</td><td><input type='button' onclick='' id=" + item.expence_id + " class='deletethis' value='Delete'></button></td><td><input type='button' id=" + item.expence_id + " class='updatethis'  value='Update'></button></td></tr>");
            });
        }
    });
    
    
    $.ajax({
        url: 'app/account',
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
            success: function(data) {
            $("#account").append("<option id=0 class='account1'> --  <i>Select an Account</i>  -- </option>");
                $.each(data, function(key, item) {
                    $("#account").append("<option id="+item.account_id+">" + item.account_name + "</option>");
            });
        }
    });
    
     
        $.ajax({
        url: 'app/account',
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        success: function(data) {
            $("#account_2").append("<option id=0 class='account1'> --  <i>Select an Account</i>  -- </option>");
            alert('Ok');
            $.each(data, function(key, item) {
                $("#account_2").append("<option id=" + item.account_id + " class='account1'>" + item.account_name + "</option>");
            });
        }
    });
    
    
    
 $('#table_expense').on('click', '.updatethis', function() {
        id11 = $(this).attr('id');

        $("#forumupdate").dialog({
            autoOpen: true,
            height: 400,
            width: 400,
            modal: true,
            draggable: false,
            resizable: false,
            show: 'slide',
            open: function() {

                $.ajax({
                    url: 'app/expense/list/' + id11,
                    method: 'GET',
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function(data) {

                        $.each(data, function(key, item) {
                            alert(item.inc_amount);
                            $('#exp_amount_2').val(item.inc_amount);
                            $('#exp_date_2').val(item.inc_date);
                           $('#now').append("<input type='button'  tabindex='-1' id="+id11+" value='UPDATE' class='updatethisagain'/>");
                        });
                    }
                });

            },
            
            close: function() {
                $('#now').html("");
           
            }

        });

    });



$('#forumupdate').on('click', '.updatethisagain', function(){
       
        var id22=$(this).attr('id');
      
        updateIncome(id22);
    });
    
    
    
    
    
  
});


 




function getAllAccounts() {
    $.ajax({
       url: 'app/income/accounts',
       method: 'GET',  
       dataType: 'json', 
       success: function(json) {
             $.each(data, function(key, item) {
                    $("#account").append("<option id="+item.account_id+" class='account'>" + item.account_name + "</option>");
            });     
       }
    });
}



function addExpense() {
var account_id=$('#account').children(':selected').attr('id');
var category_id=$('#exp_category').children(':selected').attr('id');   
$.ajax({
    url: "app/expense", 
    method: "post",
    contentType: "application/json",
    dataType:"json",
    data: JSON.stringify({
                  'account_id' : account_id,
                  'exp_amount' : $('#exp_amount').val(),
                  'exp_category_id': category_id,
                  'exp_date': $('#exp_date').val()                 
          }),
    success: function(data)
    {
        alert("okay");
        location.href="http://localhost:8080/homeaccounter_local/Expenses_add.jsp";
    }
});


}