<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Books</title>
<%@ include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.crd-ho:hover {
	background-color: #e6eaf0;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%
		User u = (User) session.getAttribute("userObj");
	%>
	<c:if test="${not empty addCart }">

		<div id="toast">"${addCart }"</div>
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout( () => {
		        $("#toast").removeClass("display");
		    },2000)
		}	
	</script>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getAllRecentBooks();
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
						<%
							if (b.getBookCategory().equals("New")) {
						%>
						<div class="row ml-4">
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-sm btn-danger ml-4"><i
								class="fas fa-cart-plus"></i></a>
							<%
								} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-sm btn-danger ml-4"><i
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


						<div class="row ml-5">
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

	</div>
</body>
</html>