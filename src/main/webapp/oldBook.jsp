<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookSpot: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<table class="table table-hover table-light mt-3"
			style="border-radius: 5px;">
			<c:if test="${ not empty failedMsg }">
				<p class="text-center text-danger">${failedMsg}</p>
				<c:remove var="failedMsg" scope="session" />
			</c:if>

			<c:if test="${ not empty succMsg }">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<thead>
				<tr>
					<th scope="col">Book name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>

			<tbody>
				<%
					User u = (User) session.getAttribute("userObj");
					String email = u.getEmail();
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list = dao.getUserOldBooks(email);
					for (BookDtls b : list) {
				%>
				<tr>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="userBookDelete?bid=<%=b.getBookId()%>&&email=<%=b.getEmail()%>"
						class="btn btn-danger">Delete</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>