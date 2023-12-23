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
						<li><a href="<c:url value="/"/>admin/dashboard-myproduct"><i
								class="sl sl-icon-layers"></i> My products</a></li>
						<li class="active"><a
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
				<form id="form-post-product" onsubmit="event.preventDefault();" action="<c:url value="/"/>admin/dashboard-addproduct"
					method="post" enctype="multipart/form-data">
					<!-- Titlebar -->
					<div id="titlebar">
						<div class="row">
							<div class="col-md-12">
								<h2>Add Product</h2>
								<!-- Breadcrumbs -->
								<nav id="breadcrumbs">
									<ul>
										<li><a href="#">Home</a></li>
										<li><a href="#">Dashboard</a></li>
										<li>Add Product</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div id="add-listing">
								<!-- Section -->
								<div class="add-listing-section">
									<!-- Headline -->
									<div class="add-listing-headline">
										<h3>
											<i class="sl sl-icon-doc"></i> Basic Informations
										</h3>
									</div>

									<!-- Title -->
									<div class="row with-forms">
										<div class="col-md-12">
											<h5>Product Name</h5>
											<input type="text" name="product_name" id="name" class="search-field" type="text"
												value="" placeholder="Product Name" />
											<span class="product_name_alert" style="color: red"></span>
										</div>
									</div>

									<!-- Row -->
									<div class="row with-forms">
										<!-- Price -->
										<div class="col-md-4">
											<h5>Price</h5>
											<input name="price" type="text" placeholder="Price" /> <span
												class="price_alert" style="color: red"></span>
										</div>

										<div class="col-md-4">
											<h5>Availability</h5>
											<input name="availability" type="text"
												placeholder="Availability" /> <span
												class="availability_alert" style="color: red"></span>
										</div>
										<!-- Status -->
										<div class="col-md-4">
											<h5>Category</h5>
											<select name="category" class="chosen-select-no-single">
												
												<!-- <option value="1" label="blank"
													th:text="${listCategories[0].category_Name}"></option> -->
													
												<%
													HashMap<Integer, String> categories = (HashMap) session.getAttribute("categories");
													if(categories != null) {
													Set<Integer> keySet = categories.keySet();
													for (Integer key : keySet) {
										         %>
													<option value="<%=key %>"><%= categories.get(key) %></option>
												<%}} %>
											</select>
										</div>
									</div>
									<!-- Row / End -->
								</div>
								<!-- Section / End -->

								<!-- Section -->
								<div class="add-listing-section margin-top-45">
									<!-- Headline -->
									<div class="add-listing-headline">
										<h3>
											<i class="sl sl-icon-docs"></i> Details
										</h3>
									</div>

									<!-- Description -->
									<div class="form">
										<h5>Description</h5>
										<textarea name="description" class="WYSIWYG" cols="40"
											rows="3" id="summary" spellcheck="true"
											placeholder="Description"></textarea>
									</div>
								</div>
								<!-- Section / End -->

								<!-- Section -->
								<div class="add-listing-section margin-top-45">
									<!-- Headline -->
									<div class="add-listing-headline">
										<h3>
											<i class="sl sl-icon-picture"></i> Images
										</h3>
									</div>

									<!-- Dropzone -->
									<div class="submit-section">
										<div class="upload__box">
											<div class="upload__btn-box">
												<label class="upload__btn">
													<p style="margin-bottom: 0px">Choose images</p> <input
													name="listImage" accept="image/*" type="file"
													data-max_length="20" class="upload__inputfile" multiple />
												</label>
											</div>
											<div class="upload__img-wrap"></div>
										</div>
									</div>
								</div>
								<!-- Section / End -->

								<button class="button preview" onclick="submitForm()">
									Add New Product <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
						</div>

						<!-- Copyrights -->
						<div class="col-md-12">
							<div class="copyrights"></div>
						</div>
					</div>
				</form>
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

	<!-- Opening hours added via JS (this is only for demo purpose) -->
	<script>
	
      $(".opening-day.js-demo-hours .chosen-select").each(function () {
        $(this).append(
          "" +
            "<option></option>" +
            "<option>Closed</option>" +
            "<option>1 AM</option>" +
            "<option>2 AM</option>" +
            "<option>3 AM</option>" +
            "<option>4 AM</option>" +
            "<option>5 AM</option>" +
            "<option>6 AM</option>" +
            "<option>7 AM</option>" +
            "<option>8 AM</option>" +
            "<option>9 AM</option>" +
            "<option>10 AM</option>" +
            "<option>11 AM</option>" +
            "<option>12 AM</option>" +
            "<option>1 PM</option>" +
            "<option>2 PM</option>" +
            "<option>3 PM</option>" +
            "<option>4 PM</option>" +
            "<option>5 PM</option>" +
            "<option>6 PM</option>" +
            "<option>7 PM</option>" +
            "<option>8 PM</option>" +
            "<option>9 PM</option>" +
            "<option>10 PM</option>" +
            "<option>11 PM</option>" +
            "<option>12 PM</option>"
        );
      });
    </script>

	<!-- DropZone | Documentation: http://dropzonejs.com -->
	<script type="text/javascript"
		src="<c:url value="/"/>assets/scripts/dropzone.js"></script>

	<script>
	var cImage = false;
      jQuery(document).ready(function () {
    	//$('#form-post-product') 
        ImgUpload();
        checkName();
        checkPrice();
        checkAvailable();
      });
		
      function ImgUpload() {
        var imgWrap = "";
        var imgArray = [];

        $(".upload__inputfile").each(function () {
          $(this).on("change", function (e) {
            imgWrap = $(this).closest(".upload__box").find(".upload__img-wrap");
            var maxLength = $(this).attr("data-max_length");

            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            var iterator = 0;
            filesArr.forEach(function (f, index) {
              if (!f.type.match("image.*")) {
                return;
              }

              if (imgArray.length > maxLength) {
            	cImage = false;
              	return false;
              } else {
                var len = 0;
                for (var i = 0; i < imgArray.length; i++) {
                  if (imgArray[i] !== undefined) {
                    len++;
                  }
                }
                if (len > maxLength) {
                	cImage = true;
                  	return false;
                } else {
                	cImage = true;
                  imgArray.push(f);

                  var reader = new FileReader();
                  reader.onload = function (e) {
                    var html =
                      "<div class='upload__img-box'><div style='background-image: url(" +
                      e.target.result +
                      ")' data-number='" +
                      $(".upload__img-close").length +
                      "' data-file='" +
                      f.name +
                      "' class='img-bg'><div class='upload__img-close'></div></div></div>";
                    imgWrap.append(html);
                    iterator++;
                  };
                  reader.readAsDataURL(f);
                }
              }
            });
            });
          });
        
        
        $("body").on("click", ".upload__img-close", function (e) {
          var file = $(this).parent().data("file");
          for (var i = 0; i < imgArray.length; i++) {
            if (imgArray[i].name === file) {
              imgArray.splice(i, 1);
              break;
            }
          }         
          $(this).parent().parent().remove();
          if(imgArray.length == 0) cImage=false;
        });
      };
      var cName = false, cPrice = false, cAval = false;
      function checkName() {
        $('input[name="product_name"]').on("change blur", function (e) {
          var inputValue = $(this).val(); // Lấy giá trị của ô input
          if (inputValue.length < 5) {
       		cName = false;
            // Kiểm tra điều kiện nhập vào
            $(".product_name_alert").text(
              "Product name must be more than 5 characters"
            );
            //$(this).val("");
            //$(this).focus(); // Đưa con trỏ vào ô input
          } else{
        	  cName = true;
        	  $(".product_name_alert").text("");
          }
        });
      }
      function checkPrice() {
        $('input[name="price"]').on("change blur", function (e) {
          var inputValue = $(this).val(); // Lấy giá trị của ô input
          var numberRegex = /^\d+$/;
          if (!numberRegex.test(inputValue)) {
        	  cPrice = false;
            $(".price_alert").text(
              "Product price can only contain numeric characters and not null"
            );
          } else{
        	  cPrice = true;
        	  $(".price_alert").text("");
          }
        });
      }
      function checkAvailable() {
        $('input[name="availability"]').on("change blur", function (e) {
          var inputValue = $(this).val(); // Lấy giá trị của ô input
          var numberRegex = /^\d+$/;
          if (!numberRegex.test(inputValue)) {
        	  cAval = false;
            $(".availability_alert").text(
              "Product availability can only contain numeric characters and not null"
            );
          } else{
        	  cAval = true;
        	  $(".availability_alert").text("");
          }
        });
      }
      function submitForm(){
    	  if (cName && cPrice && cAval && cImage){
    		  swal({
    			  title: "Xác nhận",
				  text: "Xác nhận thêm sản phẩm!",
				  buttons: {
					  cancel: {
						    text: "Hủy",
						    value: null,
						    visible: true,
						    className: "",
						    closeModal: true,
						  },
						  confirm: {
						    text: "Xác nhận",
						    value: true,
						    visible: true,
						    className: "",
						    closeModal: true
						  }
					  },
				}).then((isConfirm) => {
					  if(isConfirm){
						  console.log("posted")
						  document.getElementById("form-post-product").submit();
					  }
				});
    		  
    	  }
    	  else{
    		  swal("Vui lòng nhập đầy đủ thông tin",{
    			  button: false
    			});  
    	  }
      }
    </script>
</body>
</html>
