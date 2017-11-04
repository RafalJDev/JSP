<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, com.RJ.web.jdbc.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RJ Title</title>
<link type="texT/css" rel="styLesheet" href="css/style.css">
</head>

<%--
	List<Student> theStudents = (List<Student>) request.getAttribute("STUDENT_LIST");
--%>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>FooBar Uniiiii</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">

			<!--  -->
			<input type="button" value="Add Student"
				onclick="window.location.href='add-student-form.jsp'; return false;"
				class="add-student-button" />

			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<c:forEach var="tempStudent" items="${STUDENT_LIST}">

					<c:url var="tempLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>

					<tr>
						<td>${tempStudent.firstName}</td>
						<td>${tempStudent.lastName}</td>
						<td>${tempStudent.email}</td>
						<td>
						<a href="${tempLink}">Update</a>
						|
						<a href="${deleteLink}" 
						onclick="if(!(confirm('Are you sure you want to delete this row ?'))) return false ">
						Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>



	<%--
					for (Student tempStudent : theStudents) {
				--%>
	<!--  	<tr>
					<td><%--=tempStudent.getFirstName()--%></td>
					<td><%--=tempStudent.getLastName()--%></td>
					<td><%--=tempStudent.getEmail()--%></td>
				</tr> -->
	<%--
					}
				--%>
</body>
</html>