<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JEEproject", "root", "");
Statement stat = conn.createStatement();
String data;
ResultSet res;
%>


<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Yamifood Restaurant</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.jsp"> <img
					src="images/logo.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbars-rs-food" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="menu.jsp">Menu</a></li>
						<li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown-a"
							data-toggle="dropdown">Pages</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="reservation.jsp">Reservation</a>
								<a class="dropdown-item" href="stuff.html">Stuff</a> <a
									class="dropdown-item" href="gallery.jsp">Gallery</a>
							</div></li>
						

						<%
						if (session.getAttribute("nom") == null) {
						%>
						<li class="nav-item"><a class="nav-link"
							href="auth.jsp">signin</a></li>
						<li class="nav-item"><a class="nav-link"
							href="auth2.jsp">Login</a></li>
						<%
						} else {
						String nom = "";
						
						nom = session.getAttribute("nom").toString();
						%>

						<li><a class="nav-link" href="#" fixed>Welcome <%=nom%></a></li>
						<li><a class="nav-link" href="../Logout" fixed>Logout</a></li>
						
						<%
						}
						
						String admin="";
						if(session.getAttribute("admin") != null){
						admin =session.getAttribute("admin").toString();
						if (admin !=null ){
						%>
						<li><a class="nav-link" href="admin.jsp" fixed>Dashboard</a></li>
						<%}} %>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>

					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->

	<!-- Start slides -->
	<div id="slides" class="cover-slides">
		<ul class="slides-container">
			<li class="text-center"><img src="images/slider-01.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong>Welcome To <br> Yamifood Restaurant
								</strong>
							</h1>
							
							<p>
								<a class="btn btn-lg btn-circle btn-outline-new-white" href="reservation.jsp">Reservation</a>
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-center"><img src="images/slider-02.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong>Welcome To <br> Yamifood Restaurant
								</strong>
							</h1>
							
							<p>
								<a class="btn btn-lg btn-circle btn-outline-new-white" href="reservation.jsp">Reservation</a>
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-center"><img src="images/slider-03.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong>Welcome To <br> Yamifood Restaurant
								</strong>
							</h1>
							
							<p>
								<a class="btn btn-lg btn-circle btn-outline-new-white" href="reservation.jsp">Reservation</a>
							</p>
						</div>
					</div>
				</div></li>
		</ul>
		<div class="slides-navigation">
			<a href="#" class="next"><i class="fa fa-angle-right"
				aria-hidden="true"></i></a> <a href="#" class="prev"><i
				class="fa fa-angle-left" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- End slides -->

	<!-- Start About -->
	<div class="about-section-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12">
					<img src="images/about-img.jpg" alt="" class="img-fluid">
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 text-center">
					<div class="inner-column">
						<h1>
							Welcome To <span>Yamifood Restaurant</span>
						</h1>
						<h4>Little Story</h4>
						<p>The TO restaurant makes the Paris 10th district vibrate
							This bobo and romantic district appeals enormously to Parisians
							and tourists, due to its authenticity and its relaxed and chic
							atmosphere. On sunny days, the crowd flocks to enjoy the view,
							the banks but also the trendy addresses that are there!
							Cosmopolitan like its public, the St-Martin canal has long been
							cultivating world cuisines and the fusion-style bistronomy
							offered by restaurant TO fits in perfectly.</p>
						<a class="btn btn-lg btn-circle btn-outline-new-white" href="reservation.jsp">Reservation</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End About -->

	<!-- Start QT -->
	<div class="qt-box qt-background">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto text-left">
					<p class="lead ">" If you're not the one cooking, stay out of
						the way and compliment the chef. "</p>
					<span class="lead">Michael Strahan</span>
				</div>
			</div>
		</div>
	</div>
	<!-- End QT -->



	<!-- Start Gallery -->
	<div class="gallery-box">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						<h2>Gallery</h2>
						<p>Explore our restaurant</p>
					</div>
				</div>
			</div>
			<div class="tz-gallery">
				<div class="row">
					<%
					data = " SELECT * FROM gallery";
					res = stat.executeQuery(data);
					int i = 0;
					while (res.next() && i < 6) {
					%>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<a class="lightbox"
							href="images/<%=res.getString("image").toString()%>"> <img
							class="img-fluid"
							src="images/<%=res.getString("image").toString()%>"
							alt="Gallery Images">
						</a>
					</div>
					<%
					i++;
					}
					%>

				</div>
			</div>
			
		
				
				<div class="col-lg-12 col-md-12 col-sm-12 text-center">
					<div class="inner-column">
						
						<a class="btn btn-lg btn-circle btn-outline-new-white" href="gallery.jsp">Explore more</a>
					</div>
				</div>
		
	</div>
	</div>
	<!-- End Gallery -->

	<!-- Start Customer Reviews -->
	<div class="customer-reviews-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						<h2>Customer Reviews</h2>
						<p>Read some of our customer reviews</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 mr-auto ml-auto text-center">
					<div id="reviews" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner mt-4">
									<%
					data = " SELECT * FROM avis";
					res = stat.executeQuery(data);
					int k=0;
					while (res.next()) {
						if(k<1){
					%>
							<div class="carousel-item text-center active">
								<div class="img-box p-1 border rounded-circle m-auto">
									<img class="d-block w-100 rounded-circle"
										src="images/<%=res.getString("image").toString() %>" alt="">
								</div>
								<h5 class="mt-4 mb-0">
					
									<strong class="text-warning text-uppercase"><%=res.getString("nom_complet").toString() %></strong>
								</h5>
								<h6 class="text-dark m-0"><%=res.getString("job").toString() %></h6>
								<p class="m-0 pt-3"><%=res.getString("avis").toString() %></p>
							</div>
							<%}else{
								%>
								<div class="carousel-item text-center ">
								<div class="img-box p-1 border rounded-circle m-auto">
									<img class="d-block w-100 rounded-circle"
										src="images/<%=res.getString("image").toString() %>" alt="">
								</div>
								<h5 class="mt-4 mb-0">
					
									<strong class="text-warning text-uppercase"><%=res.getString("nom_complet").toString() %></strong>
								</h5>
								<h6 class="text-dark m-0"><%=res.getString("job").toString() %></h6>
								<p class="m-0 pt-3"><%=res.getString("avis").toString() %></p>
							</div>
								
								
								
								
								
							<%}
						k++;
							} %>
							
							
						</div>
						<a class="carousel-control-prev" href="#reviews" role="button"
							data-slide="prev"> <i class="fa fa-angle-left"
							aria-hidden="true"></i> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#reviews" role="button"
							data-slide="next"> <i class="fa fa-angle-right"
							aria-hidden="true"></i> <span class="sr-only">Next</span>
						</a>
						<div class="col-lg-12 col-md-12 col-sm-12 text-center">
					<div class="inner-column">
						<br>
						<br>
						<%
						if (session.getAttribute("nom") != null) {
						%>
						<a class="btn btn-lg btn-circle btn-outline-new-white" href="review.html">Add review</a>
						<%} %>
					</div>
				</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Customer Reviews -->

	<!-- Start Contact info -->
	<div class="contact-imfo-box">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<i class="fa fa-volume-control-phone"></i>
					<div class="overflow-hidden">
						<h4>Phone</h4>
						<p class="lead">+01 123-456-4590</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-envelope"></i>
					<div class="overflow-hidden">
						<h4>Email</h4>
						<p class="lead">yourmail@gmail.com</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-map-marker"></i>
					<div class="overflow-hidden">
						<h4>Location</h4>
						<p class="lead">800, Lorem Street, US</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Contact info -->


	<!-- Start Footer -->
	<footer class="footer-area bg-f">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h3>About Us</h3>
					<p>Integer cursus scelerisque ipsum id efficitur. Donec a dui
						fringilla, gravida lorem ac, semper magna. Aenean rhoncus ac
						lectus a interdum. Vivamus semper posuere dui, at ornare turpis
						ultrices sit amet. Nulla cursus lorem ut nisi porta, ac eleifend
						arcu ultrices.</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Opening hours</h3>
					<p>
						<span class="text-color">Monday: </span>Closed
					</p>
					<p>
						<span class="text-color">Tue-Wed :</span> 9:Am - 10PM
					</p>
					<p>
						<span class="text-color">Thu-Fri :</span> 9:Am - 10PM
					</p>
					<p>
						<span class="text-color">Sat-Sun :</span> 5:PM - 10PM
					</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Contact information</h3>
					
					<p class="lead">
						<a href="#">+01 2000 800 9999</a>
					</p>
					<p>
						<a href="#"> info@admin.com</a>
					</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>location</h3>
					<p class="lead">Ipsum Street, Lorem Tower, MO, Columbia, 508000</p>
					<ul class="list-inline f-social">
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-linkedin" aria-hidden="true"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-google-plus" aria-hidden="true"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-instagram" aria-hidden="true"></i></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p class="company-name">
							All Rights Reserved. &copy; 2018 <a href="#">Yamifood
								Restaurant</a> Design By : <a href="https://html.design/">html
								design</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>