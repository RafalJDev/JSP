<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update student</title>

<link type="text/css" rel="stylesheet" href="css/style.css">
<link type="text/css" rel="stylesheet" href="css/add-student-style.css">
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>FooBar Uniiiii</h2>
		</div>
	</div>

	<div id="container">
		<h3>Update student</h3>
	</div>
		<form action="StudentControllerServlet" method="GET">
			<input type="hidden" name="command" value="UPDATE" />
			<input type="hidden" name="studentId" value="${THE_STUDENT.id}" />
			<table>
				<tbody>
					<tr>
						<td>First name:</td>
						<td><input type="text" name="firstName" 
						value="${THE_STUDENT.firstName}"/></td>
					</tr>
					<tr>
						<td>Last name:</td>
						<td><input type="text" name="lastName" 
						value="${THE_STUDENT.lastName}"/></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input type="text" name="email" 
						value="${THE_STUDENT.email}"/></td>
					</tr>
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Update" class="save" /></td>
					</tr>
				</tbody>
			</table>
		</form>

		<div style="clear: both;"></div>

		<p>
			<a href="StudentControllerServlet">Back to controller</a>
		</p>
</body>
</html>