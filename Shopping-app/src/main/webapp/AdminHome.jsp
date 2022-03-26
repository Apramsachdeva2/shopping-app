<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" isErrorPage="false"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>

</head>
<body style="background-color: pink;">
<h1 style="color: #00ffff; font-size:50px;" align="center">Admin Home</h1>
<div align="right">
<a href="home">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:green; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 2px 3px #888888;">Home</button>
</a>
</div>


<h1 style="color:blue;" align="center">Welcome ${username.toUpperCase()}</h1>
<br>
<div align="center">
<%-- ${productList } --%>
<%System.out.println(session.getAttribute("productList")); %>
<table border="1px" style="border-collapse:collapse;">
<tr>
<td>Product Id</td>
<td>Product Name</td>
<td>Product Price</td>
<!-- <td></td> -->
</tr>
<c:forEach var="i" items="${productList}">
<tr>
<td><c:out value="${i.getProductId() }" /></td>
<td>${i.getProductName() }</td>
<td>${i.getProductPrice() }</td>
<%-- <td><a href="buy?pId=${i.getProductId()}">Buy</a></td> --%>
</tr>
</c:forEach>
</table>

</div>
<div align="center" style="padding:20px;">

<a href="addProduct">
<button style="font-size: 20px;font-family: Georgia, serif; background-color:red; color:white;padding:10px; border-radius:5%; border:none; margin:20px;box-shadow: 3px 5px #888888;">Add Products</button>
</a>
<div>
<a href="updateProduct"><button style="font-size: 20px;font-family: Georgia, serif;padding:10px; background-color:green; color:white; border-radius:5%;border:none; margin:20px;box-shadow: 3px 5px #888888;">Update Product</button>
</a>
</div>

<div>
<a href="addAdmin"><button style="font-size: 20px;font-family: Georgia, serif;padding:10px; background-color:green; color:white; border-radius:5%;border:none; margin:20px;box-shadow: 3px 5px #888888;">Add Admin</button>
</a>
</div>

<div>
<a href="deleteProduct"><button style="font-size: 20px;font-family: Georgia, serif;padding:10px; background-color:#8af542; color:black; border-radius:5%;border:none; margin:20px;box-shadow: 3px 5px #888888;">Delete Product</button>
</a>
</div>
<div>
<a href="deleteAdmin"><button style="font-size: 20px;font-family: Georgia, serif;padding:10px; background-color:#f59e42; color:white; border-radius:5%;border:none; margin:20px;box-shadow: 3px 5px #888888;">Delete Admin</button>
</a>
</div>

</div>

</body>
</html>