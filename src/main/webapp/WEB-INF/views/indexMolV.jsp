<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="com.devtam.DevShop.Entity.Product" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type"  content="text/html charset=UTF-8">
<title>Twitter Bootstrap shopping cart</title>
<link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
   <form action="submit" method="post" id="myform">
	    <input type="text" name="name" id="name" placeholder="Nhập tên" onchange="validateFormName()">
	    <input type="text" name="phone" id="phone" placeholder="Nhập số điện thoại" onchange="validateFormPhone()">
	    <button id="submit_btn" class="btn" data-bs-toggle="modal" 
	    data-bs-target="#staticBackdrop">Gửi</button>
  	</form>
	<!-- Modal -->
     <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
             <h5 class="modal-title" id="staticBackdropLabel">Xác nhận gửi dữ liệu lên server?</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Huy"></button>
             </div>
             <div class="modal-body" id="alertSubmit">
             ...
             </div>
             <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="cancel()">Hủy</button>
             <button type="button" class="btn btn-primary" onclick="postSubmit()">Xác nhận</button>
             </div>
         </div>
         </div>
</body>
<script src="assets/jss/scripts.js"></script>
<script src="assets/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>

</html>