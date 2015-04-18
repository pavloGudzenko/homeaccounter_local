function getAllAccounts() {
    $.ajax({
       url: 'app/income/accounts',
       method: 'GET',  
       dataType: 'json', 
       success: function(json) {
             $.each(json, function(i, value) {
            $('#account_select').append($('<option>').text(value).attr('value', value));
        });      
       }
    });
}



function addIncome() {
alert("KK");
$.ajax({
    url: "app/income", 
    method: "post",
    contentType: "application/json",
    dataType:"json",
    data: JSON.stringify({
                  'account_id' : $('#account').val(),
                  'inc_amount' : $('#income_amount').val(),
                  'inc_category_id': $('#income_category').val(),
                  'inc_date': $('#income_date').val()                 
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
