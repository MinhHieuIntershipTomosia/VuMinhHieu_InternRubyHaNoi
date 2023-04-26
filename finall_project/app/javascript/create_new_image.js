//= require jquery
$('#btn-add-image').on('click', function () {
  $('#customFile').click();
});

$('#customFile').on('change', function () {
  const file = this.files[0];
  const reader = new FileReader();
  reader.onload = function () {
    $('#thanksCard__image-list').prepend(`
      <div class="image-add-item col-3 list-inline-item">
        <div>
          <div class="mb-4 d-flex justify-content-center">
            <img class="h-124 w-100" src="${reader.result}">
          </div>
          <div class="d-flex justify-content-center">
            <button type="button" class="btn-close" aria-label="Close"></button>
          </div>
        </div>
      </div>
    `);
  };
  reader.readAsDataURL(file);
  $('#customFile').val('');
});