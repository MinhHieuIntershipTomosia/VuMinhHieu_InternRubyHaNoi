getdata('text-thankscard-title', 'thankscard__title')
getdata('text-thankscard-content', 'thankscard__content')
getdata('text-thankscard-description', 'thankscard__description')
getcategoryId()
function getdata(title, values) {
  document.getElementById(title).addEventListener('input', function () {
    document.getElementById(values).value = this.innerHTML
  })
}

function getcategoryId(){
  const textCategoryid = document.getElementById('thankscard-category').dataset.value;
  document.getElementById('thankscard__category_id').value = textCategoryid;
}

const targetNode = document.querySelector('.input-container');

// Tạo một đối tượng MutationObserver
const observer = new MutationObserver((mutationsList, observer) => {
  for (let mutation of mutationsList) {
    if (mutation.type === 'childList') {
      let lstitem = document.querySelectorAll('.input-container .item-container')
      let lstId = [];
      if (lstitem.length > 0) {
        lstitem.forEach(element => {
          const firstItem = element.firstElementChild;
          const dataValue = firstItem.dataset.value;
          lstId.push(dataValue);
        });
      }
      document.getElementById('select_user_id').value = lstId
      console.log(lstitem.length+ ';' + lstId);
    }
  }
});

// Cài đặt các tùy chọn cho đối tượng observer
const config = { childList: true };

// Bắt đầu quan sát
observer.observe(targetNode, config);
