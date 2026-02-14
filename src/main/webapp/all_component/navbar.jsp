<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<style>
.dropbtn {
	background-color: #3498DB;
	color: white;
	font-size: 15px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	height: 50px;
	width: 130px;
	text-align: center;
	
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
	background-color: #2980B9;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative; /* Change to relative positioning */
  display: inline-block;
  z-index: 10000000;
  background-color: #3498DB;
	color: white;
	font-size: 15px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	height: 35px;
	width: 110px;
	text-align: center;
	justify-content:center;
  
}

.dropdown-content {
  display: none;
  position: absolute; /* Change to absolute positioning */
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 10000 ;
  top: 100%; /* Position dropdown below the button */
  left: 0; /* Align dropdown with the left edge of the button */
  
}

.dropdown-content a {
  color: black;
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
</head>
<body>
<div style="overflow: hidden; position: sticky; left: 0; top: 0; width: 100%; z-index: 10000;">
<div class="container-fluid p-3 bg-custon"
	style="background-color: #0f2741;">
	<div class="row">
		<div class="col-md-2 text-white" style="margin-left: 60px; margin-right: 76px;">
			<h3>
				<i class="fas fa-book"></i>BookSpot
			</h3>
		</div>
		<div class="col-md-5">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				  <input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
				
				<!--  <div class="searchInput" style="width: 80%;">
					<input name="ctl00$TopSearch1$txtSearch" type="search" name="ch"
						id="ctl00_TopSearch1_txtSearch" autocomplete="off"
						placeholder="Search here..." aria-label="Search"
						style="width: 400px; height: 30px; font-size: 11px; color: #717171; border-radius: 5px; box-shadow: 0 1px 2px 2px #e6e6e6 inset;">
				</div>
				<div
					style="float: left; position: absolute; top: 2px; left: 390px; z-index: 1; cursor: pointer; border: 0px; background: 0 0;">
					<input type="submit" name="ctl00$TopSearch1$Button1" value=""
						onclick="return checkSearchText();" name="ch" id="ctl00_TopSearch1_Button1"
						class="sprite search-btn"
						style="background-position: 0 -80px; border: none; width: 30px; height: 30px; background: url(img/search.png) no-repeat top left;">
				</div> -->
			</form>
		</div>

		<c:if test="${not empty userObj }">
			<div class=""
				style="position: relative; left: 266px;">
				<a href="cart.jsp" style="padding: 5px; margin-right: 15px; width: 90px;"><i
					class="fas fa-cart-plus fa-1x text-white" style="font-size: 1.6em;"></i></a> <a href="logout" class="btn btn-primary "><i
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

			<!--  <li class="nav-item active"><a class="nav-link"
				href="all_free_book.jsp"><i class="fas fa-book-open"></i> Free
					Books</a></li> -->

		</ul>
		<div class="" style="width: 110px; margin-right: 5px;">
			<!--  <button onclick="myFunction()" id="btn" class="dropbtn"> My Account</button>
			<div id="myDropdown" class="dropdown-content" x>
				<a href="sellBook.jsp">Sell old books</a> 
				<a href="editProfile.jsp">Edit profile</a> 
				<a href="userAddress.jsp">Saved Address</a>
				<a href="order.jsp">Orders</a>
				<a href="oldBook.jsp">Your books</a>
			</div>
			-->
			<a href="setting.jsp" id="btn"  class="btn btn-light my-2 my-sm-0 ml-1"> My Account</a>
		</div>
		
	

			<a href="index.jsp#contact" class="btn btn-light my-2 my-sm-0 ml-1"  style="width: 120px; margin-right: 69px;">
				<i class="fas fa-phone-square-alt"></i> Contact Us
			</a>

		
	</div>
</nav>
</div>
<script>
function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown if the user clicks outside of it
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
</body>
</html>