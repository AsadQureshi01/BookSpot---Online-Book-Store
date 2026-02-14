<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%
		User u = (User) session.getAttribute("userObj");
	%>
	<%@ include file="all_component/navbar.jsp"%>

	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 180px; width: 150px;"><br>
				<h4 class="mt-3">
					Book name:
					<%=b.getBookName()%></h4>
				<h4>
					Author name:
					<%=b.getAuthor()%></h4>
				<h4>
					Category:
					<%=b.getBookCategory()%></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
					if (b.getBookCategory().equals("Old")) {
				%>

				<h5>Contact to seller.</h5>
				<h5>
					<i class="far fa-envelope"></i>
					<%=b.getEmail()%></h5>
				<%
					}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<img src="img/cod.png" style="height: 100px; width: 100px;">
					</div>
				</div>

				<%
					if (b.getBookCategory().equals("Old")) {
				%>

				<div class="text-center">
					<a href="index.jsp" class="btn btn-primary mr-1">Continue
						Shopping</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>
				<%
					} else {
				%>


				<div class="text-center">
					<%
						if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-sm btn-danger ml-4"><i
						class="fas fa-cart-plus"></i></a>
					<%
						} else {
					%>
					<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-sm btn-danger ml-4"><i class="fas fa-cart-plus"></i></a>
					<%
						}
					%>
					<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>
						<%=b.getPrice()%></a>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>