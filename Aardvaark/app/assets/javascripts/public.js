$(function(){
  $('#go-btn').on('click', function(e){
    $.ajax({
    url: '/session',
    type: 'post',
    data: $('#user-signup-form').serialize()
    

    })
  });
});