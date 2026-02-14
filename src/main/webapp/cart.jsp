<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookSpot: Cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${ empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty successMsg }">
		<div class="alert alert-success text-center" role="alert">${ successMsg}</div>
		<c:remove var="successMsg" scope="session" />

	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${ failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 p-3">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
									User u = (User) session.getAttribute("userObj");
									CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
									List<Cart> cart = dao.getBookByUser(u.getId());
									double totalPrice = 0;
									for (Cart c : cart) {
										totalPrice = c.getTotal_price();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="removeBook?cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
									}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>

			<div class="col-md-6 p-3">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Order Details</h3>
						<form action="order" method="post">
							<input type="hidden" name="id" value="<%=u.getId()%>">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" required="required"
										readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" required="required"
										readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone number</label> <input
										type="number" name="phno" class="form-control"
										id="inputEmail4" value="<%=u.getPhno()%>" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4"
										required="required" placeholder="">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4"
										required="required" placeholder="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputPassword4"
										required="required" placeholder="">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4"
										required="required" placeholder="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Postal code</label> <input
										name="pincode" type="number" class="form-control"
										id="inputPassword4" required="required" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Method</label> <select class="form-control"
									name="payment" name="payment_method">
									<option value="Select">Select</option>
									<option value="cod">Cash on delivery</option>
									<option value="Online Payment">Online Payment</option>
								</select>
							</div>

							<div class="text-center">
							
								
								<button id="payButton" class="btn btn-warnings"
									style="background: blue; color: white;">Order Now</button>
							
							
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var xhttp = new XMLHttpRequest();
		var RazorpayOrderId;
		function CreateOrderID() {
			xhttp.open("GET", "http://localhost:8080/Ebook-App/OrderCreation",
					false);
			xhttp.send();
			RazorpayOrderId = xhttp.responseText;
			OpenCheckout();
		}
	</script>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script>
		function OpenCheckout() {
			var options = {
				"key" : "rzp_test_mpoXI0kSCNDKuU", // Enter the Key ID generated from the Dashboard
				"amount" :
	<%=totalPrice%>
		, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
				"currency" : "INR",
				"name" : "BookSpot",
				"description" : "BookSpot an online book store.",
				"image" : "https://example.com/your_logo",
				"order_id" : RazorpayOrderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
				/* "handler": function (response){
				    alert(response.razorpay_payment_id);
				    alert(response.razorpay_order_id);
				    alert(response.razorpay_signature)
				}, */
				"callback_url" : "http://localhost:8080/Ebook-App/OrderCreation",
				"prefill" : {
					"name" : "Gaurav Kumar",
					"email" : "gaurav.kumar@example.com",
					"contact" : "9999999999"
				},
				"notes" : {
					"address" : "Razorpay Corporate Office"
				},
				"theme" : {
					"color" : "#3399cc"
				}
			};
			var rzp1 = new Razorpay(options);
			rzp1.on('payment.failed', function(response) {
				alert(response.error.code);
				alert(response.error.description);
				alert(response.error.source);
				alert(response.error.step);
				alert(response.error.reason);
				alert(response.error.metadata.order_id);
				alert(response.error.metadata.payment_id);
			});
			rzp1.open();
			e.preventDefault();

		}
	</script>
</body>
</html>