<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
</head>
<body>
<%
	String us = request.getParameter("user");
	String password = request.getParameter("password");
	String email= request.getParameter("email");
	String DRIVER = "com.mysql.jdbc.Driver";
	Class.forName(DRIVER);
	String username = "root";
    String pass = "Harminder@2018";
    String url = "jdbc:mysql://localhost:3306/WebPage";
    try{	
    	Connection conn = DriverManager.getConnection(url, username, pass);
    	PreparedStatement stmt=conn.prepareStatement("insert into user (email,pass) values (?,?)" );
		stmt.setString(1, email);
	    stmt.setString(2, password);
	    int rs= stmt.executeUpdate();
   } catch (SQLException e) {
       e.printStackTrace();
   }
    response.sendRedirect("../view/signPop.jsp");
%>
</body>
</html>