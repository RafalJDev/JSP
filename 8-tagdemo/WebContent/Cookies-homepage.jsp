<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Homepage</title>
</head>
<body>

	<%
		//default language, before choosing option on html
		String favLang = "Java";

		Cookie[] theCookies = request.getCookies();
		if (theCookies != null) {
			for (Cookie cookie : theCookies) {
				if (cookie.getName().equals("myApp.favoriteLanguage")) {
					favLang = cookie.getValue();
					break;
				}
			}
		}
	%>
	<!--  List -->
	<h4>
		New Books for
		<%=favLang%></h4>
	<ul>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
	</ul>

	<h4>
		Latest News Reports for
		<%=favLang%></h4>
	<ul>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
	</ul>

	<h4>
		Hot Jobs for
		<%=favLang%></h4>
	<ul>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
	</ul>

	<hr />
	<a href="cookies-personalize-form.html">Choose your language</a>

</body>
</html>