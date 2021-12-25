<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>message</title>
<link href="../css/message.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<%
	response.setHeader("cache-control", " no-cache, no-store, must-relvaidate");
	if(session.getAttribute("user")==null){
		 	response.sendRedirect("index.jsp");
				 return;
	}
%>
<% 
	int id =Integer.parseInt(request.getParameter("id"));
	String DRIVER = "com.mysql.jdbc.Driver";
	Class.forName(DRIVER);
	String username = "root";
	String pass = "Harminder@2018";
	String url = "jdbc:mysql://localhost:3306/WebPage";
			try{
				Connection conn = DriverManager.getConnection(url, username, pass);
				PreparedStatement stmt2=conn.prepareStatement("SELECT * FROM email WHERE email_id= ?" );
			    stmt2.setInt(1, id);
			    ResultSet rs = stmt2.executeQuery();
			    while(rs.next()){
			    	  String message = rs.getString(5);
			    	  String sender = rs.getString(2);
			    	  String subject = rs.getString(4);
			    	  out.println("<h2> To: " +sender+"<h2>");
			    	  out.println("<p class='sub'> Subject: "+subject+"<p>");
			    	  out.println("<p class='sub'> Message: </p>");
			    	  out.println("<p>"+message+"<p>");
			    	  out.println("<a href='../java/Delete.jsp?id="+id+" '><i class='material-icons'>delete</i></a>");
			    	  out.println("<a href='../java/Restore.jsp?id="+id+" '><i class='material-icons'>restore</i></a>");
			    }
			    conn.close();
			} catch (SQLException e) {
				   e.printStackTrace();
			}
%>
</body>
</html>