<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<% 
String item;
item=request.getParameter("item");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","sql@2024");
String sql="DELETE FROM menu WHERE item=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, item);

ps.executeUpdate();

ps.close();
con.close();
%>
<script>
		alert("Item Deleted Successfully!!");
		window.location.href = "http://localhost:8080/apna-canteen/editMenu.jsp";
</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	