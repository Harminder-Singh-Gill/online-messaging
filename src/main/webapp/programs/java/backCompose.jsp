<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>compose page</title>
</head>
<body>
<%
String DRIVER = "com.mysql.jdbc.Driver";
Class.forName(DRIVER);
String username = "root";
String pass = "Harminder@2018";
String url = "jdbc:mysql://localhost:3306/WebPage";
String rec = request.getParameter("sender");
String subject = request.getParameter("subject");
String m = request.getParameter("message");
String message = m.replaceAll(" (\n) " ,  " ");
String sender = session.getAttribute("user").toString();
int auth = 0;
try{	
	Connection conn = DriverManager.getConnection(url, username, pass);
	PreparedStatement stmt=conn.prepareStatement("SELECT email FROM user" );
    ResultSet rs = stmt.executeQuery();
    while(rs.next()){
    	String user = rs.getString(1);
    	if(rec.equals(user)){
    			auth=1;
    			conn.close();
    			break;
    	}
    }
} catch (SQLException e) {
   e.printStackTrace();
}
if(auth==1){
	try{
		String trash="yes";
		Connection conn = DriverManager.getConnection(url, username, pass);
		PreparedStatement stmt2=conn.prepareStatement("insert into email (sender,reciver,subject,message) values (?,?,?,?)" );
	    stmt2.setString(1, sender);
		stmt2.setString(2, rec);
	    stmt2.setString(3, subject);
	    stmt2.setString(4, message);
	    int pq= stmt2.executeUpdate();
	    conn.close();
	    response.sendRedirect("../view/composeWind.jsp");
	} catch (SQLException e) {
		   e.printStackTrace();
	}
}else{
	response.sendRedirect("../view/comWind.jsp");
}
%>
</body>
</html>