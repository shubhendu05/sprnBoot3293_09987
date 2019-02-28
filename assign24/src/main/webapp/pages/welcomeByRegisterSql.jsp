<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Display</title>
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
</style>
</head>
<body>
	${obj1}

	<h1>${obj.mnumber}</h1>
	<h1>${obj.fname}</h1>
	<h1>${obj.lname}</h1>
	<h1>${obj.email}</h1>
	<h1>${obj.gender}</h1>
	<h1>${obj.password}</h1>

	<table id="nat">
		<tr>
			<td>Full Name</td>
			<td>${obj.mnumber}</td>
		</tr>
		<tr>
			<td>User Name</td>
			<td>${obj.fname}</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>${obj.lname}</td>
		</tr>
		<tr>
			<td>Age</td>
			<td>${obj.email}</td>
		</tr>
		<tr>
			<td>Qualification</td>
			<td>${obj.gender}</td>
		</tr>
		<tr>
			<td>Percentage</td>
			<td>${obj.password}</td>
		</tr>
	</table>
	<h3>Values with datas</h3>
	<c:forEach var="value" items="${obj1}">
		<p>${value.fname}</p>
	</c:forEach>
	<div>
		<table>
			<tr>
				<th>value id</th>
				<th>sensor_a id</th>
				<th>temp</th>
			</tr>
			<c:forEach var="value" items="${obj1}">
				<tr>
					<td><c:out value="${value.gender}" /></td>
					<td><c:out value="${value.fname}" /></td>
					<td><c:out value="${value.lname}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<table id="customers">
		<tr>
			<th>Mobile Number</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email Id</th>
			<th>Gender</th>
			<th>Password</th>
			<th>Delete</th>
			
		</tr>
		<c:forEach var="value" items="${obj1}">
			<tr>
				<td><c:out value="${value.mnumber}" /></td>
				<td><c:out value="${value.fname}" /></td>
				<td><c:out value="${value.lname}" /></td>
				<td><c:out value="${value.email}" /></td>
				<td><c:out value="${value.gender}" /></td>
				<td><c:out value="${value.password}" /></td>
				<td><a href="<c:url value='/deleteRegisterSql/${value.mnumber}' />" >Delete</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>