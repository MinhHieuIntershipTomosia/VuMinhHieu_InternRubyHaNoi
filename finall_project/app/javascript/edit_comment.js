//= require jquery

// $(document).ready(function () {
//   $(".edit-comment").each(function (index) {
//     $(this).on("click", function () {
//       // Xử lý sự kiện click ở đây
//       console.log("Đã click vào phần tử số " + index);
//     });
//   });
// });

$(document).on('click', ".edit-comment", function () {
  //lấy ra nội dung cần sửa
  /*
    let content = $(this).parent().parent().find('.thanksCard--maxline.comment-content__text').text().trim();

    $(this).parent().parent().find('.thanksCard--maxline.comment-content__text').html(`<form class="comment__frm--edit">
    <div class="form-group col-xs-12 col-sm-9 col-lg-10 position-relative comment__input comment--edit" style="flex:1">
      <textarea class="form-control" name="comment[message]" placeholder="Your message" required="" style="padding-right:32px">${content}</textarea>
      <button class="btn text-primary position-absolute btn__edit-comment"><i class="fa-solid fa-paper-plane"></i></button>
    </div>
  </form>`)
  */
  const id = $(this).parent().parent().find('.thanksCard--maxline.comment-content__text').attr('id').split("-").pop();
  checkcomment(id);
  let form = $(this).parent().parent().find('.thanksCard--maxline.comment-content__text').find('form.comment__frm--edit')
  form.on('submit', function (e) {
    e.preventDefault();
    // Lưu trữ đối tượng form vào biến $form
    var $form = $(this);

    // Lấy giá trị của message và thankscard_id
    var message = $form.find('textarea[name="comment[message]"]').val();
    const id = $(this).parent().attr('id').split("-").pop();

    // Gửi AJAX request lên server để tạo comment
    $.ajax({
      url: `/comment/${id}`,
      method: 'PATCH',
      dataType: 'html',
      data: {
        comment: {
          message: message,
        }
      },
      success: function (response) {
        $form.parent().parent().parent().replaceWith(response)
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // Xử lý lỗi khi tạo comment thất bại
        console.log('Error creating comment');
        console.log(jqXHR);
        console.log(textStatus);
        console.log(errorThrown);
      }
    });
  })

});

var editingCommentId = null;
function checkcomment(id) {
  // Nếu đang sửa comment khác thì đóng lại
  if (editingCommentId && editingCommentId != id) {
    closecomment();
  }
  // Nếu comment được chọn đang được sửa thì không làm gì
  opencomment(id);

  // Lưu ID của comment đang được sửa
  editingCommentId = id;
}

function closecomment() {
  var comment = $('#comment-' + editingCommentId);
  var comment_content = comment.find('textarea[name="comment[message]"]').val();
  comment.empty();
  comment.html(comment_content)
}

function opencomment(id) {
  var comment = $('#comment-' + id);
  let content = comment.text().trim();
  comment.html(`<form class="comment__frm--edit">
  <div class="form-group col-xs-12 col-sm-9 col-lg-10 position-relative comment__input comment--edit" style="flex:1">
    <textarea class="form-control" name="comment[message]" placeholder="Your message" required="" style="padding-right:32px">${content}</textarea>
    <button class="btn text-primary position-absolute btn__edit-comment"><i class="fa-solid fa-paper-plane"></i></button>
  </div>
</form>`)
}