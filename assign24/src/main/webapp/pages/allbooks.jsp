<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<style>
table#nat {
	width: 50%;
	background-color: #c48ec5;
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Full-width input fields */
input[type=text], input[type=password], input[type=date] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	float: left;
	width: 50%;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #474e5d;
	padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: #f1f1f1;
}

.close:hover, .close:focus {
	color: #f44336;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}
* {
	box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
	float: left;
	width: 50%;
	padding: 10px;
	height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>
	<h1 align="center">Extra table</h1>
	<table id="customers">
		<tr>
			<th>Book Id</th>
			<th>Book Name</th>
			<th>Book Price</th>
			<th>Book Volume</th>
			<th>Publish Date</th>
			<th>Delete</th>
		</tr>
		<c:forEach var="value" items="${obj}">
			<tr>
				<td><c:out value="${value.bookId}" /></td>
				<td><c:out value="${value.bookName}" /></td>
				<td><c:out value="${value.bookPrice}" /></td>
				<td><c:out value="${value.volume}" /></td>
				<td><c:out value="${value.publishDate}" /></td>
				<td><a
					href="<c:url value='/deletebook/${value.bookId}' />">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

		
		<div class="row">

		<div class="column" style="background-color: #aaa;" align="center">
			<h2 align="center">Want To Add Another Book</h2>
			<p>
			
				<P align="center">
					<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto; align: center">Add A Book</button>
				</P>
				
		</div>

		<div class="column" style="background-color: #bbb;">
			<h2 align="center">Want To See All Subjects</h2>
			
			<FORM ACTION="allsubjects">
				<P align="center">
				<button style="width: auto; align: center">See Subjects</button>
				</P>
			</FORM>
			
		</div>

	</div>


	<div id="id01" class="modal">
		<span onclick="document.getElementById('id01').style.display='none'"
			class="close" title="Close Modal">&times;</span>
		<form class="modal-content" action="addbook">
			<div class="container">
				<h1>Add Book</h1>
				<p>Please fill in this form to add a book.</p>
				<hr>
				<label for=bookId><b>Book Id</b></label> 
				<input type="text" placeholder="Book Id" name="bookId" required> 
				
				<label for="bookName"><b>Book Name</b></label> 
				<input type="text" placeholder="Book Name" name="bookName" required> 
				
				<label for="bookPrice"><b>Book Price</b></label> 
				<input type="text" placeholder="Book Price" name="bookPrice" required> 
				
				<label for="volume"><b>Book Volume</b></label> 
				<input type="text" placeholder="Book Volume" name="volume" required> 
				
				<label for="publishDate"><b>Publish Date</b></label> 
				<input type="date" placeholder="Publish Date" name="publishDate" required> 
				
				<div class="clearfix">
					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
					<button type="submit" class="signupbtn">Add Book</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>