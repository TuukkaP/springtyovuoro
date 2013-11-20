<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="home"/>
        <title>Kotisivu</title>
    </head>
    <body>
        <h1>Tervetuloa ${username} </h1>
        ${role}<br>
        <sec:authorize access="hasRole('ROLE_MODERATOR')">
        Moderator<br>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        Admin<br>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
        User<br>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_PHARMACY')">
        Pharmacy<br>
        </sec:authorize>
        <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
    </body>
</html>