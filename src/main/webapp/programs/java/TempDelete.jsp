<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
String DRIVER = "com.mysql.jdbc.Driver";
Class.forName(DRIVER);
String username = "root";
String pass = "Harminder@2018";
String url = "jdbc:mysql://localhost:3306/WebPage";
int auth = 0;
try{	
	int id = Integer.parseInt(request.getParameter("id"));
    String email = session.getAttribute("user").toString();
	Connection conn = DriverManager.getConnection(url, username, pass);
	PreparedStatement stmt=conn.prepareStatement("Insert into trash (email,email_id)  values (?,?)");
	stmt.setString(1, email);
	stmt.setInt(2, id);
	int Value = stmt.executeUpdate();
} catch (SQLException e) {
   e.printStackTrace();
}
response.sendRedirect("../view/trash.jsp");
%>
</body>
</html>