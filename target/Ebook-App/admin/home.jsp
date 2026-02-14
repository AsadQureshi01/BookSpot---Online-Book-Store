<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@ include file="allCss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.crd-ho:hover {
	background-color: #e6eaf0;
}

.card-body h4 {
	margin-top: 5px;
}
</style>


</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${ empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container" style="margin-top: 8%;">
		<h3 class="text-center"></h3>
		<div class="row" style="display: flex; justify-content: space-around;">

			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i>
							<h4>Add Books</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-book fa-3x text-danger"></i>
							<h4>View Books</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i>
							<h4>Orders</h4>
						</div>
					</div>
				</a>
			</div>



		</div>
	</div>
	<div style="margin-top: 260px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>