<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">You Are Registered Succesfully With Following
		details</h1>
	<br>
	<h1 align="center">${obj.mnumber}</h1>
	<h1 align="center">${obj.fname}</h1>
	<h1 align="center">${obj.lname}</h1>
	<h1 align="center">${obj.email}</h1>
	<h1 align="center">${obj.gender}</h1>
	<h1 align="center">${obj.password}</h1><br>
	<h1 align="center"><a href="welcomeByLoginSql">Click Here To Login</a></h1>
</body>
</html>