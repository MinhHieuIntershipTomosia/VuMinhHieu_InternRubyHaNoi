const items = document.querySelectorAll('.thanksCard__image-item');
const perv = document.querySelector('.control.prev')
const next = document.querySelector('.control.next')
for (let i = 4; i < items.length; i++) {
  items[i].style.display = 'none';
}

function beginvt() {
  let vt;
  for (var i = 0; i < items.length; i++) {
    if (items[i].style.display !== 'none') {
      vt = i;
      break;
    }
  }
  return vt;
}

next.addEventListener('click', function () {
  const begin = beginvt();
  const end = begin + 3;
  if (end < items.length - 1) {
    items[begin].style.display = 'none';
    items[end + 1].style.display = 'block'
  }
})

perv.addEventListener('click', function () {
  const begin = beginvt();
  const end = begin + 3;
  if (begin > 0) {
    items[end].style.display = 'none';
    items[begin-1].style.display = 'block'
  }
})