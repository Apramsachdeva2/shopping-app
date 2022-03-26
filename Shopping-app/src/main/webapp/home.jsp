<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.List" %>
    <%@ page import="com.shopping.models.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<style type="text/css">
td
{
width:100px;
text-align: center;
}
button{
  background-color: #d742f5;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
</head>
<body style="background-color: pink;">
<h1 style="color: #d742f5; font-size:50px;" align="center">Grocery Store</h1>



<div align="right">
<a href="adminLogin"><button >Admin</button></a>
</div>
<div align="center">
<%-- ${productList } --%>

<table border="1px" style="border-collapse:collapse; padding:10px;">
<tr>
<td><h3>Product Id</h3></td>
<td><h3>Product Name</h3></td>
<td><h3>Product Price</h3></td>
<td></td>
</tr>
<c:forEach var="i" items="${productList}">
<tr>
<td><c:out value="${i.getProductId() }" /></td>
<td><h3>${i.getProductName() }</h3></td>
<td><h3>${i.getProductPrice() }</h3></td>
<td><h3><a href="buy?pId=${i.getProductId()}"><button style=" background-color: #05ad4e;
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;">Buy</button></a></h3></td>
</tr>
</c:forEach>
</table>

</div>
<% 
List<Product> buyerList=(List<Product>)session.getAttribute("buyerList");
if(!buyerList.isEmpty()){
%>
<div align="center">
<h2>Your Cart:</h2>
<table>
<tr>
<td>Product</td>
<td>Amount</td>
<td></td>
</tr>

<c:forEach var="i" items="${buyerList}">
<tr>
<td>${i.getProductName() }</td>
<td>${i.getProductPrice() }</td>
<td><a href="delete?pId=${i.getProductId()}"><button style="  background-color: #fc6203;
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;">Delete</button></a></td>
</tr>

</c:forEach>
</table>
</div>

<div align="center">
<a href="generateBill">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 3px 5px #888888;">Generate Bill</button>
</a>
</div>
<%
}

%>
</body>
</html>