<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*, java.io.*"%>

<%
String role = request.getParameter("role");
String cid = request.getParameter("cid");
String pass = request.getParameter("pass");
	
if(role.isEmpty())
{
	%>
    <script>
        alert('Please select role !!');
        window.location.href = "http://localhost:8080/apna-canteen/index.jsp";
    </script>
    <%
}
else
{
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "sql@2024")) {
	        String sql = "SELECT * FROM canteen WHERE Role=? and CollegeId=? and Password=?;";
	        try (PreparedStatement ps = con.prepareStatement(sql)) {
	        	ps.setString(1, role);
	            ps.setString(2, cid);
	            ps.setString(3, pass);

	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    HttpSession ss = request.getSession();
	                    ss.setAttribute("cid", cid);
	                    Cookie userCookie = new Cookie("cid", cid);
	                    userCookie.setMaxAge(48 * 60 * 60);
	                    response.addCookie(userCookie);
	                    Cookie passwordCookie = new Cookie("pass", pass);
	                    passwordCookie.setMaxAge(48 * 60 * 60);
	                    response.addCookie(passwordCookie);
	                    if(role.equals("Student"))
	                    {
	                    	if(cid.contains("AEC/"))
	                    	{
	                    		response.sendRedirect("dashboard.jsp");
	                    	}
	                    	
	                    }
	                    else if(role.equals("Teacher"))
	                    {
	                    	response.sendRedirect("dashboard.jsp");
	                    }
	                    else if(role.equals("Staff"))
	                    {
	                    	response.sendRedirect("staffDashboard.jsp");
	                    }
	                  }
	                  else {
	                    %>
	                    <script>
	                        alert('Login Failed !!');
	                        window.location.href = "http://localhost:8080/apna-canteen/index.jsp";
	                    </script>
	                    <%
	            	  }
	         }
	       }
	    }
	} catch (ClassNotFoundException | SQLException e) {
	    e.printStackTrace();
	}
}


%>
