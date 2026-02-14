<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookSpot: Setting</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center">Hello</h3>
		<div class="row p-5">
			<div class="col-md-6">
				<a href="cart.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6">
				<a href="cart.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>





			<div class="col-md-6 mt-3" style="margin: auto;">
				<a href="cart.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h3>Orders</h3>
						</div>
					</div>
				</a>
			</div>
		</div>

	</div>
</body>
</html>