<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="user"/>
        <title>Käyttäjä</title>
    </head>
    <body>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>Käyttäjät</h1>
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead> 
                            <tr>
                                <th>Käyttäjänimi</th>
                                <th>Etunimi</th>
                                <th>Sukunimi</th>
                                <th>Osoite</th>
                                <th>Email</th>
                                <th>Käyttöoikeus</th>
                                <th>Korjaa</th>
                                <th>Poista</th>
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
                                    <td> 
                                        <form action="${pageContext.request.contextPath}/admin/user/${user.username}">
                                            <input type="submit" value="Muokkaa" class="btn btn-warning">
                                        </form></td>
                                    <td><f:form action="${pageContext.request.contextPath}/admin/user/delete" method="DELETE" onsubmit="return confirm('Haluatko varmasti poistaa käyttäjän: ${user.username} ?');">
                                            <input type="hidden" name="id" value="${user.id}">
                                            <input type="submit" value="Poista" class="btn btn-danger" />
                                        </f:form></td>
                                </tr>
                            </c:forEach>

                    </table>            
                    <br>
                    <form action="${pageContext.request.contextPath}/admin/user/create">
                        <input type="submit" value="Lisää uusi käyttäjä" class="btn btn-primary">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
