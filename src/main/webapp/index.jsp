<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="style.css">
<title>Login | Apna Canteen</title>
</head>
<body>
<%
String cid = "", pass = "";
HttpSession ss = request.getSession();
Object user = ss.getAttribute("cid");

if (user != null) {
    response.sendRedirect("dashboard.jsp");
} else {
    Cookie cookies[] = request.getCookies();

    // Check if cookies is not null before iterating
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("cid")) {
                cid = cookies[i].getValue();
            }
            if (cookies[i].getName().equals("pass")) {
                pass = cookies[i].getValue();
            }
        }
    }
}

%>
<!-- 	<div class="navbar">
		<div class="left_nav">
			<h1>Apna Canteen</h1>
		</div>
		<div class="right_nav">
			<div class="nav_links">
				<a href="#">Home</a>
				<a href="#">Today's Menu</a>
				<a href="#">About</a>
				<a href="#">Contact</a>
			</div>
		</div>
	</div> -->
	<div class="header">
		<form action="checkLogin.jsp" method="post" id="login_form">
			<h1>Login</h1>
			<div class="field">
				<label for="role" >Role</label>
				<select name="role">
					<option value="" selected>Select Role</option>
					<option value="Student" >Student</option>
					<option value="Teacher" >Teacher</option>
					<option value="Staff" >Staff</option>
				</select>
			</div>
			<div class="field">
				<label for="cid" >College ID</label>
				<input name="cid" type="text" value="<%=cid %>" required>
			</div>
			<div class="field">
				<label for="pass">Password</label>
				<input name="pass" type="password" value="<%=pass %>" required>
			</div>
			<div class="btn_field">
				<input type="submit" value="Login">
			</div>
		</form>
		<form action="register.jsp" method="post" id="signup_form">
			<h1>Register</h1>
			<div class="field">
				<label for="role" >Role</label>
				<select name="role">
					<option value="" selected>Select Role</option>
					<option value="Student" >Student</option>
					<option value="Teacher" >Teacher</option>
					<option value="Staff" >Staff</option>
				</select>
			</div>
			<div class="field">
				<label for="name" >Name</label>
				<input name="name" type="text" required>
			</div>
			<div class="field">
				<label for="cid" >College ID</label>
				<input name="cid" type="text" required>
			</div>
			<div class="field">
				<label for="dept" >Department</label>
				<input name="dept" type="text" required>
			</div>
			<div class="field">
				<label for="emailId" >Email</label>
				<input name="emailId" type="email" required>
			</div>
			<div class="field">
				<label for="phone" >Phone</label>
				<input name="phone" type="tel" required>
			</div>
			<div class="field">
				<label for="add" >Address</label>
				<input name="add" type="text" required>
			</div>
			<div class="field">
				<label for="pass">Password</label>
				<input name="pass" type="password" required>
			</div>
			<div class="btn_field">
				<input type="submit" value="Register">
			</div>
		</form>
		<div class="loinswitch" id="loinswitch">
			<p>Don't have an account ?</p>
			<a id="regBtn" >Register</a>
		</div>
	</div>
	<script src="login.js"></script>
</body>
</html>