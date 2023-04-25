//= require jquery
// $(document).ready(function () {
//   let status = false;
//   $('#customFile').on('change', function () {
//     if (status) {
//       return;
//     }
//     status = true;

//     const file = this.files[0];
//     const reader = new FileReader();
//     reader.onload = function () {
//       $('#thanksCard__image-list').prepend(`
//         <div class="image-add-item col-3 list-inline-item">
//           <div>
//             <div class="mb-4 d-flex justify-content-center">
//               <img class="h-124 w-100" src="${reader.result}">
//             </div>
//             <div class="d-flex justify-content-center">
//               <button type="button" class="btn-close" aria-label="Close"></button>
//             </div>
//           </div>
//         </div>
//       `);
//     };
//     reader.readAsDataURL(file);
//     $(this).val(null);
//     status = false;
//   });

//   $('#btn-add-image').on('click', function () {
//     if (status) {
//       return;
//     }
//     status = true;
//     console.log($('#customFile').files) 
//     $('#customFile').click();
//     status = false;
//   });

// });

$(document).ready(function () {
  let status = false;

  $('#btn-add-image').on('click', function () {
    if (status) {
      return;
    }
    status = true;

    $('#customFile').one('click', function () {
      status = false;
    });
  });

  $(document).on('click', '.btn-close', function () {
    const items = $(this).closest('.image-add-item');
    const lst = $('.image-add-item.col-3.list-inline-item');
    delete_image(lst);
    items.remove();
  });

  $('#customFile').on('change', function () {
    // xử lý sự kiện tạo ảnh
    const file = this.files[0];
    const reader = new FileReader();
    let newItem = null;
    reader.onload = function () {
      newItem = `<div class="image-add-item col-3 list-inline-item">
                  <div>
                    <div class="mb-4 d-flex justify-content-center">
                      <img class="h-124 w-100" src="${reader.result}">
                    </div>
                    <div class="d-flex justify-content-center">
                      <button type="button" class="btn-close" aria-label="Close"></button>
                    </div>
                  </div>
                </div> `
      $('#thanksCard__image-list').prepend(newItem);
    };
    reader.readAsDataURL(file);
    $(this).val(null);
  });



});


const items = $('.image-add-item.col-3.list-inline-item');

function beginvt() {
  const items = $('.image-add-item.col-3.list-inline-item');
  for (let i = 0; i < items.length; i++) {
    if (!$(items[i]).is(':hidden')) {
      return i;
    }
  }
  return -1;
}

function delete_image(lst) {
  const begin = beginvt();
  const end = begin + 2;
  if (begin == 0 && end < lst.length) {
    lst.eq(end).next().show();
  } else if (begin > 0 && end == lst.length) {
    lst.eq(begin).prev().show();
  } else if (begin > 0 && end < lst.length) {
    lst.eq(begin).prev().show();
  }
}

function display(items) {
  const perv = $('.control.prev')
  const next = $('.control.next')
  const begin = beginvt();
  const end = begin + 2;
  if (begin == 0) {
    perv.hide();
  } else if (begin > 0) {
    perv.show();
  }

  if (next == items.length) {
    next.hide();
  } else if (next < items.length) {
    next.show();
  }
}