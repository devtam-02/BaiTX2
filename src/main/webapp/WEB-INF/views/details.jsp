<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.devtam.DevShop.Entity.ProductImage"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.devtam.DevShop.Entity.Product" %>
<%@ page import ="java.util.List" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion</title>
<link rel="icon" href="/assets/img/logo-3.png">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="<c:url value="/"/>assets/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="<c:url value="/"/>assets/css/style.css" type="text/css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a >Sign in</a>
			</div>
			<div class="offcanvas__top__hover">
				<span>Usd <i class="arrow_carrot-down"></i></span>
				<ul>
					<li>USD</li>
					<li>EUR</li>
					<li>USD</li>
				</ul>
			</div>
		</div>
		<div class="offcanvas__nav__option">
			<a href="#" class="search-switch"><img src="<c:url value="/"/>assets/img/icon/search.png"
				alt=""></a> <a href="#"><img src="<c:url value="/"/>assets/img/icon/heart.png" alt=""></a>
			<a href="#"><img src="<c:url value="/"/>assets/img/icon/cart.png" alt="">
				<span text="1"></span></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>Free shipping, 30-day return or refund guarantee.</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<p>Free shipping, 30-day return or refund guarantee.</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<a href="#">
									Sign in
								</a> 
									<a href="#">FAQs</a>
							</div>
							<div class="header__top__hover">
								<span>Usd <i class="arrow_carrot-down"></i></span>
								<ul>
									<li>USD</li>
									<li>EUR</li>
									<li>USD</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
						<a href="#"><img src="<c:url value="/"/>assets/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="home">Home</a></li>
							<li class="active"><a href="shop">Shop</a></li>
							<li><a href="#">Pages</a>
								<ul class="dropdown">
									<li><a href="cart">Shopping Cart</a></li>
									<li><a href="myprofile">My Profile</a></li>
									<li><a href="myhistory">My History</a></li>
									<li><a href="about">About Us</a></li>
								</ul></li>
							<li><a href="blog">Blog</a></li>
							<li><a href="contact">Contacts</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="<c:url value="/"/>assets/img/icon/search.png" alt=""></a> <a href="#"><img
							src="<c:url value="/"/>assets/img/icon/heart.png" alt=""></a> <a href="cart"><img
							src="<c:url value="/"/>assets/img/icon/cart.png" alt=""> <span
							text="1"></span></a>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Shop Details Section Begin -->
	<section class="shop-details" style="margin-bottom:100px">
		<div class="product__details__pic">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="product__details__breadcrumb">
							<a href="/home">Home</a> <a href="/shop">Shop</a> <span>Product
								Details</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-3">
						<ul class="nav nav-tabs" role="tablist">
							<% 
							Product product = (Product) session.getAttribute("product");
							List<ProductImage> images =(List) session.getAttribute("images");%>
							<%
							if(images != null && images.size() >= 1){
							%>
								<li class="nav-item">
									<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
										<div class="product__thumb__pic set-bg" data-setbg="<%=images.get(0).getUrl_image()%>"></div>
									</a>
								</li>
							<%} %>
							<%
							if(images != null && images.size() >= 2){
							for (int i=1; i < images.size(); i++){ 
							%>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-<%=i+1%>" role="tab">
										<div class="product__thumb__pic set-bg" 
										data-setbg="<%= images.get(i).getUrl_image() %>"></div>
								</a></li>
							<%}}%>
						</ul>
					</div>
					<div class="col-lg-6 col-md-9">
						<div class="tab-content">
							<%
							if(images != null && images.size() >= 1){
							%>
								<div class="tab-pane active"
									id="tabs-1" role="tabpanel">
									<div class="product__details__pic__item">
										<img src="<%= images.get(0).getUrl_image() %>" alt="">
									</div>
								</div>
							<%}%>
							<%
							if(images != null && images.size() >= 2){
								for (int i=1; i < images.size(); i++){
							%>
								<div class="tab-pane"
									id="tabs-<%=i+1%>" role="tabpanel">
									<div class="product__details__pic__item">
										<img src="<%= images.get(i).getUrl_image() %>" alt="">
									</div>
								</div>
							<%}}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="product__details__content">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<div class="product__details__text">
							<h4 ><%=product.getProduct_name()%></h4>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o"></i> <span> - 5 Reviews</span>
							</div>
							<h3 ><%=product.getPrice() %> VNĐ</h3>
							<p ><%=product.getDescription() %></p>
							<form action="<c:url value="/"/>addToCart/<%=product.getId() %>" method="post">
								<div class="product__details__cart__option">
									<div class="quantity">
										<div class="pro-qty">
											<input name="count" type="text" value="1">
										</div>
										<input name="product_id" style="display: none;" type="text"
											value="<%=product.getId() %>">
									</div>
									<button class="primary-btn">add to cart</button>
								</div>
							</form>

							<div class="product__details__btns__option">
								<a href="#"><i class="fa fa-heart"></i> add to wishlist</a> <a
									href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
							</div>
							<div class="product__details__last__option">
								<h5>
									<span>Guaranteed Safe Checkout</span>
								</h5>
								<img src="<c:url value="/"/>assets/img/shop-details/details-payment.png" alt="">
								<ul>
									<li><span>SKU:</span> 3812912</li>
									<li><span>Categories:</span> Clothes</li>
									<li><span>Tag:</span> Clothes, Skin, Body</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="product__details__tab">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#tabs-5" role="tab">Description</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-6" role="tab">Customer Previews(5)</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-7" role="tab">Additional information</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-5" role="tabpanel">
									<div class="product__details__tab__content">
										<p class="note">Nam tempus turpis at metus scelerisque
											placerat nulla deumantos solicitud felis. Pellentesque diam
											dolor, elementum etos lobortis des mollis ut risus. Sedcus
											faucibus an sullamcorper mattis drostique des commodo
											pharetras loremos.</p>
										<div class="product__details__tab__content__item">
											<h5>Products Infomation</h5>
											<p>A Pocket PC is a handheld computer, which features
												many of the same capabilities as a modern PC. These handy
												little devices allow individuals to retrieve and store
												e-mail messages, create a contact file, coordinate
												appointments, surf the internet, exchange text messages and
												more. Every product that is labeled as a Pocket PC must be
												accompanied with specific software to operate the unit and
												must feature a touchscreen and touchpad.</p>
											<p>As is the case with any new technology product, the
												cost of a Pocket PC was substantial during it’s early
												release. For approximately $700.00, consumers could purchase
												one of top-of-the-line Pocket PCs in 2003. These days,
												customers are finding that prices have become much more
												reasonable now that the newness is wearing off. For
												approximately $350.00, a new Pocket PC can now be purchased.</p>
										</div>
										<div class="product__details__tab__content__item">
											<h5>Material used</h5>
											<p>Polyester is deemed lower quality due to its none
												natural quality’s. Made from synthetic materials, not
												natural like wool. Polyester suits become creased easily and
												are known for not being breathable. Polyester suits tend to
												have a shine to them compared to wool and cotton suits, this
												can make the suit look cheap. The texture of velvet is
												luxurious and breathable. Velvet is a great choice for
												dinner party jacket and can be worn all year round.</p>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tabs-6" role="tabpanel">
									<div class="product__details__tab__content">
										<div class="product__details__tab__content__item">
											<h5>Products Infomation</h5>
											<p>A Pocket PC is a handheld computer, which features
												many of the same capabilities as a modern PC. These handy
												little devices allow individuals to retrieve and store
												e-mail messages, create a contact file, coordinate
												appointments, surf the internet, exchange text messages and
												more. Every product that is labeled as a Pocket PC must be
												accompanied with specific software to operate the unit and
												must feature a touchscreen and touchpad.</p>
											<p>As is the case with any new technology product, the
												cost of a Pocket PC was substantial during it’s early
												release. For approximately $700.00, consumers could purchase
												one of top-of-the-line Pocket PCs in 2003. These days,
												customers are finding that prices have become much more
												reasonable now that the newness is wearing off. For
												approximately $350.00, a new Pocket PC can now be purchased.</p>
										</div>
										<div class="product__details__tab__content__item">
											<h5>Material used</h5>
											<p>Polyester is deemed lower quality due to its none
												natural quality’s. Made from synthetic materials, not
												natural like wool. Polyester suits become creased easily and
												are known for not being breathable. Polyester suits tend to
												have a shine to them compared to wool and cotton suits, this
												can make the suit look cheap. The texture of velvet is
												luxurious and breathable. Velvet is a great choice for
												dinner party jacket and can be worn all year round.</p>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tabs-7" role="tabpanel">
									<div class="product__details__tab__content">
										<p class="note">Nam tempus turpis at metus scelerisque
											placerat nulla deumantos solicitud felis. Pellentesque diam
											dolor, elementum etos lobortis des mollis ut risus. Sedcus
											faucibus an sullamcorper mattis drostique des commodo
											pharetras loremos.</p>
										<div class="product__details__tab__content__item">
											<h5>Products Infomation</h5>
											<p>A Pocket PC is a handheld computer, which features
												many of the same capabilities as a modern PC. These handy
												little devices allow individuals to retrieve and store
												e-mail messages, create a contact file, coordinate
												appointments, surf the internet, exchange text messages and
												more. Every product that is labeled as a Pocket PC must be
												accompanied with specific software to operate the unit and
												must feature a touchscreen and touchpad.</p>
											<p>As is the case with any new technology product, the
												cost of a Pocket PC was substantial during it’s early
												release. For approximately $700.00, consumers could purchase
												one of top-of-the-line Pocket PCs in 2003. These days,
												customers are finding that prices have become much more
												reasonable now that the newness is wearing off. For
												approximately $350.00, a new Pocket PC can now be purchased.</p>
										</div>
										<div class="product__details__tab__content__item">
											<h5>Material used</h5>
											<p>Polyester is deemed lower quality due to its none
												natural quality’s. Made from synthetic materials, not
												natural like wool. Polyester suits become creased easily and
												are known for not being breathable. Polyester suits tend to
												have a shine to them compared to wool and cotton suits, this
												can make the suit look cheap. The texture of velvet is
												luxurious and breathable. Velvet is a great choice for
												dinner party jacket and can be worn all year round.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Details Section End -->
	

	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="<c:url value="/"/>assets/img/footer-logo.png" alt=""></a>
						</div>
						<p>The customer is at the heart of our unique business model,
							which includes design.</p>
						<a href="#"><img src="<c:url value="/"/>assets/img/payment.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Clothing Store</a></li>
							<li><a href="#">Trending Shoes</a></li>
							<li><a href="#">Accessories</a></li>
							<li><a href="#">Sale</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Payment Methods</a></li>
							<li><a href="#">Delivary</a></li>
							<li><a href="#">Return & Exchanges</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
					<div class="footer__widget">
						<h6>NewLetter</h6>
						<div class="footer__newslatter">
							<p>Be the first to know about new arrivals, look books, sales
								& promos!</p>
							<form action="#">
								<input type="text" placeholder="Your email">
								<button type="submit">
									<span class="icon_mail_alt"></span>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="footer__copyright__text">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p>
							Copyright ©
							<script>
								document.write(new Date().getFullYear());
							</script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form action="search" method="POST" class="search-model-form">
				<input name="search-input" type="text" id="search-input"
					placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<!-- Js Plugins -->
	<script src="<c:url value="/"/>assets/js/jquery-3.3.1.min.js"></script>
	<script src="<c:url value="/"/>assets/js/bootstrap.min.js"></script>
	<script src="<c:url value="/"/>assets/js/jquery.nice-select.min.js"></script>
	<script src="<c:url value="/"/>assets/js/jquery.nicescroll.min.js"></script>
	<script src="<c:url value="/"/>assets/js/jquery.magnific-popup.min.js"></script>
	<script src="<c:url value="/"/>assets/js/jquery.countdown.min.js"></script>
	<script src="<c:url value="/"/>assets/js/jquery.slicknav.js"></script>
	<script src="<c:url value="/"/>assets/js/mixitup.min.js"></script>
	<script src="<c:url value="/"/>assets/js/owl.carousel.min.js"></script>
	<script src="<c:url value="/"/>assets/js/main.js"></script>
</body>

</html>