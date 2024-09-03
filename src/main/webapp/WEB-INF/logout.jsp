<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% 
	HttpSession ss = request.getSession();
	ss.invalidate();
	response.sendRedirect("index.jsp");
%>