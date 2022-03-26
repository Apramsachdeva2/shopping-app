<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
            <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Admin</title>
</head>
<body style="background-color: pink;">
<h1 align="center" style="color: #00ffff; font-size:50px;">Add Admin</h1>
<div align="right">
<a href="admin">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:blue; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Admin Home</button>
</a>
<a href="home">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Home</button>
</a>
</div>
<div align="center">
<form:form modelAttribute="admin" method="post" action="insertAdmin">
<form:label path="username">Enter Username</form:label><br>
<form:input path="username" name="username"/><br><br>

<form:label path="password">Enter Password</form:label><br>
<form:input type="password" path="password" name="password"/><br><br>



<input type="submit" name="submit" value="Add Admin" />

</form:form>
<h2>${message }</h2>
</div>
</body>
</html>