<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookSpot: User Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card" style="border-radius: 15px; margin-top: 20px;">
					<div class="card-body">
						<h4 class="text-center">Add Address</h4>
						<form action="">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="">
								</div>
							</div>

							<div class="form-row">

								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Postal code</label> <input
										type="number" class="form-control" id="inputPassword4"
										placeholder="">
								</div>
							</div>
							<div class="text-center">
								<button class="btn btn-warning text-white">Add Address</button>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>