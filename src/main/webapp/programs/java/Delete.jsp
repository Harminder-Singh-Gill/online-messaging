<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>message</title>
<link href="message.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<% 
	int id =Integer.parseInt(request.getParameter("id"));
	String DRIVER = "com.mysql.jdbc.Driver";
	Class.forName(DRIVER);
	String username = "root";
	String pass = "Harminder@2018";
	String url = "jdbc:mysql://localhost:3306/WebPage";
			try{
				Connection conn = DriverManager.getConnection(url, username, pass);
				PreparedStatement stmt2=conn.prepareStatement(" UPDATE trash SET deleted = ? WHERE email_id = ? " );
				stmt2.setBoolean(1, true);
				stmt2.setInt(2, id);
				int value = stmt2.executeUpdate();
			    conn.close();
			} catch (SQLException e) {
				   e.printStackTrace();
			}
			response.sendRedirect("../view/trash.jsp");
%>
</body>
</html>