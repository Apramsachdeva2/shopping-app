<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill</title>
<style type="text/css">
td
{
width:100px;
text-align: center;
}
</style>
</head>
<body style="background-color: #34e8eb">
<div align="right">
<a href="home">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Home</button>
</a>
</div>
<h1 align="center">Thank You for Shopping With Us</h1>

<div align="center">

<table border="1px" style="border-collapse:collapse; padding:10px;">
<tr>
<td>Product</td>
<td>Amount</td>
</tr>

<c:forEach var="i" items="${buyerList}">
<tr>
<td>${i.getProductName() }</td>
<td>${i.getProductPrice() }</td>
</tr>
</c:forEach>
</table>
<br><br>
<h2>Total : ${total }</h2>
</div>
<%

session.invalidate();

%>
</body>
</html>