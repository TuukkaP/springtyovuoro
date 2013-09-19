<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="place"/>
        <title>Paikan muokkaus :: ${place.name}</title>
    </head>
    <body>
        <h1>${place.name}</h1>
        <h3>Valid users:</h3>
        <c:forEach items="${validUsers}" var="user" begin="0">
            ${user}<br>
        </c:forEach>
        <br><br>
        <h3>Banned users:</h3>
        <c:forEach items="${banList}" var="user" begin="0">
            ${user}<br>
        </c:forEach>           
        <f:form method="put" action="${pageContext.request.contextPath}/place/edit" modelAttribute="place">
            <f:hidden path="id" />
            <f:errors path="*" cssClass="error" element="div" />
            <f:label path="name">Nimi: </f:label><f:input path="name" cssClass="input-large"></f:input><br />
            <f:label path="address">Osoite: </f:label><f:input path="address" cssClass="input-large"></f:input><br />
            <f:label path="info">Info: </f:label>&nbsp;<f:textarea path="info" cols="25" rows="5"></f:textarea><br />
            <f:checkboxes path="bannedUsers" items="${userList}" multiple="true" itemValue="username" />

            <label>&nbsp;</label><input type="submit" value="Muuta" class="btn btn-primary" />
        </f:form>
    </body>
</html>