<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password], input[type=number] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

h1.intro {
	color: blue;
	text-align: center;
}

.important {
	background-color: #00FF00;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.header {
	overflow: hidden;
	background-color: #f1f1f1;
	padding: 20px 10px;
}

.header a {
	float: left;
	color: black;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.header a.logo {
	font-size: 25px;
	font-weight: bold;
}

.header a:hover {
	background-color: #ddd;
	color: black;
}

.header a.active {
	background-color: dodgerblue;
	color: white;
}

.header-right {
	float: right;
}

@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: none;
	}
}
</style>
</head>
<body>
	<div class="header">
		<a href="#default" class="logo">Welcome</a>
		<div class="header-right">
			<a class="active" href="#home">Home</a> <a href="#contact">Contact</a>
			<a href="#about">About</a>
		</div>
	</div>
	<h1 class="intro important">Welcome To MyWebsite ${name} Please
		Register To Proceed</h1>
	<form action="addedsubjects">

		<div class="container">
			<label for="subjectId"><b>Subject Id</b>\
			</label> <input type="text" placeholder="Subject Id" name="subjectId" required>

			<label for="subtitle"><b>Subject Name</b></label> 
			<input type="text" placeholder="Subject Name" name="subtitle" required> 
			
			<label for="durationInHours"><b>Duration In Hours</b></label><br>
		    <input type="number" placeholder="Duration In Hours" name="durationInHours" required><br>
				
			<label for="references"><b>Books To Refer</b></label><br>	 
				<select name="references" id="references">
				<option value="">Select..</option>
				<c:forEach var="value" items="${obj}">
				<option value="${value.bookId}">${value.bookId}</option>
				</c:forEach>
				</select><br>
		
			<button type="submit">Add Book</button>
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn">Cancel</button>
			<span class="psw">Forgot <a href="#">password?</a></span>
		</div>
	</form>
</body>
</html>