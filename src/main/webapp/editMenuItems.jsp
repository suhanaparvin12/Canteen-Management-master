<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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


int regno;
String item;
int price;
price = Integer.parseInt(request.getParameter("price"));
item = request.getParameter("item");

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","sql@2024");
String sql="UPDATE menu SET price=?, editor=? WHERE item=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, price);
ps.setString(2, cid);
ps.setString(3, item);

ps.executeUpdate();

ps.close();
con.close();
%>
<script>
	alert("Item Updated Successfully!!");
	window.location.href = "http://localhost:8080/apna-canteen/editMenu.jsp";
</script>

	