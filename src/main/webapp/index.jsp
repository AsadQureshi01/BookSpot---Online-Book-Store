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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">

</head>
<body style="background-color: #f0f0f0;">

	<%
		User u = (User) session.getAttribute("userObj");
	%>

	<%@ include file="all_component/navbar.jsp"%>
	<!-- <div class="container-fluid back-img">
		<h2 class="text-center text-danger"></h2>
	</div> -->

	<section class="home" id="home" style="z-index: 1000">

		<div class="row1">

			<div class="content">
				<h3>upto 75% off</h3>
				<br>
				<p>As Emerson once said, 'The <b>mind, once
					expanded</b>, never returns to its original dimensions.' Let our
					collection of I.T., computer science, A.I., machine learning, and
					data science books be your guide as you <b>boldly navigate</b> the
					frontiers of knowledge. Welcome to a world where learning knows no
					limits!</p>
			</div>

			<div class="swiper books-slider">
				<div class="swiper-wrapper">
					<%
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						List<BookDtls> list1 = dao.getRecentBooks();
						List<BookDtls> list2 = dao.getRecentBooks();
						for (BookDtls b2 : list2) {
					%>
					<a href="#" class="swiper-slide"><img
						src="book/<%=b2.getPhotoName()%>" alt=""></a>
					<%
						}
					%>
					<!-- <a href="#"
						class="swiper-slide"><img src="image/book-3.png" alt=""></a>
					<a href="#" class="swiper-slide"><img src="image/book-4.png"
						alt=""></a> <a href="#" class="swiper-slide"><img
						src="image/book-5.png" alt=""></a> <a href="#"
						class="swiper-slide"><img src="image/book-6.png" alt=""></a> -->
				</div>
				<img src="image/stand.png" class="stand" alt="">
			</div>

		</div>

	</section>

	<section class="icons-container">

		<div class="icons">
			<i class="fas fa-shipping-fast"></i>
			<div class="content">
				<h3>free shipping</h3>
				<p>order over $100</p>
			</div>
		</div>

		<div class="icons">
			<i class="fas fa-lock"></i>
			<div class="content">
				<h3>secure payment</h3>
				<p>100 secure payment</p>
			</div>
		</div>

		<div class="icons">
			<i class="fas fa-redo-alt"></i>
			<div class="content">
				<h3>easy returns</h3>
				<p>10 days returns</p>
			</div>
		</div>


	</section>

	<!-- icons section ends -->

	<hr>

	<!--Recent book container  -->

	<div class="container">
		<h3 class="text-center">Recent book</h3>
		<div class="row">
			<%
				for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
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
						<p><%=b.getAuthor()%></p>
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
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-sm btn-danger ml-4"><i
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
						<p><%=b.getAuthor()%></p>
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

	<!-- <%@include file="all_component/footer.jsp"%> -->
	<section class="footer">

		<div class="box-container">

			<div class="box">
				<h3>our locations</h3>
				<a href="#"> <i class="fas fa-map-marker-alt"></i> india
				</a>

			</div>

			<div class="box">
				<h3>quick links</h3>
				<a href="index.jsp"> <i class="fas fa-arrow-right"></i> home
				</a> <a href="all_recent_book.jsp"> <i class="fas fa-arrow-right"></i>
					Recent
				</a> <a href="all_new_book.jsp"> <i class="fas fa-arrow-right"></i>
					New
				</a> <a href="all_old_book.jsp"> <i class="fas fa-arrow-right"></i>
					Old
				</a>
			</div>

			<div class="box">
				<h3>extra links</h3>
				<a href="setting.jsp"> <i class="fas fa-arrow-right"></i>
					account info
				</a> <a href="order.jsp"> <i class="fas fa-arrow-right"></i> ordered
					items <!-- </a> <a href="#"> <i class="fas fa-arrow-right"></i> privacy policy
				 </a> <a href="#"> <i class="fas fa-arrow-right"></i> payment method
				</a> <a href="#"> <i class="fas fa-arrow-right"></i> our serivces -->
				</a>
			</div>

			<div id="contact" class="box">
				<h3>contact info</h3>
				<a href="#"> <i class="fas fa-phone"></i> +123-456-7890
				</a> <a href="#"> <i class="fas fa-phone"></i> +111-222-3333
				</a> <a href="https://mail.google.com" target="_blank"> <i
					class="fas fa-envelope"></i> bookspot123@gmail.com
				</a> <img src="image/worldmap.png" class="map" alt="">
			</div>

		</div>

		<!-- <div class="share">
			<a href="#" class="fab fa-facebook-f"></a> <a href="#"
				class="fab fa-twitter"></a> <a href="#" class="fab fa-instagram"></a>
			<a href="#" class="fab fa-linkedin"></a> <a href="#"
				class="fab fa-pinterest"></a>
		</div> -->

		<div class="credit">
			created by <span>Team</span> | all rights reserved!
		</div>

	</section>

	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		var swiper = new Swiper(".books-slider", {
			loop : true,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			breakpoints : {
				0 : {
					slidesPerView : 1,
				},
				768 : {
					slidesPerView : 2,
				},
				1024 : {
					slidesPerView : 3,
				},
			},
		});
	</script>
	<script src="js/script.js"></script>
</body>
</html>