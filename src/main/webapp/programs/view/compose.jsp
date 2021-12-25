<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compose page</title>
<link href="../css/compose.css" rel="stylesheet">
</head>
<body>
<%	
response.setHeader("cache-control", " no-cache, no-store, must-relvaidate");
if(session.getAttribute("user")==null){
	 response.sendRedirect("index.jsp");
} 
%>
<div class="cont-1" autofocus>
        <header>
            <h1 class="logo">Compose</h1>
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
      <form action="../java/backCompose.jsp" method="post">
        	<div class="compose">
        	    <input class="compose-input"  type="text" placeholder="To" name="sender" required>
        	     <input class="compose-input"  type="text" placeholder="Subject" name="subject" required>
	           <textarea class="compose-input"  name="message" placeholder="Message"rows="4" cols="50" required></textarea>
	           <div class="btn-cont">
	           	<button class="btn" type="submit">submit</button>
	           </div>
	        </div>
        </form>
</body>
</html>