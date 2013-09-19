<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="currentPage" content="user"/>
        <title>Käyttäjä</title>
    </head>
    <body>
        <table class="table-striped">
        <thead> 
            <tr>
                <th>Käyttäjänimi</th>
                <th>Etunimi</th>
                <th>Sukunimi</th>
                <th>Osoite</th>
                <th>Email</th>
                <th>Käyttöoikeus</th>
                <th>Korjaa</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.firstname}</td>
                    <td>${user.lastname}</td>
                    <td>${user.address}</td>
                    <td>${user.email}</td>
                    <td><font style="text-transform: capitalize">${fn:toLowerCase(user.role)}</font></td>
                    <td> <a href="<c:url value="/user/${user.username}" />">Muokkaa</a></td>
                </tr>
        </c:forEach>
    </table>
</body>
</html>
