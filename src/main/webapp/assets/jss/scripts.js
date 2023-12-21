 document.getElementById("myform").addEventListener("submit", function(event){
        event.preventDefault();
    });

	let cname = false, cphone = false;
	function validateFormName() {	  
       let name = document.getElementById("name").value;
	  if (name.length === 0) {
	    alert("Vui lòng nhập tên.");
	    const button = document.getElementById("submit_btn");
		cname = false;
	    return false;
	  }
	  cname = true;
	  return true;
	}
	const phoneRegex = /^[0-9]{10}$/;
	function validateFormPhone() {
      let phone = document.getElementById("phone").value;
	  if (!phoneRegex.test(phone)) {
	    alert("Số điện thoại không hợp lệ.");
	    const button = document.getElementById("submit_btn");
		cphone = false;
	    return false;
	  }
	  cphone = true;
	  return true;
	}
	
	function postSubmit() {
		let message = document.getElementById("alertSubmit");
		message.textContent  = "...";
		console.log("test over postSubmit");
		if (cname && cphone){	
			const form = document.getElementById("myform");
			form.submit();
		}
		else{
			console.log("hehe");
			
			message.textContent  = "Vui lòng nhập thông tin đúng định dạng";
		}
	}
    function cancel(){
        let message = document.getElementById("alertSubmit");
		message.textContent  = "...";
    }
