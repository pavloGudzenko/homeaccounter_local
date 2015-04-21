$(document).ready(function(){

    
    $.ajax({
       url: 'app/account',
       method: 'GET',  
       dataType: 'json', 
      contentType:'application/json',
    success: function( data ) {
         
      $.each(data, function(key, item){ 
        $("#table_account").append("<tr><td>"+item.account_name+"</td><td>"+item.inc_ammount+"</td><td>"+item.exp_ammount+"</td><td>"+item.balance+"</td><td>"+item.description+"</td><td><input type='button' onclick='' value='Delete'></button></td></tr>");
      });
  }
});


    $.ajax({
        url: 'app/account',
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
            success: function(data) {
                $.each(data, function(key, item) {
                    $("#account").append("<option id="+item.account_id+">" + item.account_name + "</option>");
            });
        }
    });
    
    
    
    


    
});







function addAccount() {
alert("KK");
$.ajax({
    url: "app/account", 
    method: "post",
    contentType: "application/json",
    dataType:"json",
    data: JSON.stringify({
                  'account_name' : $('#account_name').val(),
                  'description': $('#description').val()             
          }),
    success: function(data)
    {
        alert("okay");
    }
});


}



$.ajax({
       url: 'app/income/accounts',
       method: 'GET',  
       dataType: 'json', 
    success: function( data ) {
        $.each(data.Users, function(index, item) { // Iterates through a collection
        $("#account").append( // Append an object to the inside of the select box
            $("<option></option>") // Yes you can do this.
                .val(item.account_name)
        );
    });
    }
});


//$(document).ready(function() {
//    
//  $("#addIncome").click(function(){  
//      alert("KK");
//    $.ajax({
//        url: "app/income",
//        method: "post",
//        contentType: "application/json",
//        dataType: "json",
//        data: JSON.stringify({
//            'account_id': $('#account').val(),
//            'inc_amount': $('#income_amount').val(),
//            'inc_category_id': $('#income_category').val(),
//            'inc_date': $('#income_date').val()
//
//        }),
//        success: function(data)
//        {
//            alert("okay");
//        }
//    });
//  });
//});
