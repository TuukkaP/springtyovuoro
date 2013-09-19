<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="user"/>
        <title>Luo uusi käyttäjä</title>
    </head>
    <body>
        <table class="table">
            <thead> 
                <tr>
                    <th>Käyttäjänimi</th>
                    <th>Salasana</th>
                    <th>Etunimi</th>
                    <th>Sukunimi</th>
                    <th>Osoite</th>
                    <th>Email</th>
                    <th>Käyttöoikeus</th>
                    <th></th>
                </tr>
            </thead>                
            <f:form action="${pageContext.request.contextPath}/user/create" method="POST" modelAttribute="user">
                <f:errors path="*" cssClass="error" element="div" />
                <tbody>
                    <tr>
                        <td>
                            <f:input path="username" cssClass="input-block-level"></f:input>
                            </td>
                            <td>
                            <f:input path="password" cssClass="input-block-level" showPassword = "true"></f:input>
                            </td>
                            <td>
                            <f:input path="firstname" cssClass="input-block-level"></f:input>
                            </td>
                            <td>
                            <f:input path="lastname" cssClass="input-block-level"></f:input>
                            </td>
                            <td>
                            <f:input path="address" cssClass="input-block-level"></f:input>
                            </td>
                            <td>
                            <f:input path="email" cssClass="input-block-level"></f:input>
                            </td>
                            <td>
                                <select name="assigned_role" value="options">
                                    <c:forEach items="${roleList}" var="role">
                                        <option value="${role.id}">${role.role_name}</options>
                                    </c:forEach>
                                </select>                     
                        </td>
                        <td> <input type="submit" value="Lisää" class="btn btn-primary" /></td>
                    </tr>
                </f:form>
        </table>
    </body>
</html>