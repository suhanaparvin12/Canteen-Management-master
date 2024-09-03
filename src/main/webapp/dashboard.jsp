<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
    href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css"
    rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="dashboardStyle.css">
<title>Dashboard | E-Canteen AEC</title>
</head>
<body>
<%
	String cid = "", pass = "";
	HttpSession ss = request.getSession();
	Object user = ss.getAttribute("cid");
	if(user!=null){
		cid = user.toString();
	}
	else{
		response.sendRedirect("index.jsp");
	}
%>
	<header class="header" id="header">
		<nav class="nav container">
			<a href="dashboard.jsp" class="nav__logo"><span>E</span>-Canteen</a>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item">
						<a href="dashboard.jsp" class="nav__link active">Home</a>
					</li>
					<li class="nav__item">
						<a href="#" class="nav__link">About Us</a>
					</li>
					<li class="nav__item">
						<a href="menu.jsp" class="nav__link">Today's Menu</a>
					</li>
					<li class="nav__item">
						<a href="review.jsp" class="nav__link">Reviews</a>
					</li>
					<li class="nav__item">
						<a href="#" class="nav__link">Contact Us</a>
					</li>
				</ul>
				<div class="nav__close" id="nav-close">
					<i class="ri-close-line"></i>
				</div>
			</div>
			<div class="nav__actions">
				<i class="ri-user-line nav__profile" id="profile"></i>
				<div class="nav__profile" >
					<ul class="nav__profile__list" id="nav-profile">
						<li class="nav__profile__item">
							<i class="ri-user-line"></i>
							<a href="#" class="nav__profile__link">Profile</a>
						</li>
						<li class="nav__profile__item">
							<i class="ri-logout-box-r-line"></i>
							<a href="logout.jsp" class="nav__profile__link">Logout</a>
						</li>
					</ul>
				</div>
				<div class="nav__toggle" id="nav-toggle">
					<i class="ri-menu-line"></i>
				</div>
			</div>
		</nav>
	</header> 
	<script src="dashboard.js"></script>
</body>
</html>