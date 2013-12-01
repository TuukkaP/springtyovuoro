<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/sticky-footer-navbar.css" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jQuery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
        <title>Työvuorosovellus :: <decorator:title /></title>
        <decorator:head />
    </head>
    <body>
        <div id="wrap">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <c:set var="admin" value="true" scope="page" />
            </sec:authorize>
            <decorator:usePage id="thePage" />
            <% String pageName = thePage.getProperty("meta.currentPage");%>

            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}">Työvuorosovellus</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <sec:authorize access="isAnonymous()">
                                <li <%if (pageName.equals("login")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/login">Login</a></li>
                                </sec:authorize>
                                <c:choose>
                                    <c:when test="${admin == null}">
                                        <sec:authorize access="hasRole('ROLE_USER')" >
                                        <li <%if (pageName.equals("user")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/user/<sec:authentication property="principal.username"/>">Käyttäjätiedot</a></li>
                                        <li <%if (pageName.equals("order")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/order">Tilaukset</a></li>
                                        </sec:authorize>
                                    </c:when>
                                    <c:otherwise>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <li <%if (pageName.equals("user")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/admin/user">Käyttäjät</a></li>
                                    <li <%if (pageName.equals("place")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/admin/place">Paikat</a></li>
                                    <li <%if (pageName.equals("info")) {%>class="active"<% } %>><a href="${pageContext.request.contextPath}/info">Info</a></li>
                                    <li <%if (pageName.equals("order")) {%>class="active"<% }%>><a href="${pageContext.request.contextPath}/admin/order">Tilaukset</a></li>                    
                                        </sec:authorize></c:otherwise>
                                </c:choose>
                    </ul>
                    <ul class="nav navbar-nav navbar-right"><li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Kirjaudu ulos</a></li></ul>  
                    </div>
                </div>
            </div>
            <div class="container">
                <decorator:body />
            </div>
        </div>
        <div id="footer">
            <div class="container">
                <p class="text-muted credit">Työvuorosovellus created with Bootstrap, Tuukka Peuraniemi
                </p>
            </div>
        </div>

    </body>
</html>
