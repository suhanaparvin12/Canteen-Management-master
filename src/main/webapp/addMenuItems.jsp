<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*, java.io.*"%>

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

<%
String item = request.getParameter("item");
int price = Integer.parseInt(request.getParameter("price"));

	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "sql@2024")) {
	        String sql = "INSERT INTO menu (item, price, editor) VALUES (?, ?, ?);";
	        try (PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, item);
	            ps.setInt(2, price);
	            ps.setString(3, cid);
	            ps.executeUpdate();
	            %>
	            <script>
	    			alert('Item Added Successfully!!');
	    			window.location.href = "http://localhost:8080/apna-canteen/editMenu.jsp";
				</script>
				<%
	         }
	    }catch(SQLIntegrityConstraintViolationException e){
	    	%>
            <script>
    			alert('Item Already Exists !!');
    			window.location.href = "http://localhost:8080/apna-canteen/editMenu.jsp";
			</script>
			<%
	    }
	} catch (ClassNotFoundException | SQLException e) {
	    e.printStackTrace();
	    %>
        <script>
			alert('Failed to add item!!');
			window.location.href = "http://localhost:8080/apna-canteen/editMenu.jsp";
		</script>
		<%
	}


%>