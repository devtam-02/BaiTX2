<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@page import="java.util.Set"%>

<%@page import="java.util.HashMap"%>
<%@page import="com.devtam.DevShop.Entity.ProductImage"%>
<%@page import="java.util.Map"%>
<%@ page import ="com.devtam.DevShop.Entity.Product" %>
<%@ page import ="java.util.List" %>

<!DOCTYPE html>
<html >

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion</title>
<link rel="icon" href="<c:url value="/"/>assets/img/logo-3.png">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
							<li class="active"><a href="home">Home</a></li>
							<li><a href="shop">Shop</a></li>
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

<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="filter__controls">
						<!-- <li  data-filter="*">Special</li> -->
						<li class="active" data-filter=".new-arrivals">New Arrivals</li>
						<li data-filter=".hot-sales">Best Sellers</li>
					</ul>
				</div>
			</div>
			<div class="row product__filter">
				<%
				List<Product> productList = (List) request.getAttribute("products"); 
				List<Product> bestSellerProductList = (List) request.getAttribute("best-sellers");
				%>
				<%
				Map<Integer, List<ProductImage>> productImages = (Map) request.getAttribute("productImages");		
				%>
				<% 
				if(bestSellerProductList != null)	{
				for(Product product : bestSellerProductList) {
				%>
				<% 
				List<ProductImage> images = productImages.get(Integer.valueOf(product.getId()));
				String image = "";
				if (images.size()>0) image = images.get(0).getUrl_image();
				%>
					<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales"
						style="display: none;">
						<div class="product__item sale">
							
							<div>
								<div class="product__item__pic set-bg"
								data-setbg="<%=image%>">
								<span class="label">Hot</span>
								<ul class="product__hover">
									<li><a href="#"><img src="<c:url value="/"/>assets/img/icon/heart.png" alt=""></a></li>
									<li><a href="#"><img src="<c:url value="/"/>assets/img/icon/compare.png" alt="">
											<span>Compare</span></a></li>
									<li><a href="<c:url value="/"/>details/<%=product.getId()%>"><img
											src="<c:url value="/"/>assets/img/icon/search.png" alt=""><span>Product Details</span></a></li>
								</ul>
								</div>
							</div>
							
							
							<div class="product__item__text">
								<h6><%=product.getProduct_name()%></h6>
								<a href="#" class="add-cart">+
									Add To Cart</a>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<h5><%=product.getPrice() %> VNĐ</h5>
								<div class="product__color__select">
									<label for="pc-7"> <input type="radio" id="pc-7">
									</label> <label class="active black" for="pc-8"> <input
										type="radio" id="pc-8">
									</label> <label class="grey" for="pc-9"> <input type="radio"
										id="pc-9">
									</label>
								</div>
							</div>
						</div>
				</div>
				<%}} %>	
				<% 
				if(productList != null)	{
				for(Product product : productList) {
				%>
				<% 
				List<ProductImage> images = productImages.get(Integer.valueOf(product.getId()));
				String image = "";
				if (images.size()>0) image = images.get(0).getUrl_image();
				%>
					<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals" >
						<div class="product__item">							
							<div>
								<div class="product__item__pic set-bg"
								data-setbg="<%=image%>">
								<span class="label">Hot</span>
								<ul class="product__hover">
									<li><a href="#"><img src="<c:url value="/"/>assets/img/icon/heart.png" alt=""></a></li>
									<li><a href="#"><img src="<c:url value="/"/>assets/img/icon/compare.png" alt="">
											<span>Compare</span></a></li>
									<li><a href="<c:url value="/"/>details/<%=product.getId()%>"><img
											src="<c:url value="/"/>assets/img/icon/search.png" alt=""><span>Product Details</span></a></li>
								</ul>
								</div>
							</div>
							
							
							<div class="product__item__text">
								<h6><%=product.getProduct_name()%></h6>
								<a href="#" class="add-cart">+
									Add To Cart</a>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<h5><%=product.getPrice() %> VNĐ</h5>
								<div class="product__color__select">
									<label for="pc-7"> <input type="radio" id="pc-7">
									</label> <label class="active black" for="pc-8"> <input
										type="radio" id="pc-8">
									</label> <label class="grey" for="pc-9"> <input type="radio"
										id="pc-9">
									</label>
								</div>
							</div>
						</div>
				</div>
				<%}} %>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Categories Section Begin -->
	<section class="categories spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="categories__text">
						<h2>
							Clothings Hot <br /> <span>Shoe Collection</span> <br />
							Accessories
						</h2>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="categories__hot__deal">
						<img src="<c:url value="/"/>assets/img/product-sale.png" alt="">
						<div class="hot__deal__sticker">
							<span>Sale Of</span>
							<h5>$29.99</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-1">
					<div class="categories__deal__countdown">
						<span>Deal Of The Week</span>
						<h2>Multi-pocket Chest Bag Black</h2>
						<div class="categories__deal__countdown__timer" id="countdown">
							<div class="cd-item">
								<span>3</span>
								<p>Days</p>
							</div>
							<div class="cd-item">
								<span>1</span>
								<p>Hours</p>
							</div>
							<div class="cd-item">
								<span>50</span>
								<p>Minutes</p>
							</div>
							<div class="cd-item">
								<span>18</span>
								<p>Seconds</p>
							</div>
						</div>
						<a href="#" class="primary-btn">Shop now</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Instagram Section Begin -->
	<section class="instagram spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="instagram__pic">
						<div class="instagram__pic__item set-bg"
							data-setbg="<c:url value="/"/>assets/img/instagram/instagram-1.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="<c:url value="/"/>assets/img/instagram/instagram-2.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="<c:url value="/"/>assets/img/instagram/instagram-3.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="<c:url value="/"/>assets/img/instagram/instagram-4.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="<c:url value="/"/>assets/img/instagram/instagram-5.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="<c:url value="/"/>assets/img/instagram/instagram-6.jpg"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="instagram__text">
						<h2>Instagram</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
						<h3>#Male_Fashion</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Instagram Section End -->

	<!-- Latest Blog Section Begin -->
	<section class="latest spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span>Latest News</span>
						<h2>Fashion New Trends</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="<c:url value="/"/>assets/img/blog/blog-1.jpg"></div>
						<div class="blog__item__text">
							<span><img src="<c:url value="/"/>assets/img/icon/calendar.png" alt=""> 16
								February 2020</span>
							<h5>What Curling Irons Are The Best Ones</h5>
							<a href="#">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="<c:url value="/"/>assets/img/blog/blog-2.jpg"></div>
						<div class="blog__item__text">
							<span><img src="<c:url value="/"/>assets/img/icon/calendar.png" alt=""> 21
								February 2020</span>
							<h5>Eternity Bands Do Last Forever</h5>
							<a href="#">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="<c:url value="/"/>assets/img/blog/blog-3.jpg"></div>
						<div class="blog__item__text">
							<span><img src="<c:url value="/"/>assets/img/icon/calendar.png" alt=""> 28
								February 2020</span>
							<h5>The Health Benefits Of Sunglasses</h5>
							<a href="#">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Blog Section End -->

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