<%@page import="com.devtam.DevShop.Entity.User"%>
<%@page import="com.devtam.DevShop.Entity.Product"%>
<%@page import="com.devtam.DevShop.Entity.Order"%>
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
						<li><a href="<c:url value="/"/>admin/dashboard"><i
								class="sl sl-icon-settings"></i> Dashboard</a></li>
						<li class="active"><a href="<c:url value="/"/>admin/dashboard-orders"><i
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
							<h2>Bookings</h2>
							<!-- Breadcrumbs -->
							<nav id="breadcrumbs">
								<ul>
									<li><a href="#">Home</a></li>
									<li><a href="#">Dashboard</a></li>
									<li>Orders</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>

				<div class="row">
					<!-- Listings -->
					<div class="col-lg-12 col-md-12">
						<div class="dashboard-list-box margin-top-0">
					<%
						ArrayList<Order> listOrders = (ArrayList) request.getAttribute("listOrders");
						HashMap<Integer, ArrayList<Product>> listProducts = (HashMap) request.getAttribute("listProducts");
						HashMap<String, User> listUsers = (HashMap) request.getAttribute("listUsers");
					%>
							<h4>Booking Requests</h4>
							<ul>
								<% if(listOrders.size()>0) for(Order item : listOrders) {%>
									<li class="pending-booking">
										<div class="list-box-listing bookings">
											<div class="list-box-listing-img">
												<img src="https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png" alt="">
											</div>
											<div class="list-box-listing-content">
												<div class="inner">
													<div></div>
													<% if (listProducts.get(item.getId()).size() == 1){%>
													<h3><%=listProducts.get(item.getId()).get(0).getProduct_name() %></h3>
													<%}else{ %>
													<h3>
														<%=listProducts.get(item.getId()).get(0).getProduct_name() %> 
														 (And <%=listProducts.get(item.getId()).size() - 1 %> more ...)
													</h3>
													<%}%>
													<div class="inner-booking-list">
														<h5>Purchase Date:</h5>
														<ul class="booking-list">
															<li class="highlighted" ><%= item.getBooking_Date() %></li>
														</ul>
													</div>

													<div class="inner-booking-list">
														<h5>Note:</h5>
														<ul class="booking-list">
															<li class="highlighted"><%= item.getNote() %></li>
														</ul>
													</div>

													<div class="inner-booking-list">
														<h5>Price:</h5>
														<ul class="booking-list">
															<li class="highlighted" ><%= item.getTotal() %> VNĐ</li>
														</ul>
													</div>

													<div class="inner-booking-list">
														<h5>Client:</h5>
														<ul class="booking-list">
															<li><%=listUsers.get(item.getUserId()).getUser_Name() %></li>
															<li><%=listUsers.get(item.getUserId()).getEmail() %></li>
															<li><%=listUsers.get(item.getUserId()).getPhone_Number() %></li>
														</ul>
													</div>

													<!-- Reply to review popup -->
													<div id="small-dialog" class="zoom-anim-dialog mfp-hide">
														<div class="small-dialog-header">
															<h3>Send Message</h3>
														</div>
														<div class="message-reply margin-top-0">
															<form action="/send-message" method="post">
																<textarea name="message" cols="40" rows="3"
																	placeholder="Your Message to <%=listUsers.get(item.getUserId()).getEmail() %>"></textarea>
																<input name="email" value="<%=listUsers.get(item.getUserId()).getEmail() %>">
																<button type="submit" class="button">Send</button>
															</form>
														</div>
													</div>

													<a href="#small-dialog"
														class="rate-review popup-with-zoom-anim"><i
														class="sl sl-icon-envelope-open"></i> Send Message</a>
												</div>
											</div>
										</div>
										<div class="buttons-to-right">
											<a href="<c:url value="/"/>delete-order/<%=item.getId() %>" class="button gray reject"><i
												class="sl sl-icon-close"></i> Delete</a> <a
												href="<c:url value="/"/>dashboard-invoice/<%=item.getId() %>"
												class="button gray approve"><i class="im im-icon-Coin"></i>
												View Invoice</a>
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
