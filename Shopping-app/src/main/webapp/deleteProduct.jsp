<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Product</title>
</head>

<body style="background-color: pink;">
<h1 align="center" style="color: #00ffff; font-size:50px;">Delete Products</h1>
<div align="right">
<a href="admin">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:blue; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Admin Home</button>
</a>
<a href="home">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Home</button>
</a>
</div>
<div align="center">
<form action="removeProduct" method="post">
<label>Enter the product Id to be deleted</label><br><br>

<input type="text" name="pId" /><br><br>
<input type="submit" name="submit" value="Delete" /><br>
</form>
<br>
<h2>${message }</h2>
</div>
</body>
</html>