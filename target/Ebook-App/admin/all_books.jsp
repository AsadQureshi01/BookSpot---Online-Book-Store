<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f0f0;">
	<%@include file="navbar.jsp"%>
	<c:if test="${ empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h4 class="text-center">Hello Admin</h4>
	<c:if test="${ not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${ not empty failMsg }">
		<p class="text-center text-danger">${failMsg}</p>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<table class="table">
		<thead class="" style="background-color: #1089c2; color: white;">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getAllBook();
				for (BookDtls b : list) {
			%>
			<tr>
				<th><%=b.getBookId()%></th>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary">Edit</a> <a
					href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
	<div style="margin-top: 280px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>