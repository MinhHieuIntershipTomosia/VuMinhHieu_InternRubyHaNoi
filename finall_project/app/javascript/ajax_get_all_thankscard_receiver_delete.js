//= require jquery
$(document).ready(function () {
  $("#delete-tab").click(function (event) {
    $.ajax({
      type: 'GET',
      url: '/receiverdelete',
      dataType: 'html',
      success: function(respone){
        $("#delete").html(respone)
      }
    });
  });
});