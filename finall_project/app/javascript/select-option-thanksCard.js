try {
  const thanksCard = document.getElementById('thanksCard--selected')
  let lstBtnSelect = document.getElementsByClassName('newThanksCard__item');
  for (const item of lstBtnSelect) {
    item.addEventListener('click', function () {
      const bl = item.classList.contains('active');
      if(!bl){
        thanksCard.innerHTML = ''
        const itemsId = item.id;
        checkIdOption(itemsId);
        item.parentNode.querySelector('.newThanksCard__item.active').classList.remove('active')
        item.classList.add('active')
      }

    })
  }

  function checkIdOption(itemsId){
    switch (itemsId) {
      case '1':
        thanksCard.innerHTML = `<div class="thanksCard--bg thanksCardWendding">
                  <div class="thanksCardWendding__container">
                    <p class="inputCustom thanksCardWendding__title" role="textbox" contenteditable></p>
                    <h1 class="inputCustom thanksCardWendding__Content" role="textbox" contenteditable></h1>
                    <p class="inputCustom thanksCardWendding__description" role="textbox" contenteditable></p>
                  </div>
                </div>`
        break;
      case '2':
        thanksCard.innerHTML = `<div class="thanksCard--bg thanksCardHelp">
                  <div class="thanksCardHelp__container">
                    <h1 class="inputCustom thanksCardHelp__title" role="textbox" contenteditable></h1>
                    <p class="inputCustom thanksCardHelp__description" role="textbox" contenteditable></p>
                    <p class="inputCustom thanksCardHelp__underwrite" role="textbox" contenteditable></p>
                    </p>
                  </div>
                  <div style="clear: both;"></div>
                </div>`
        break;
      case '3':
        thanksCard.innerHTML = `<div class="thanksCard--bg thanksCardCristmast">
                  <div class="thanksCardCristmast__container">
                    <p class="inputCustom thanksCardCristmast__title" role="textbox" contenteditable></p>
                    <h1 class="inputCustom thanksCardCristmast__Content" role="textbox" contenteditable></h1>
                    <p class="inputCustom thanksCardCristmast__description" role="textbox" contenteditable></p>
                  </div>
                </div>`
        break;
    }
  }

} catch (error) {
  console.log(error)
}