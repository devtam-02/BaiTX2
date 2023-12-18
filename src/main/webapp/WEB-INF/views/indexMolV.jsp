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
	    <button id="submit_btn" onmouseover="setType()" onclick="postSubmit()" >Gửi</button>
  	</form>

</body>
<script>
    document.getElementById("myform").addEventListener("submit", function(event){
        event.preventDefault();
    });

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
	
	function postSubmit() {
        console.log("alert");
	}

	function sapMit(){
		const form = document.getElementById("myform");
		form.submit();
	}
    function ask(){
        console.log("step over here hehehehe");
    }
    function showDialog() {
        const dialog = document.createElement("dialog");
        dialog.setAttribute("title", "Thông báo");

        const message = document.createElement("p");
        message.textContent = "Bạn có chắc chắn muốn gửi dữ liệu không?";

        const buttonConfirm = document.createElement("button");
        buttonConfirm.textContent = "Xác nhận";
        buttonConfirm.addEventListener("click", () => {
            // Gửi dữ liệu lên server
        });

        const buttonCancel = document.createElement("button");
        buttonCancel.textContent = "Hủy";
        buttonCancel.addEventListener("click", () => {
            // Không gửi dữ liệu lên server
        });

        dialog.appendChild(message);
        dialog.appendChild(buttonConfirm);
        dialog.appendChild(buttonCancel);

        dialog.showModal();
    }
    document.querySelector("button[type='submit']").addEventListener("click", showDialog);
</script>
</html>