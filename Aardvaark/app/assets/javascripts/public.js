
goVolunteers = function() {
  // console.log("submit to session")
  // console.log($('#user-signup-form'));
  // console.log($('form#user-signup-form').serialize());
  // console.log($('#user-signup-form input[name="email"]').val());
  $.ajax({
  url: '/session',
  dataType: 'json',
  type: 'post',
  data: $('form#user-signup-form').serialize(),
  success: function(data) {
    $('#myModal').modal.show();
  },
  error: function(data) {
    console.log(data);
    alert('So close but no cigar!');

  }

    


    // success: function(data){

    // },
    // error: function(){
    //   alert("sign up didn't work");
    // }

  });
}

$(document).ready(function(){
  console.log($('#go-btn-volunteers'));
  $('span#go-btn-volunteers').on('click',goVolunteers)
})