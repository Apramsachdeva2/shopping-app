<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Products</title>
</head>
<body style="background-color: pink;">
<h1 align="center" style="color: #00ffff; font-size:50px;">Add Products</h1>
<div align="right">
<a href="admin">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:blue; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Admin Home</button>
</a>
<a href="home">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Home</button>
</a>
</div>
<div align="center">
<form:form modelAttribute="product" method="post" action="insertProduct">
<form:label path="productId">Enter Product Id</form:label><br>
<form:input path="productId" name="productId"/><br><br>

<form:label path="productName">Enter Product Name</form:label><br>
<form:input path="productName" name="productName"/><br><br>

<form:label path="productPrice">Enter Product Price</form:label><br>
<form:input path="productPrice" name="productPrice"/><br><br>

<input type="submit" name="submit" value="Add Product" style="background-color: #42f5da;"/>

</form:form>
<h2>${message }</h2>
</div>
</body>
</html>