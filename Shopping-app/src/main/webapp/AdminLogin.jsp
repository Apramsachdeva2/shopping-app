<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body style="background-color:pink;">
<h1 align="center">Admin Login</h1>
<div align="right">
<a href="home">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Home</button>
</a>
</div>
<div align="center">
<form action="adminHome" method="post">
<label style=" font-size: 20px;font-family:Georgia, serif;">Enter Username</label><br>
<input type="text" name="username" /><br><br>
<label style=" font-size: 20px;font-family:Georgia, serif;">Enter Password</label><br>
<input type="password" name="password" /><br><br>
<input type="submit" name="submit" value="Log In" style="font-size: 20px;font-family:Georgia, serif; background-color:cyan; border-radius:10%;"/><br><br>
</form>
</div>

<h2 align="center">${message }</h2>
</body>
</html>