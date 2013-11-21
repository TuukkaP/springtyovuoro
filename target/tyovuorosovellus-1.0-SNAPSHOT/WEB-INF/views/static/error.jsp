<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <title>Työvuorosovellus :: 404</title>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-inner">
                <a class="brand" href="${pageContext.request.contextPath}">Työvuorosovellus</a>
                <ul class="nav">
                    <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                    <li><a href="${pageContext.request.contextPath}/user">Käyttäjät</a></li>
                    <li><a href="${pageContext.request.contextPath}/place">Paikat</a></li>
                    <li><a href="${pageContext.request.contextPath}/info">Info</a></li>
                    <li><a href="${pageContext.request.contextPath}/order">Tilaukset</a></li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
            <div id="content" class="container">
                <h1>404</h1>
            </div>
<!--        <div id="footer">
            <div class="container">
            (C) Työvuorosovellus<br>
            </div>-->
        </div>            
            <script src="${pageContext.request.contextPath}/resources/js/jQuery.js"></script>
            <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    </body>
</html>
