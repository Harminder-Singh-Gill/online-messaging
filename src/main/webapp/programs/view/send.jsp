<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sent</title>
<link href="../css/sent.css" rel="stylesheet">
</head>
<body>
<%
	response.setHeader("cache-control", " no-cache, no-store, must-relvaidate");

	if(session.getAttribute("user")==null){
		 response.sendRedirect("index.jsp");
		 return;
	}
%>
<div class="cont-1" autofocus>
        <header>
            <h1 class="logo">Sent</h1>
            <nav class="nav">
                <ul>
                    <li><a href="homepage.jsp">Inbox</a></li>
                    <li><a href="compose.jsp">Compose</a></li>
                    <li><a href="send.jsp">Sent</a></li>
                    <li><a href="trash.jsp">Trash</a></li>
                    <li><a href="../java/logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </header>
    </div>
    <div class="cont-2">
     	<main>
 	            <nav class="nav2">
                <ul>
                    <li><h2>To</h2></li>
                    <li><h2 class="sub">Subject</h2></li>
                </ul>
            </nav>
            <div class="inbox">
               <table>
                	<tbody>
                		  <%
	                		  String DRIVER = "com.mysql.jdbc.Driver";
	                		  Class.forName(DRIVER);
	                		  String username = "root";
	                		  String pass = "Harminder@2018";
	                		  String url = "jdbc:mysql://localhost:3306/WebPage";
               					try{
               						Connection conn = DriverManager.getConnection(url, username, pass);
               						PreparedStatement stmt2=conn.prepareStatement("SELECT * FROM email WHERE sender= ? and email_id not in(select email_id from trash where email= ?)" );
              						String email = session.getAttribute("user").toString();
              						stmt2.setString(1, email);
              						stmt2.setString(2, email);
               					    ResultSet rs = stmt2.executeQuery();
               					    while(rs.next()){
               					    	  String reciver = rs.getString(3);
               					    	  String subject = rs.getString(4);
               					    	  int id = rs.getInt(1);
          					    		  out.println("<tr><td><a href='#'  >"  +reciver+"</a></td> ");
                					      out.println("<td class='subject'><a href= 'messComp.jsp?id="+id+" '  >"+ subject+" </a></td></tr>");
               					    }
               					    conn.close();
               					} catch (SQLException e) {
               						   e.printStackTrace();
               					}
                		  %>
                	</tbody>
               </table>
            </div>
    	</main>
    </div>
</body>
</html>