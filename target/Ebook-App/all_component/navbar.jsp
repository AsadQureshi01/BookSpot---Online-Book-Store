<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style>
.dropbtn {
	background-color: #3498DB;
	color: white;
	font-size: 15px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	height: 40px;
	width: 110px;
	text-align: center;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
	background-color: #2980B9;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
	align-item: center;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 230px;
	box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.1);
	z-index: 1;
	margin-top: 10px;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: #383535;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	font-weight: bold;
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
	display: block;
}
</style>
<div class="container-fluid"
	style="height: 0px; background-color: #0000a0">
</div>

<div class="container-fluid p-3 bg-custon"
	style="background-color: #0f2741;">
	<div class="row">
		<div class="col-md-2 text-white" style="margin-left: 60px; margin-right: 76px;">
			<h3>
				<i class="fas fa-book"></i>BookSpot
			</h3>
		</div>
		<div class="col-md-5">
			<form class="form-inline my-2 my-lg-0">
				<!--  <input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
				-->
				<div class="searchInput" style="width: 80%;">
					<input name="ctl00$TopSearch1$txtSearch" type="search"
						id="ctl00_TopSearch1_txtSearch" autocomplete="off"
						placeholder="Search here..." aria-label="Search"
						style="width: 400px; height: 30px; font-size: 11px; color: #717171; border-radius: 5px; box-shadow: 0 1px 2px 2px #e6e6e6 inset;">
				</div>
				<div
					style="float: left; position: absolute; top: 2px; left: 390px; z-index: 1; cursor: pointer; border: 0px; background: 0 0;">
					<input type="submit" name="ctl00$TopSearch1$Button1" value=""
						onclick="return checkSearchText();" id="ctl00_TopSearch1_Button1"
						class="sprite search-btn"
						style="background-position: 0 -80px; border: none; width: 30px; height: 30px; background: url(img/search.png) no-repeat top left;">
				</div>
			</form>
		</div>

		<c:if test="${not empty userObj }">
			<div class=""
				style="position: relative; left: 117px; margin-right: 69px;">
				<a href="cart.jsp" style="padding: 5px; margin-right: 5px; width: 90px;"><i
					class="fas fa-cart-plus fa-1x text-white"></i></a> <a href=""
					class="btn btn-success" style="margin-right: 5px"><i class="fas fa-user-plus"></i>
					${userObj.name}</a> <a href="logout" class="btn btn-primary "><i
					class="fas fa-sign-in-alt"></i> Logout</a>
			</div>
		</c:if>


		<c:if test="${ empty userObj }">
			<div class=""
				style="position: relative; left: 176px; margin-right: 69px;">
				<a href="login.jsp" class="btn btn-success" style="margin-right: 5px; width: 110px;"><i
					class="fas fa-sign-in-alt" ></i> Login</a> <a href="register.jsp"
					class="btn btn-primary" style="width: 110px;"><i class="fas fa-user-plus"></i>
					Register</a>
			</div>

		</c:if>
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom p-2"
	style="background-color: #0f2741;">
	
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent"  style="margin-left: 60px;">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a id="homeicon" class="nav-link" href="index.jsp"><i class="fas fa-home text-white" style="height: 15px;"></i> Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp"><i class="fas fa-book-open"></i>
					Recent Books</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fas fa-book-open"></i> New
					Books</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_book.jsp"><i class="fas fa-book-open"></i> Old
					Books</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_free_book.jsp"><i class="fas fa-book-open"></i> Free
					Books</a></li>

		</ul>
		<div class="dropdown"style="width: 110px;">
			<button onclick="myFunction()" class="dropbtn"> My Acccounts</button>
			<div id="myDropdown" class="dropdown-content">
				<a href="sellBook.jsp">Sell old books</a> 
				<a href="editProfile.jsp">Edit profile</a> 
				<a href="userAddress.jsp">Saved Address</a>
				<a href="order.jsp">Orders</a>
			</div>
		</div>
		
		<form class="form-inline my-2 my-lg-0">

			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit" style="width: 120px; margin-right: 69px;">
				<i class="fas fa-phone-square-alt"></i> Contact Us
			</button>
>
		</form>
		
	</div>
</nav>
<script>
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
</script>