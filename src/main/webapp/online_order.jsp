<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-3x text-success"></i>
		</div>
		<div class="container text-center mt-3">
		<button id="payButton" class="btn btn-warnings"
			onclick="CreateOrderID()" style="background: blue; color: white;">Pay
			Now</button>
	</div>
	<%
		User u = (User) session.getAttribute("userObj");
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		List<Cart> cart = dao.getBookByUser(u.getId());
		double totalPrice = 0;
		for (Cart c : cart) {
			totalPrice = c.getTotal_price();
		}
	%>
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