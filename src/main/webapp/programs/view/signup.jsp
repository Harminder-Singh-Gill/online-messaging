<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sign up</title>
        <link href="../css/signup.css" rel="stylesheet">
</head>
<body>
        <div class="title">
			<h2>Sign up</h2>
		</div>
        <form action="../java/backSign.jsp" method="post">
        	<div class="sign_up">
	           <input class="sign_up-input" type="email" placeholder="Email" name="email"   required>
	           <input class="sign_up-input" type="password" placeholder="Password" name="password" required>
	           <div class="btn-cont">
	           	<button class="btn" type="submit">SIGN UP</button>
	           </div>
	           <div class="login">
	               <label>Already have an account? </label>
	               <a href="index.jsp">Login in</a>
	           </div>
	        </div>
        </form>
</body>
</html>