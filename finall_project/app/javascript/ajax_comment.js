//= require jquery

$('form.new-comment-form').on('submit', function (e) {
  e.preventDefault(); // Ngăn chặn form submit mặc định

  // Lưu trữ đối tượng form vào biến $form
  var $form = $(this);

  // Lấy giá trị của message và thankscard_id
  var message = $form.find('textarea[name="comment[message]"]').val();
  var thankscard_id = $form.find('input[name="thankscard_id"]').val();

  $form.parent().parent().find('.card-all-comment').empty();
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
      $form.parent().parent().find('.card-all-comment').html(response);
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

