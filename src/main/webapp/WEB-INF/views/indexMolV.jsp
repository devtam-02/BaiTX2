<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.devtam.DevShop.Entity.User" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type"  content="text/html charset=UTF-8">
<title>Twitter Bootstrap shopping cart</title>
</head>
<body>
   <form action="submit" method="post" id="myform">
	    <input type="text" name="name" id="name" placeholder="Nhập tên" onchange="validateFormName()">
	    <input type="text" name="phone" id="phone" placeholder="Nhập số điện thoại" onchange="validateFormPhone()">
	    <button id="submit_btn" onmouseover="setType()" disabled >Gửi</button>
  	</form>
  			<button id="submit_btn2" onclick="sapMit()" >Gửi</button>

</body>
<script>
	let cname = false, cphone = false;
	function validateFormName() {	  
       let name = document.getElementById("name").value;
	  if (name.length === 0) {
	    alert("Vui lòng nhập tên.");
	    const button = document.getElementById("submit_btn");
		button.disabled = true;
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
		button.disabled = true;
		cphone = false;
	    return false;
	  }
	  cphone = true;
	  return true;
	}
	
	function setType() {
		if (cname && cphone){
            console.log("dung");
			const button = document.getElementById("submit_btn");
			button.disabled = false;
		}
        console.log("sai");
	}
	function sapMit(){
		const form = document.getElementById("myform");
		form.submit();
	}
</script>
</html>