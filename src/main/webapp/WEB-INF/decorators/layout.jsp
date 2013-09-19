<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <title>Työvuorosovellus :: <decorator:title /></title>
    </head>
    <body>
        <decorator:usePage id="thePage" />
        <% String pageName = thePage.getProperty("meta.currentPage");%>
        <div class="navbar">
            <div class="navbar-inner">
                <a class="brand" href="${pageContext.request.contextPath}">Työvuorosovellus</a>
                <ul class="nav">
                    <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                    <li <%if (pageName.equals("login")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                    <li <%if (pageName.equals("user")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/user">Käyttäjät</a></li>
                    <li <%if (pageName.equals("place")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/place">Paikat</a></li>
                    <li <%if (pageName.equals("info")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/info">Info</a></li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
            <div id="content" class="container">
                <decorator:body />
            </div>
        <div id="footer">
            <div class="container">
            (C) Työvuorosovellus<br>
            </div>
        </div>            
            <script src="http://code.jquery.com/jquery.js"></script>
            <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    </body>
</html>
