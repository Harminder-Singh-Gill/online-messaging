<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<%
String DRIVER = "com.mysql.jdbc.Driver";
Class.forName(DRIVER);
String username = "root";
String pass = "Harminder@2018";
String url = "jdbc:mysql://localhost:3306/WebPage";
String email = request.getParameter("email");
String password = request.getParameter("pass");
int auth = 0;
try{	
	Connection conn = DriverManager.getConnection(url, username, pass);
	PreparedStatement stmt=conn.prepareStatement(" SELECT * FROM  user" );
	ResultSet rs = stmt.executeQuery();
	while(rs.next()){
		String user = rs.getString(1);
		String pas = rs.getString(2);
		if(email.equals(user) && password.equals(pas)){
			 auth=1;
			 conn.close();
			 break;
		}
	}
} catch (SQLException e) {
   e.printStackTrace();
}
if(auth==1){
	session.setAttribute("user", email);
	response.sendRedirect("../view/homepage.jsp");
}else{
	response.sendRedirect("../view/loginWindow.jsp");	
}
%>
</body>
</html>