function getImage(image ,btn) {
  let coverPreview = document.getElementById(image);
  let cover = document.getElementById(btn);
  coverPreview.addEventListener('click', _ => cover.click());
  cover.addEventListener("change", _ => {
    let file = cover.files[0];
    let reader = new FileReader();
    reader.onload = function () {
      coverPreview.src = reader.result;
    }
    reader.readAsDataURL(file);
  });
}

getImage('img1','customFile1')
getImage('img2','customFile2')
getImage('img3','customFile3')
getImage('img4','customFile4')
