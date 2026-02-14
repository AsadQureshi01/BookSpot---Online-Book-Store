<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>


	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card" style="border-radius: 15px; margin-top: 20px;">
					<div class="card-body">
						<h4 class="text-center">Sell Old Books</h4>

						<c:if test="${ not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${ not empty failMsg }">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<form action="addOldBook" method="post" enctype="multipart/form-data">
							<input type="hidden" name="userEmail" value="${userObj.email }">
							<div class="form-group">
								<label for="exampleInputEmail1">Book name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>

							<div class="form-group">
								<label for="inputState">Book Categories*</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--Select--</option>
									<option value="Free">Free</option>
									<option value="Old">Old</option>
								</select>
							</div>


							<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required" name="bimg">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>












</body>

</html>