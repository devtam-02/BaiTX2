<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>kakakaka</h1>
	<div class="container">
	
	<% List<Product> products = (List) session.getAttribute("products"); %>
		<% for(Product p : products) {%>
			<div class="row m-3 bg-secondary">
				<div class="col-10">
					<h1> <%= p %> </h1> 
				</div>
				<div class="col-2">
					<img alt="" width="100px" src="http://res.cloudinary.com/dqvhfr35a/image/upload/v1702731126/dpzvsbaaooagynu3osz8.jpg"> 
				</div>
			</div>
			
		<%} %>
	</div>
</body>
<script src="assets/jss/scripts.js"></script>
<script src="assets/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>
</html>