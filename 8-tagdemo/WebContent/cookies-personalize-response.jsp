<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	String favLang = request.getParameter("favoriteLanguage");

	Cookie theCookie = new Cookie("myApp.favoriteLanguage", favLang);

	theCookie.setMaxAge(60 * 60 * 24 * 365);

	response.addCookie(theCookie);
%>

<body>
	Thanks we set your favorite language to : ${param.favoriteLanguage}

	<a href="Cookies-homepage.jsp">Return to homepage.</a>
</body>
</html>