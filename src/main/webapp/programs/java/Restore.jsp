<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.mysql.cj.jdbc.Driver"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			String email = session.getAttribute("user").toString();
			Connection conn = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt2=conn.prepareStatement("DELETE FROM  trash WHERE email_id = ?  AND email = ? " );
			stmt2.setInt(1, id);
			stmt2.setString(2, email);
			int value = stmt2.executeUpdate();
		    conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		response.sendRedirect("../view/homepage.jsp");
%>
</body>
</html>