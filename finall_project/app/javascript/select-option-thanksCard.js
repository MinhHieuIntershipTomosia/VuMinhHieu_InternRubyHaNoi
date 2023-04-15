try {
  const thanksCard = document.getElementById('thanksCard--selected')
  let lstBtnSelect = document.getElementsByClassName('newThanksCard__item');
  for (const item of lstBtnSelect) {
    item.addEventListener('click', function () {
      const bl = item.classList.contains('active');
      if (!bl) {
        thanksCard.innerHTML = ''
        const itemsId = item.id;
        checkIdOption(itemsId);
        emtyAttributeThanksCard();
        item.parentNode.querySelector('.newThanksCard__item.active').classList.remove('active')
        item.classList.add('active')
        getdata('text-thankscard-title', 'thankscard__title')
        getdata('text-thankscard-content', 'thankscard__content')
        getdata('text-thankscard-description', 'thankscard__description')
        getcategoryId()
      }
    })
  }

  function emtyAttributeThanksCard() {
    document.getElementById('thankscard__category_id').value = ""
    document.getElementById('text-thankscard-title').innerHTML = document.getElementById('thankscard__title').value
    document.getElementById('text-thankscard-content').innerHTML = document.getElementById('thankscard__content').value
    document.getElementById('text-thankscard-description').innerHTML = document.getElementById('thankscard__description').value

  }

  function checkIdOption(itemsId) {
    switch (itemsId) {
      case '1':
        thanksCard.innerHTML = `<div class="thanksCard--bg thanksCardWendding" data-value="1" id="thankscard-category">
        <div class="thanksCardWendding__container">
          <p class="inputCustom thanksCardWendding__title" id="text-thankscard-title" role="textbox" contenteditable></p>
          <h1 class="inputCustom thanksCardWendding__Content" id="text-thankscard-content" role="textbox" contenteditable></h1>
          <p class="inputCustom thanksCardWendding__description" id="text-thankscard-description" role="textbox" contenteditable></p>
        </div>
      </div>`
        break;
      case '2':
        thanksCard.innerHTML = `<div class="thanksCard--bg thanksCardHelp" data-value="2" id="thankscard-category">
                  <div class="thanksCardHelp__container">
                    <h1 class="inputCustom thanksCardHelp__title" id="text-thankscard-title" role="textbox" contenteditable></h1>
                    <p class="inputCustom thanksCardHelp__description" id="text-thankscard-description" role="textbox" contenteditable></p>
                    <p class="inputCustom thanksCardHelp__underwrite" id="text-thankscard-content" role="textbox" contenteditable></p>
                    </p>
                  </div>
                  <div style="clear: both;"></div>
                </div>`
        break;
      case '3':
        thanksCard.innerHTML = `<div class="thanksCard--bg thanksCardCristmast" data-value="3" id="thankscard-category">
                  <div class="thanksCardCristmast__container">
                    <p class="inputCustom thanksCardCristmast__title" id="text-thankscard-title" role="textbox" contenteditable></p>
                    <h1 class="inputCustom thanksCardCristmast__Content" id="text-thankscard-content" role="textbox" contenteditable></h1>
                    <p class="inputCustom thanksCardCristmast__description" id="text-thankscard-description" role="textbox" contenteditable></p>
                  </div>
                </div>`
        break;
    }
  }

} catch (error) {
  console.log(error)
}