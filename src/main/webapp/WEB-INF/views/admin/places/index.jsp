<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="place"/>
        <title>Paikat</title>
    </head>
    <body>
        <table class="table-striped">
            <thead> 
                <tr>
                    <th>Nimi</th>
                    <th>Osoite</th>
                    <th>Info</th>
                    <th>Korjaa</th>
                    <th>Poista</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${placeList}" var="place">
                    <tr>
                        <td>${place.name}</td>
                        <td>${place.address}</td>
                        <td>${place.info}</td>
                        <td> 
                            <form action="${pageContext.request.contextPath}/place/${place.name}">
                                <input type="submit" value="Muokkaa" class="btn btn-warning">
                            </form></td>
                        <td><f:form action="${pageContext.request.contextPath}/place/delete" method="DELETE" onsubmit="return confirm('Haluatko varmasti poistaa käyttäjän: ${place.name} ?');">
                                <input type="hidden" name="id" value="${place.id}">
                                <input type="submit" value="Poista" class="btn btn-danger" />
                            </f:form></td>
                    </tr>
                </c:forEach>

        </table>            
        <br>
        <form action="${pageContext.request.contextPath}/place/create">
            <input type="submit" value="Lisää uusi paikka" class="btn btn-large">
        </form>
    </body>
</html>
