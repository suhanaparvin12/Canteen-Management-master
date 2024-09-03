<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*, java.io.*"%>

<%
String role = request.getParameter("role");
String cid = request.getParameter("cid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String dept = request.getParameter("dept");
String emailId = request.getParameter("emailId");
String phone = request.getParameter("phone");
String add = request.getParameter("add");


if(cid.contains("AEC/"))
{
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "sql@2024")) {
	        String sql = "INSERT INTO canteen (CollegeId, Name, Department, Email, Phone, Address, Password, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
	        try (PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, cid);
	            ps.setString(2, name);
	            ps.setString(3, dept);
	            ps.setString(4, emailId);
	            ps.setString(5, phone);
	            ps.setString(6, add);
	            ps.setString(7, pass);
	            ps.setString(8, role);
	            ps.executeUpdate();
	            %>
	            <script>
	    			alert('Registration successfull !!');
	    			window.location.href = "http://localhost:8080/apna-canteen/index.jsp";
				</script>
				<%
	         }
	    }catch(SQLIntegrityConstraintViolationException e){
	    	%>
            <script>
    			alert('User Already Exists !!');
    			window.location.href = "http://localhost:8080/apna-canteen/index.jsp";
			</script>
			<%
	    }
	} catch (ClassNotFoundException | SQLException e) {
	    e.printStackTrace();
	    %>
        <script>
			alert('Registration Failed!!');
			window.location.href = "http://localhost:8080/apna-canteen/index.jsp";
		</script>
		<%
	}
}else{
	%>
	<script>
	    alert('College ID should start with AEC !');
	    window.location.href = "http://localhost:8080/apna-canteen/index.jsp";
	</script>
	<%
}


%>
