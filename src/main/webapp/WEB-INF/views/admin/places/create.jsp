<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="place"/>
        <title>Luo uusi paikka</title>
    </head>
    <body>
        <H1>Paikkojen lisääminen</h1>

        <f:form method="post" action="${pageContext.request.contextPath}/place/create" modelAttribute="place">
            <f:errors path="*" cssClass="error" element="div" />
            <f:label path="name">Nimi: </f:label><f:input path="name" cssClass="input-large"></f:input><br />
            <f:label path="address">Osoite: </f:label><f:input path="address" cssClass="input-large"></f:input><br />
            <f:label path="info">Info: </f:label>&nbsp;<f:textarea path="info" cols="25" rows="5"></f:textarea><br />
            <f:select path="bannedUsers" items="${userList}" multiple="true" />
                <label>&nbsp;</label><input type="submit" value="Lisää" class="btn btn-primary" />
        </f:form>
    </body>
</html>