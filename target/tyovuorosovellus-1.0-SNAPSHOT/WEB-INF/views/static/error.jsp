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
        <h2>Tervetuloa ${username} </h2>
        Oh noes, jotain meni vikaan!
        <a href="<c:url value='/' />" > Takaisin pääsivulle</a>
    </body>
</html>
