<%@page import="com.devtam.DevShop.DTO.UserDTO"%>
<%@page import="com.devtam.DevShop.DTO.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
================================================== -->
<title>Admin Page</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- CSS
================================================== -->
<link rel="stylesheet"
	href="<c:url value="/"/>assets/listeo/css/style.css" />
<link rel="stylesheet"
	href="<c:url value="/"/>assets/listeo/css/main-color.css" id="colors" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="icon" href="<c:url value="/"/>assets/img/logo-3.png" />
<style></style>
</head>

<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header Container
================================================== -->
		<header id="header-container" class="fixed fullwidth dashboard">
			<!-- Header -->
			<div id="header" class="not-sticky">
				<div class="container">
					<!-- Left Side Content -->
					<div class="left-side">
						<!-- Logo -->
						<div id="logo">
							<a href="<c:url value="/"/>admin/home"><img
								src="<c:url value="/"/>assets/images/logo.png"
								alt="" /></a> <a href="<c:url value="/"/>admin/home"
								class="dashboard-logo"><img
								src="<c:url value="/"/>assets/images/logo2.png"
								alt="" /></a>
						</div>

						<!-- Mobile Navigation -->
						<div class="mmenu-trigger">
							<button class="hamburger hamburger--collapse" type="button">
								<span class="hamburger-box"> <span
									class="hamburger-inner"></span>
								</span>
							</button>
						</div>
					</div>
					<!-- Left Side Content / End -->

					<!-- Right Side Content / End -->
					<div class="right-side">
						<!-- Header Widget -->
						<div class="header-widget">
							<!-- User Menu -->
							<div class="user-menu">
								<div class="user-name">
									<span>
										<img src="https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png" alt="">
									</span>My Account
								</div>
								<ul>
									<li><a href="<c:url value="/"/>admin/dashboard"><i
											class="sl sl-icon-settings"></i> Dashboard</a></li>
									<li><a href="<c:url value="/"/>admin/dashboard-myprofile"><i
											class="sl sl-icon-envelope-open"></i> My Profile</a></li>
									<li><a href="<c:url value="/"/>admin/dashboard-orders"><i
											class="fa fa-calendar-check-o"></i> Orders</a></li>
									<li><a href="<c:url value="/"/>admin/logout-admin"><i
											class="sl sl-icon-power"></i> Logout</a></li>
								</ul>
							</div>

							<a href="<c:url value="/"/>admin/dashboard-addproduct"
								class="button border with-icon">Add
								Product<i class="sl sl-icon-plus"></i>
							</a>
						</div>
						<!-- Header Widget / End -->
					</div>
					<!-- Right Side Content / End -->
				</div>
			</div>
			<!-- Header / End -->
		</header>
		<div class="clearfix"></div>
		<!-- Header Container / End -->

		<!-- Dashboard -->
		<div id="dashboard">
			<!-- Navigation
	================================================== -->

			<!-- Responsive Navigation Trigger -->
			<a href="#" class="dashboard-responsive-nav-trigger"><i
				class="fa fa-reorder"></i> Dashboard Navigation</a>

			<div class="dashboard-nav">
				<div class="dashboard-nav-inner">
					<ul data-submenu-title="Main">
						<li class="active"><a href="<c:url value="/"/>admin/dashboard"><i
								class="sl sl-icon-settings"></i> Dashboard</a></li>
						<li><a href="<c:url value="/"/>admin/dashboard-orders"><i
								class="fa fa-calendar-check-o"></i> Orders</a></li>
						<li><a href="<c:url value="/"/>admin/dashboard-wallet"><i
								class="sl sl-icon-wallet"></i> Wallet</a></li>
					</ul>

					<ul data-submenu-title="Products">
						<li><a href="<c:url value="/"/>admin/dashboard-myproduct"><i
								class="sl sl-icon-layers"></i> My products</a></li>
						<li><a
							href="<c:url value="/"/>admin/dashboard-addproduct"><i
								class="sl sl-icon-plus"></i> Add Product</a></li>
					</ul>

					<ul data-submenu-title="Account">
						<li><a href="<c:url value="/"/>admin/dashboard-myprofile"><i
								class="sl sl-icon-user"></i> My Profile</a></li>
						<li><a href="<c:url value="/"/>admin/logout-admin"><i
								class="sl sl-icon-power"></i> Logout</a></li>
					</ul>
					<ul data-submenu-title="">
						<li><a href="<c:url value="/"/>admin/home"><i
								class="im im-icon-Home"></i> Go To Home Page</a></li>
					</ul>
				</div>
			</div>
			<!-- Navigation / End -->

			
			<!-- Content
	================================================== -->
			<div class="dashboard-content">

				<!-- Titlebar -->
				<div id="titlebar">
					<div class="row">
						<div class="col-md-12">
							<h2>WELCOME!!!</h2>
							<!-- Breadcrumbs -->
							<nav id="breadcrumbs">
								<ul>
									<li><a href="#">Home</a></li>
									<li>Dashboard</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>


				<!-- Content -->
				<div class="row" style="justify-content: center; display: flex;">

					<!-- Item -->
					<div class="col-lg-3 col-md-6">
						<div class="dashboard-stat color-1">
							<div class="dashboard-stat-content">
								<h4><%= (int) request.getAttribute("totalOrder") %></h4>
								<span>Total Orders</span>
							</div>
							<div class="dashboard-stat-icon">
								<i class="im im-icon-Add-Bag"></i>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="col-lg-3 col-md-6">
						<div class="dashboard-stat color-2">
							<div class="dashboard-stat-content">
								<h4 ><%= (int) request.getAttribute("totalProduct") %></h4>
								<span>Total Products</span>
							</div>
							<div class="dashboard-stat-icon">
								<i class="im im-icon-Polo-Shirt"></i>
							</div>
						</div>
					</div>


					<!-- Item -->
					<div class="col-lg-3 col-md-6">
						<div class="dashboard-stat color-3">
							<div class="dashboard-stat-content">
								<h4 ><%= (int) request.getAttribute("totalUser") %></h4>
								<span>Total Users</span>
							</div>
							<div class="dashboard-stat-icon">
								<i class="im im-icon-Add-UserStar"></i>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="col-lg-3 col-md-6">
						<div class="dashboard-stat color-4">
							<div class="dashboard-stat-content">
								<h4><%= (int) request.getAttribute("totalCategory") %></h4>
								<span>Total Categories</span>
							</div>
							<div class="dashboard-stat-icon">
								<i class="im im-icon-Box-withFolders"></i>
							</div>
						</div>
					</div>
				</div>

				<%
				ArrayList<UserDTO> userDto = (ArrayList) request.getAttribute("userDto");
				ArrayList<OrderDTO> orderDTO = (ArrayList) request.getAttribute("orderDTO");				
				%>
				<div class="row" style="margin-bottom: 70px;">
					
					<!-- Recent Activity -->
					<div class="col-lg-6 col-md-12">
						<div class="dashboard-list-box with-icons margin-top-20">
							<h4>Recent Customers</h4>
							<ul>
								<%for(UserDTO u : userDto) {%>
									<li style="padding-left: 30px;">
										<img style="width: 45px; border-radius: 50%" 
										src="<%= u.getAvatar()%>" alt="">
										<strong><%=u.getName()%></strong> 
										<a>Email: <%=u.getEmail()%></a>
									</li>
								<%} %>
							</ul>
						</div>
					</div>

						<!-- Invoices -->
					<div class="col-lg-6 col-md-12">
						<div class="dashboard-list-box invoices with-icons margin-top-20">
							<h4>Recent Orders</h4>
							<ul>
								<%for(OrderDTO o : orderDTO) {%>
									<li><i class="list-box-icon sl sl-icon-doc"></i> <strong><%=o.getCustomerName() %></strong>
										<ul>
											<%if (o.getPaymentMethod().contains("Payment on delivery")) {%>
											<li class="unpaid">Payment on delivery</li>
											<%}else {%>
											<li class="paid">Payment with momo</li>
											<%} %>
											<li>Order:#<%=o.getId() %></li>
											<li>Date: <%=o.getDate()%></li>
											<li>Price: <%=o.getPrice()%> VNĐ</li>
										</ul>
										<div class="buttons-to-right">
											<a href="<c:url value="/"/>dashboard/invoice/<%=o.getId()%>" 
											class="button gray">View Invoice</a>
										</div>
									</li>
								<%} %>

							</ul>
						</div>
					</div>
				</div>

			</div>
			<!-- Content / End -->
				

			</div>
			<!-- Content / End -->
		</div>
		<!-- Dashboard / End -->
	</div>
	<!-- Wrapper / End -->

	<!-- Scripts
================================================== -->
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/jquery-migrate-3.3.2.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/mmenu.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/chosen.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/slick.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/rangeslider.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/magnific-popup.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/waypoints.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/counterup.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/tooltips.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/custom.js"></script>
	<!-- DropZone | Documentation: http://dropzonejs.com -->
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/dropzone.js"></script>

</body>
</html>
