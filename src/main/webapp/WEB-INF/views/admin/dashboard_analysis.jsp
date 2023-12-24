<%@page import="java.util.ArrayList"%>
<%@page import="com.devtam.DevShop.Entity.Product"%>
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
						<li><a href="<c:url value="/"/>admin/dashboard-myproducts"><i
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
<%
	Product product = (Product) request.getAttribute("product");	

%>
			<div class="dashboard-content">
				<div class="row">
					<div class="col-md-4" id="today" >

    				</div>
				    <div class="col-md-8 m-3" id="viewed-and-bought" >
				
				    </div>
				</div>
				<div class="row">
					<div class="row">
						
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
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	
	<%
		ArrayList<Integer> viewed = (ArrayList) request.getAttribute("viewed");
		ArrayList<Integer> bought = (ArrayList) request.getAttribute("bought");
	%>
	<script>
    var options = {
          series: [
      	  	{	<%int k = 20;%>
            	name: "Lượt truy cập",            	
            	data: [<%=viewed.get(0)%>, <%=viewed.get(1)%>, <%=viewed.get(2)%>, 
            	<%=viewed.get(3)%>, <%=viewed.get(4)%>, <%=viewed.get(5)%>, <%=viewed.get(6)%>]
       	  	},
      	  	{
              	name: "Lượt mua",
              	data: [<%=bought.get(0)%>, <%=bought.get(1)%>, <%=bought.get(2)%>, 
                	<%=bought.get(3)%>, <%=bought.get(4)%>, <%=bought.get(5)%>, <%=bought.get(6)%>]
      	  	}
			          
          ],
          chart: {
          height: 350,
          type: 'line',
          zoom: {
            enabled: false
          }
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          curve: 'straight'
        },
        title: {
          text: 'Tình hình tiêu thụ sản phẩm trong tuần qua',
          align: 'left'
        },
        grid: {
          row: {
            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
            opacity: 0.5
          },
        },
        xaxis: {
          categories: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
        }
        };

        var chart1 = new ApexCharts(document.querySelector("#viewed-and-bought"), options);
        chart1.render();
		
        var options = {
                series: [<%=product.getSold()%>, <%=product.getQuantity() - product.getSold()%>, 0],
                chart: {
                width: 380,
                type: 'pie',
              },
              title: {
                  text: 'Hiện trạng sản phẩm',
                  align: 'center'
                },
              labels: ['Sản phẩm đã bán', 'Sản phẩm còn lại','Hàng lỗi'],
              responsive: [{
                breakpoint: 480,
                options: {
                  chart: {
                    width: 200
                  },
                  legend: {
                    position: 'bottom'
                  }
                }
              }]
              };

              var chart = new ApexCharts(document.querySelector("#today"), options);
              chart.render();
</script>
</body>
</html>
