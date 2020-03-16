document.addEventListener("DOMContentLoaded", function(event) {
  console.log("DOM fully loaded and parsed");

  //selectors
  const name = document.querySelector('#user_name');
  const username = document.querySelector('#user_username'); 
  const psw = document.querySelector('#user_password');
  const vals = document.querySelector('#vals');
  const m1 = document.querySelector('#m1');
  const m2 = document.querySelector('#m2');
  const m3 = document.querySelector('#m3');
  const m4 = document.querySelector('#m4');
  const m5 = document.querySelector('#m5');
  const psw2 = document.querySelector('#user_password_confirm');
  const psw2Div = document.querySelector('#psw2-div');
  const em = document.querySelector('#em');
  const emDiv = document.querySelector('#em-div');
  const mail = document.querySelector('#user_email');
  const phone = document.querySelector('#user_phoneno');
  const pm = document.querySelector('#pm');
  const pmDiv = document.querySelector('#pm-div');
  const form = document.querySelector('#new_user');
  const allInputs = document.querySelectorAll(".input")
  const submit = document.querySelector("#submit-button") 
  //map for checking validaiton on submit
  let checker = new Map([['user_name',false],['user_username',false],['user_password',false],['user_password_confirm',false],['user_email',false],['user_phoneno',false]])

  //adding-removing shadow
  allInputs.forEach(el=>{
    el.addEventListener('focus',()=>{
      el.classList.add("input-focus")
      el.classList.remove("input-error")
	});

	el.addEventListener('focusout',()=>{
	  el.classList.remove("input-focus")
	});
  });

  //add-remove errors on focus and focusout
  function focusInOut(errorDiv,element)
  {
    element.addEventListener('focus',()=>{
 	  errorDiv.style.display = 'block';	
	});

	element.addEventListener('focusout',()=>{

	  errorDiv.style.display = 'none';
	});
  }

  //focusInOut function calls
  focusInOut(vals,psw)
  focusInOut(psw2Div,psw2)
  focusInOut(emDiv,mail)
  focusInOut(pmDiv,phone)

  //validates password, phoneno and mail using regex and sets respective input field's id value to true in checker
  function validate(element,re,para)
  {	// element=='psw2'?reg=psw.value:reg=re;
    element.addEventListener('keyup',()=>{
	  element.value.match(re)?(para.style.display = "none",checker.set(element.id,true)) : (para.style.display = "block",checker.set(element.id,false));
	});	
  }

  //validate function calls
  validate(mail,/^\w+\.?\w+@[a-z]+\.[a-z]{2,}/,em);
  validate(phone,/\d{10}/,pm);
  validate(psw,/[A-Z]+/,m1);
  validate(psw,/[a-z]+/,m2);
  validate(psw,/[0-9]+/,m3);
  validate(psw,/.{8}/,m5);


  //validates confirm password field and sets respective input field's id value to true in checker
  psw2.addEventListener('keyup',()=>{
    psw.value == psw2.value? (m4.style.display = 'none',checker.set('user_password_confirm',true)):(m4.style.display = 'block', checker.set('user_password_confirm',false));   
  });

  //validation for not allowing empty fields and checking all validations on form submit
  submit.addEventListener('click',(e)=>{
  	console.log('working')
    name.value!=''?checker.set('user_name',true):checker.set('user_name',false)
    username.value!==''?checker.set('user_username',true):checker.set('user_username',false)
    count = 0	
    //loop for counting fields which have passed validations
    checker.forEach((value,key)=>{	
	  if(value)
	  {
	     count += 1;
	  }
	 });
    //conditions for alert depending on count
	if(count == checker.size)
	{  console.log('success')
	   alert("Form submitted successfully")
	}
	else
	{  console.log('no success')
	   alert("Kindly fill the fields accordingly")
	   //prevents form reload if validations are not passed
	   e.preventDefault()
	   //changes border CSS to red of invalidated fields
	   checker.forEach((value,key)=>{
	     if(!value) 
	     {	x = document.querySelector("#"+key)
	     	x.classList.add("input-error")
	     }	
	   }); 
	}

  });

});

