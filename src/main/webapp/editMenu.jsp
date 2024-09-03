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
<title>Today's Menu | E-Canteen AEC</title>
</head>
<body>
<%@ page import="java.sql.*"%>
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
			<a href="staffDashboard.jsp" class="nav__logo"><span>E</span>-Canteen</a>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item">
						<a href="staffDashboard.jsp" class="nav__link">Home</a>
					</li>
					<li class="nav__item">
						<a href="#" class="nav__link">About Us</a>
					</li>
					<li class="nav__item">
						<a href="editMenu.jsp" class="nav__link active">Today's Menu</a>
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
	<div class="main">
		<div class="add_item">
			<div class="add_item_btn" id="add-btn">
				<i class="ri-add-line addBtn" ></i>
			</div>
			<div class="form_container" id="form-container">
				<i class="ri-close-fill form_close" id="form-close"></i>
				<form method="post" action="addMenuItems.jsp">
					<div class="field">
						<label>Item Name</label>
						<input type="text" placeholder="eg. Coffee, Tea, Dhosa" name="item" required>
					</div>
					<div class="field">
						<label>Item Price</label>
						<input type="number" placeholder="eg. ₹ 10" value="₹" name="price" required>
					</div>
					<div class="field">
						<input type="submit" value="Add">
					</div>
				</form>
			</div>
		</div>
        <table>
            <thead>
            <tr>
                <th>ITEM</th>
                <th>PRICE</th>
                <th>REVIEW</th>
                <th>ACTION</th>
            </tr>
            </thead>
				<tbody>
    				<tr>
        				<%
            				Class.forName("com.mysql.jdbc.Driver");
            				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","sql@2024");
            				PreparedStatement ps = con.prepareStatement("SELECT * FROM menu;");
            				ResultSet rs = ps.executeQuery();
            				int rating;
            				String item="", price="", editor="";
            				while(rs.next()){
                				item=rs.getString(1);
                				price=rs.getString(2);
                				rating=rs.getInt(3);
                				editor = rs.getString(4);
        				%>
        				<tr>
            			<td><%=item %></td>
            			<td>₹ <%= price %></td>
            			<td>
                			<%-- Display stars based on the rating --%>
                			<% for (int i = 0; i < rating; i++) { %>
                    			<i class="ri-star-fill rating_star"></i>
                			<% } %>
            			</td>
            			<%
                			if(editor.equals(cid))
                			{
            			%>
            			<td>
                			<a data-item="<%=item %>" data-price="<%=price %>" onclick="editItem(this)"><i class="ri-pencil-line edit_btn"></i></a>
                			<a href="deleteItem.jsp?item=<%=item %>"><i class="ri-delete-bin-line"></i></a>
            			</td>
            			<%
                			}
            			%>
        				</tr>
        				<%
        				}
        				%>
						</tbody>

        </table>
        <div class="form_container" id="edit-form-container">
				<i class="ri-close-fill form_close" id="edit-form-close"></i>
				<form method="post" action="editMenuItems.jsp">
					<div class="field">
						<label>Item Name</label>
						<input type="text" placeholder="eg. Coffee, Tea, Dhosa" name="item" required>
					</div>
					<div class="field">
						<label>Item Price</label>
						<input type="number" placeholder="eg. ₹ 10" name="price" required>
					</div>
					<div class="field">
						<input type="submit" value="Update">
					</div>
				</form>
			</div>
	</div>
	<script src="main.js"></script>
</body>
</html>