<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>

<%@ include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.crd-ho:hover {
	background-color: #e6eaf0;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getAllOldBooks();
				for (BookDtls b : list) {
			%>
			<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 120px; height: 150px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="row ml-5">
							<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-sm btn-success ml-1">View details</a> <a
								href="" class="btn btn-sm btn-danger ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>


					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>

	</div>
</body>
</html>