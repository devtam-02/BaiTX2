
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8">
<title>Male-Fashion</title>
<link rel="icon" href="/img/logo-3.png">
<link rel="stylesheet" href="/css/invoice.css">
</head>

<body>

	<!-- Print Button -->
	<div style="display: flex;">
		<a th:href="@{/dashboard}" class="print-button">Back To Dashboard</a> <a
			href="javascript:window.print()" class="print-button">Print this
			invoice</a>
	</div>


	<!-- Invoice -->
	<div id="invoice">

		<!-- Header -->
		<div class="row">
			<div class="col-md-6">
				<div id="logo">
					<img src="img/logo.png" alt="">
				</div>
			</div>
			<div class="col-md-6">

				<p id="details">
					<strong>Order: </strong><i th:text="'#' + ${order.id}"></i><br>
					<strong>Issued: </strong><i  th:text="${#dates.format(order.booking_Date, 'dd-MM-yyyy')}"></i><br>
					Due 7 days from date of issue
				</p>
			</div>
		</div>
		<!-- Client & Supplier -->
		<div class="row">
			<div class="col-md-12">
				<h2>Invoice</h2>
			</div>

			<div class="col-md-6">
				<strong class="margin-bottom-5">Supplier</strong>
				<p>
					Male-Fashion <br> 498 Lê Văn Việt - Tăng Nhơn Phú A<br>TP.
					Thủ Đức - TP. Hồ Chí Minh <br>
				</p>
			</div>

			<div class="col-md-6">
				<strong class="margin-bottom-5">Customer</strong>
				<p>
					<i th:text="${order.fullname}"></i> <br> <i
						th:text="'SĐT: ' + ${order.phone}"></i> <br> <i
						th:text="'Email: ' + ${order.email}"></i> <br>
				</p>
			</div>
		</div>
		<!-- Invoice -->
		<div class="row">
			<div class="col-md-12">
				<table class="margin-top-20">
					<tr>
						<th>Description</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
					<th:block th:each="y: ${listOrder_Item}">
						<tr>
							<td th:text="${y.product.product_Name}"></td>
							<td th:text="${y.count}"></td>
							<td th:text="${y.product.price} * ${y.count} + ' VNĐ'"></td>
						</tr>
					</th:block>

				</table>

				<p>
					<strong class="margin-bottom-5">Address: </strong>
					<i th:text="${order.address}"></i><br>
					<strong class="margin-bottom-5">Payment method: </strong>
					<i th:text="${order.payment_Method}"></i>
				</p>
				
				
			</div>

			<div class="col-md-4 col-md-offset-8">

				<table id="totals">
					<tr>
						<th>Total Due</th>
						<th><span th:text="${order.total} + ' VNĐ'"></span></th>

					</tr>
				</table>
			</div>
		</div>


		<!-- Footer -->
		<div class="row">
			<div class="col-md-12">
				<ul id="footer">
					<li><span>www.devshop.com</span></li>
					<li>nguyentrongtam2x2@gmail.com</li>
					<li>0328 419 491</li>
				</ul>
			</div>
		</div>

	</div>


</body>

</html>