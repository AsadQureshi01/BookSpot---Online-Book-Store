<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f0f0;">
	<%@include file="navbar.jsp"%>
	<c:if test="${ empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h4 class="text-center">Hello Admin</h4>
	<table class="table">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone no</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Method</th>
			</tr>
		</thead>
		<tbody>
				<%
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> blist = dao.getAllOrder();
					for (Book_Order b:blist) {
				%>
				<tr>
					<td><%=b.getOrderId()%></td>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFulladd()%></td>
					<td><%=b.getPhno()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
					
				</tr>
				<%
					}
				%>
			</tbody>
		</tbody>
	</table>
	<div style="margin-top: 280px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>