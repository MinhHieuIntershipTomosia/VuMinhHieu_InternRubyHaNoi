//= require jquery

// $(document).ready(function () {
//   $(".edit-comment").each(function (index) {
//     $(this).on("click", function () {
//       // Xử lý sự kiện click ở đây
//       console.log("Đã click vào phần tử số " + index);
//     });
//   });
// });
var editingCommentId = null;
$(document).on('click', ".delete-comment", function () {
  const id = $(this).parent().parent().find('.thanksCard--maxline.comment-content__text').attr('id').split("-").pop();
  var $comment = $(this)
  $.ajax({
    url: `/comment/${id}`,
    method: 'DELETE',
    dataType: 'html',
    data: {},
    success: function (response) {
      $comment.parent().parent().parent().remove()
    },
    error: function (jqXHR, textStatus, errorThrown) {
      // Xử lý lỗi khi tạo comment thất bại
      console.log('Delete comment error');
      console.log(jqXHR);
      console.log(textStatus);
      console.log(errorThrown);
    }
  });
});