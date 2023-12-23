<%@page import="com.devtam.DevShop.Process.Implement.ProductImageProcessImpl"%>
<%@page import="com.devtam.DevShop.Process.ProductImageProcess"%>
<%@page import="com.devtam.DevShop.Entity.Product"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="<c:url value="/"/>assets/listeo/css/main-color.css" id="colors" />
<link rel="stylesheet" href="<c:url value="/"/>assets/listeo/css/style.css" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="icon" href="<c:url value="/"/>assets/img/logo-3.png" />

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
									<!-- <img src="<c:url value="/"/>assets/${session.admin.avatar}" alt="" /> -->
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
						<li><a href="<c:url value="/"/>admin/dashboard-orders"><i
								class="fa fa-calendar-check-o"></i> Orders</a></li>
						<li><a href="<c:url value="/"/>admin/dashboard-wallet"><i
								class="sl sl-icon-wallet"></i> Wallet</a></li>
					</ul>

					<ul data-submenu-title="Products">
						<li class="active"><a href="<c:url value="/"/>admin/dashboard-myproduct"><i
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
				<div id="titlebar">
					<div class="row">
						<div class="col-md-12">
							<h2>My Products</h2>
							<!-- Breadcrumbs -->
							<nav id="breadcrumbs">
								<ul>
									<li><a href="#">Home</a></li>
									<li><a href="#">Dashboard</a></li>
									<li>My Products</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<form action="<c:url value="/"/>admin/dashboard-myproduct/search" method="Post">
					<div class="main-search-input"
						style="margin-bottom: 30px; justify-content: space-between;">

						<div class="main-search-input-item" style="flex: 1">
							<input name="search-input" type="text"
								placeholder="Search Your Product" th:value="${search_input}">
						</div>
						<div style="display: flex;">
							<div class="main-search-input-item">
								<select
									name="category-selected" data-placeholder="All Categories"
									class="chosen-select">
									<option value="0">All Categories</option>
									<%
									
									HashMap<Integer, String> categories = (HashMap) request.getAttribute("categories");
									if(categories != null) {
										Set<Integer> keySet = categories.keySet();
										for (Integer key : keySet) { 
									%>
										<option value="<%=key%>"><%=categories.get(key)%></option>
									<%}}%>
								</select>
							</div>

							<button class="button" type="submit">Search</button>
						</div>
					</div>
				</form>
				<div class="row">

					<!-- Listings -->
					<div class="col-lg-12 col-md-12">
						<div class="dashboard-list-box margin-top-0">
							<h4>My Product</h4>
							<ul>
								<%
								List<Product> productList = (List) request.getAttribute("products");
								HashMap<Integer, String> images = (HashMap) request.getAttribute("images");
								if(productList!=null){
									for(Product product : productList){
										String url_image = "";
										if(images != null)
											url_image = images.get(product.getId());
										
								%>
									<li>
										<div class="list-box-listing">
											<div>
												<div class="list-box-listing-img">
													<a href="#"><img src="<%=url_image %>"
														alt=""></a>
												</div>
											</div>
											<div class="list-box-listing-content">
												<div class="inner">
													<h3>
														<a href="<c:url value='/'/>admin/dashboard-myproducts/edit/<%=product.getId()%>"><%=product.getProduct_name()%></a>
													</h3>
													<h3><%=product.getPrice() %> VNĐ</h3>
													<span >Category: <%=categories.get(product.getCategory_id()) %></span><br>
													<span >Availability: <%=product.getQuantity() %></span>
												</div>
											</div>
										</div>
										<div class="buttons-to-right">
											<a href="<c:url value="/"/>admin/dashboard-myproducts/analysis/<%=product.getId()%>" class="button gray">
											<i class="sl sl-icon-pie-chart"></i> Analysis</a>
											<a href="<c:url value="/"/>admin/dashboard-myproducts/edit/<%=product.getId()%>" class="button gray"><i
												class="sl sl-icon-note"></i> Edit</a> 
											<a href="<c:url value="/"/>admin/dashboard-myproducts/delete/<%=product.getId()%>" class="button gray"><i class="sl sl-icon-close"></i>
												Delete</a>
										</div>
									</li>
								<%}} %>
							</ul>
						</div>
					</div>
					<!-- Pagination -->
					<div class="clearfix"></div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="pagination-container margin-top-20 margin-bottom-40">
								<nav class="pagination">
									<%
									int maxPage = (int)session.getAttribute("maxPage");
									if((String)session.getAttribute("type")=="list"){ 
										int numPage = (int)request.getAttribute("page");
									%>
									<ul>									
										<li>
											<%if(numPage > 0) {%>
											<a href="<c:url value="/"/>admin/dashboard-myproduct/<%=numPage%>"><i
												class="sl sl-icon-arrow-left"></i></a>
											<%} %>
										</li>
										
											<li>
												<a href="" class="current-page" ><%=numPage + 1%></a></li>
										
										<li><%if(numPage < maxPage) {%>
											<a href="<c:url value="/"/>admin/dashboard-myproduct/<%=numPage+2%>"><i
												class="sl sl-icon-arrow-right"></i></a>
											<%} %>	
										</li>
									</ul>
									<%} %>
									<%
									if((String)session.getAttribute("type")=="search"){ 
										int numPage = (int)request.getAttribute("page");
									%>
									<ul>									
										<li>
											<%if(numPage > 0) {%>
											<a href="<c:url value="/"/>admin/dashboard-myproduct/search/<%=numPage-1%>"><i
												class="sl sl-icon-arrow-left"></i></a>
											<%} %>
										</li>
										
											<li>
												<a href="" class="current-page" ><%=numPage + 1%></a></li>
										
										<li><%if(numPage < maxPage) {%>
											<a href="<c:url value="/"/>admin/dashboard-myproduct/search/<%=numPage+2%>"><i
												class="sl sl-icon-arrow-right"></i></a>
											<%} %>
										</li>
									</ul>
									<%} %>
								</nav>
							</div>
						</div>
					</div>
					<!-- Pagination / End -->
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
	<script type="text/javascript" 
	src="<c:url value="/"/>assets/scripts/myjs.js"> </script>
	<!-- DropZone | Documentation: http://dropzonejs.com -->
	<!--<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/dropzone.js"></script>-->

</body>
</html>
