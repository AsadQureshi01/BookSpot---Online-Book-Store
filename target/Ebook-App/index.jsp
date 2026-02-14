<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookSpot: INDEX</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/bookwall.png");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

.crd-ho:hover {
	background-color: #e6eaf0;
}
</style>


</head>
<body style="background-color: #f0f0f0;">

	<%
		User u = (User) session.getAttribute("userObj");
	%>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger"></h2>
	</div>

	<!--Recent book container  -->

	<div class="container">
		<h3 class="text-center">Recent book</h3>
		<div class="row">
			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list1 = dao.getRecentBooks();
				for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p>By: <%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<%
							if (b.getBookCategory().equals("New")) {
						%>
						<div class="row">
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-sm btn-danger ml-4"><i
								class="fas fa-cart-plus"></i></a>
							<%
								} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-sm btn-danger ml-4"><i
								class="fas fa-cart-plus"></i></a>
							<%
								}
							%>
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm btn-success ml-1">View details</a> <a href=""
								class="btn btn-sm btn-danger ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
							} else {
						%>


						<div class="row ml-4">
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm btn-success ml-1">View details</a> <a href=""
								class="btn btn-sm btn-danger ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>

						<%
							}
						%>

					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm">View
				all</a>
		</div>
	</div>


	<!-- Recent book end -->
	<hr>
	<!--New book container  -->

	<div class="container">
		<h3 class="text-center">New book</h3>
		<div class="row">

			<%
				List<BookDtls> list = dao.getNewBook();
				for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p>By: <%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
						
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-sm btn-danger ml-4"><i
								class="fas fa-cart-plus"></i></a>
							<%
								} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-sm btn-danger ml-4"><i
								class="fas fa-cart-plus"></i></a>
							<%
								}
							%>
						
						
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm btn-success ml-1">View details</a> <a
								href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm btn-danger ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
				}
			%>
		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm">View all</a>
		</div>
	</div>
	<!-- New book end -->
	<hr>
	<!--Old book container  -->

	<div class="container" style="overflow-x: auto;">
		<h3 class="text-center">Old book</h3>
		<div class="row">

			<%
				List<BookDtls> list3 = dao.getOldBooks();
				for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p>By: <%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm">View all</a>
		</div>
	</div>
	<!-- Old book end -->

	<%@include file="all_component/footer.jsp"%>
	
</body>
</html>