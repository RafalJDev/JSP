<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="theLocale" value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}" scope="session"></c:set>

<<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="com.RJ.jsp.tagdemo.i18n.resources.mylabel"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<a href="i18n-messages-test.jsp?theLocale=en_US">English (US)</a>
<a href="i18n-messages-test.jsp?theLocale=es_ES">Spanish (ES)</a>
<a href="i18n-messages-test.jsp?theLocale=de_DE">German (DE)</a>

<hr>
<fmt:message key="label.greeting"/> <br/><br/>

<fmt:message key="label.firstname"/> <i>John</i> <br/><br/>

<fmt:message key="label.lastname"/> <i>Doe</i> <br/><br/>

<fmt:message key="label.welcome"/> <br/>

<hr>

Selected locale language: ${theLocale}

</body>
</html>