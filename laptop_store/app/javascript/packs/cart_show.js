
window.addEventListener('click',(e)=>{
  if (e.target.className == 'delete_button')
  {
    let x = e.target.parentElement.childNodes[1].innerText
    console.log(x)
    $.ajax({
      url: '/user/cart',
      type: 'delete',
      data: {
        product_name: x,
        },
      dataType: 'script',
    });
  }
})