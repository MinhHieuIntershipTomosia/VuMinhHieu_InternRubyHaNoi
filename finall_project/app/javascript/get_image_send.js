//= require jquery

const imagePreviews = document.querySelectorAll('#thanksCard__image img.h-124.w-100');
const uploadInputs = document.querySelectorAll('#thanksCard__image input.customFile');

function lstimage() {
  const files = [];
  uploadInputs.forEach(element => {
    const fileList = element.files;
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
}

imagePreviews.forEach((imagePreview, index) => {
  const uploadInput = uploadInputs[index];

  uploadInput.addEventListener('change', () => {
    const file = uploadInput.files[0];
    const reader = new FileReader();

    reader.onload = function () {
      imagePreview.src = reader.result;
    }

    reader.readAsDataURL(file);
    lstimage();
  });
});
lstimage();




