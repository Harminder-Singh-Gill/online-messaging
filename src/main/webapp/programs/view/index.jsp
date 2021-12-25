<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="../css/index.css" rel="stylesheet">
</head>
<body>
	<div class="title">
			<h2>Login</h2>
		</div>
        <form action="../java/Login.jsp" method="post">
        	<div class="login">
        	    <input class="login-input" type="email" placeholder="Email" name="email" required>
	           <input class="login-input" type="password" placeholder="Password" name="pass" required>
	           <div class="btn-cont">
	           	<button class="btn" type="submit">LOGIN</button>
	           </div>
	           <div class="signup">
	               <label>Don't have an account? </label>
	               <a href="signup.jsp">Sign up</a>
	           </div>
	        </div>
        </form>
</body>
</html>