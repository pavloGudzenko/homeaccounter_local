$(document).ready(function(){

var id11;
    $.ajax({
       url: 'app/account/' + $("#user").val(),
       method: 'GET',  
       dataType: 'json', 
      contentType:'application/json',
    success: function( data ) {
         
      $.each(data, function(key, item){ 
        $("#table_account").append("<tr id=" + item.account_id + "><td>"+item.account_name+"</td><td>"+item.inc_ammount+"</td><td>"+item.exp_ammount+"</td><td>"+item.balance+"</td><td>"+item.description+"</td><td><input type='button' onclick='' id=" + item.account_id + " class='deletethis' value='Delete'></button></td></tr>");
      });
  }
});

    
    
        $('#table_account').on('click', '.deletethis', function() {
        id11 = $(this).attr('id');
   //     alert(id11+'  here');
        $("#forumdelete").dialog({
            autoOpen: true,
            height: 250,
            width: 350,
            modal: true,
            draggable: false,
            resizable: false,
            show: 'slide',
            open: function() {

                $.ajax({
                    url: 'app/account/list/' + id11,
                    method: 'GET',
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function(data) {

                        $.each(data, function(key, item) {
                            $('#nowDelete').append("<p>Do you want to delete chosen Account and all his Incomes and Expenses?</p>");
                            $('#nowDelete').append("<input type='button'  tabindex='-1' id=" + id11 + " value='Yes' class='deleteyes'/>");
                            $('#nowDelete').append("<input type='button'  tabindex='-1' value='No' class='deleteno'/>");
                        });
                    }
                });

            },
            close: function() {
                $('#nowDelete').html("");

            }

        });

    });



    $('#forumdelete').on('click', '.deleteyes', function() {

        var id22 = $(this).attr('id');

        deleteAccount(id22);
    });
    
    
    $('#forumdelete').on('click', '.deleteno', function() {

            $("#forumdelete").dialog('close');
            $('#nowDelete').html("");
    });
    
    
    
    function deleteAccount(id1) {

        $.ajax({
            url: 'app/account/list/' + id1,
            method: "delete",
            success: function(data)
            {
              //  alert("okay");
                location.href = "http://localhost:8080/homeaccounter_local/Account_add.jsp";
            }
        });


    }   
    


    
});







function addAccount() {
$.ajax({
    url: "app/account", 
    method: "post",
    contentType: "application/json",
    dataType:"json",
    data: JSON.stringify({
                  'account_name' : $('#account_name').val(),
                  'description': $('#description').val(),
                  'username': $("#user").val()
          }),
    success: function(data)
    {
        location.href = "http://localhost:8080/homeaccounter_local/Account_add.jsp";
        alert("Account successfully added");
        
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
