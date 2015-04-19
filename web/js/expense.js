 $(document).ready(function(){

    
//    $.ajax({
//       url: 'app/account',
//       method: 'GET',  
//       dataType: 'json', 
//      contentType:'application/json',
//    success: function( data ) {
//         
//      $.each(data, function(key, item){ 
//        $("#table_account").append("<tr><td>"+item.account_name+"</td><td>"+item.description+"</td></tr>");
//      });
//  }
//});
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