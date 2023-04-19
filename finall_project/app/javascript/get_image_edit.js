//= require jquery

const imagePreviews = document.querySelectorAll('#thanksCard__image img.h-124.w-100');
const uploadInputs = document.querySelectorAll('#thanksCard__image input.customFile');

imagePreviews.forEach((imagePreview, index) => {
  const uploadInput = uploadInputs[index];
  imagePreview.addEventListener('click', function () {
    uploadInput.click();
    uploadInput.addEventListener('change', () => {
      const file = uploadInput.files[0];
      const reader = new FileReader();

      reader.onload = function () {
        imagePreview.src = reader.result;
      }

      reader.readAsDataURL(file);
      lstimage();
    });
  })
});

function lstimage() {
  const files = [];
  const lstimage_edit = [];
  uploadInputs.forEach(element => {
    const fileList = element.files;
    if (fileList.length > 0) {
      str = element.id
      const vt = str.substring(str.indexOf("-") + 1);
      lstimage_edit.push(vt)
    }

    for (let i = 0; i < fileList.length; i++) {
      files.push(fileList[i])
    }
  });

  const dataTransfer = new DataTransfer();
  files.forEach(file => {
    dataTransfer.items.add(file);
  });

  const fileList = dataTransfer.files;
  document.querySelector('input#lstimage').files = fileList;
  document.querySelector('input#lstimage-edit').value = lstimage_edit;

}

lstimage();




