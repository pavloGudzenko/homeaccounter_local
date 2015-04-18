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



function addExpense() {
alert("KK");
$.ajax({
    url: "app/expense", 
    method: "post",
    contentType: "application/json",
    dataType:"json",
    data: JSON.stringify({
                  'account_id' : $('#account_id').val(),
                  'exp_amount' : $('#exp_amount').val(),
                  'exp_category_id': $('#exp_category').val(),
                  'exp_date': $('#exp_date').val()                 
          }),
    success: function(data)
    {
        alert("okay");
    }
});


}