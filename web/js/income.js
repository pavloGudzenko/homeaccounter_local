
$(document).ready(function() {

var id11;
    $.ajax({
        url: 'app/income',
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        success: function(data) {

            $.each(data, function(key, item) {
                $("#table_income").append("<tr id=" + item.income_id + "><td><span id=name>" + item.account_name + "</span></td><td>" + item.inc_amount + "</td><td>" + item.inc_category_name + "</td><td>" + item.inc_date + "</td><td><input type='button' onclick='' id=" + item.income_id + " class='deletethis' value='Delete'></button></td><td><input type='button' id=" + item.income_id + " class='updatethis'  value='Update'></button></td></tr>");
            });
        }
    });


    $.ajax({
        url: 'app/account',
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        success: function(data) {
            alert('Success');
            $("#account").append("<option id=0 class='account1'> --  <i>Select an Account</i>  -- </option>");
            $.each(data, function(key, item) {
                $("#account").append("<option id=" + item.account_id + " class='account1'>" + item.account_name + "</option>");
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




    $('#table_income').on('click', '.updatethis', function() {
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
                    url: 'app/income/list/' + id11,
                    method: 'GET',
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function(data) {

                        $.each(data, function(key, item) {
                            alert(item.inc_amount);
                            $('#income_amount_2').val(item.inc_amount);
                            $('#income_date_2').val(item.inc_date);
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
    
   
function updateIncome(id1) {
 
    var account_id = $('#account_2').children(':selected').attr('id');
    alert(account_id);
    var category_id = $('#income_category_2').children(':selected').attr('id');
    alert(category_id);
    alert($('#income_amount_2').val());
    alert($('#income_date_2').val());
    
    $.ajax({
        url: 'app/income/list/' + id1,
        method: "put",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify({
            'account_id': account_id,
            'inc_amount': $('#income_amount_2').val(),
            'inc_category_id': category_id,
            'inc_date': $('#income_date_2').val()
        }),
        success: function(data)
        {
            alert("okay");
            location.href = "http://localhost:8080/homeaccounter_local/Income_add.jsp";
        }
    });


}

});



function addIncome() {

    var account_id = $('#account').children(':selected').attr('id');
    var category_id = $('#income_category').children(':selected').attr('id');


    $.ajax({
        url: "app/income",
        method: "post",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify({
            'account_id': account_id,
            'inc_amount': $('#income_amount').val(),
            'inc_category_id': category_id,
            'inc_date': $('#income_date').val()
        }),
        success: function(data)
        {
            alert("okay");
            location.href = "http://localhost:8080/homeaccounter_local/Income_add.jsp";
        }
    });


}




$.ajax({
    url: 'app/income/accounts',
    method: 'GET',
    dataType: 'json',
    success: function(data) {
        $.each(data.Users, function(index, item) { // Iterates through a collection
            $("#account").append(// Append an object to the inside of the select box
                    $("<option></option>") // Yes you can do this.
                    .val(item.account_name)
                    );
        });
    }
});

 
