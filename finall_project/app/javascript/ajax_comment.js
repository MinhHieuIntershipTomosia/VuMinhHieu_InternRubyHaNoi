//= require jquery

$('form.new-comment-form').on('submit', function (e) {
  e.preventDefault(); // Ngăn chặn form submit mặc định

  // Lưu trữ đối tượng form vào biến $form
  var $form = $(this);

  // Lấy giá trị của message và thankscard_id
  var message = $form.find('textarea[name="comment[message]"]').val();
  var thankscard_id = $form.find('input[name="thankscard_id"]').val();

  // Gửi AJAX request lên server để tạo comment
  $.ajax({
    url: '/comment',
    method: 'POST',
    dataType: 'html',
    data: {
      comment: {
        message: message,
        thankscard_id: thankscard_id
      }
    },
    success: function (response) {
      $form.find('textarea[name="comment[message]"]').val('');
      if($form.parent().parent().find('.card-all-comment .comment-list').length == 0){
        var div =  $form.parent().parent().find('.card-all-comment')
        div.empty();
        div.append('<h2 class="carr-all-comment__title">All Comment</h2>');
        div.append('<ul class="comment-list"></ul>');
        $form.parent().parent().find('.card-all-comment .comment-list').prepend(response)
      }else{
        $form.parent().parent().find('.card-all-comment .comment-list').prepend(response);
        
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      // Xử lý lỗi khi tạo comment thất bại
      console.log('Error creating comment');
      console.log(jqXHR);
      console.log(textStatus);
      console.log(errorThrown);
    }
  });
});