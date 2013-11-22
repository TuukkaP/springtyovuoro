<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <table class="table">
            <thead> 
                <tr><td><h3>Käyttäjätiedot</h3>
                    </td></tr>
                <tr>
                <c:if test="${message != null}">
                <tr>
                    <td colspan="6"><p class="text-success">${message}</p></td>
                </tr>
                </c:if>
                    <th><br><br>Käyttäjänimi</th>
                    <th>Etunimi</th>
                    <th>Sukunimi</th>
                    <th>Osoite</th>
                    <th>Email</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <f:form action="${pageContext.request.contextPath}/user/${user.username}" method="PUT" modelAttribute="user">
                    <f:hidden path="id" />
                    <f:hidden path="password" />
                    <f:hidden path="role.id" />
                    <tr>
                        <td>
                            <f:input path="username" cssClass="input-block-level" readonly="true"></f:input>
                            <!--<input type="text" value="${user.username}" name="username" class="input-block-level">-->
                        </td>
                        <td>
                            <f:input path="firstname" cssClass="input-block-level"></f:input>
                            <!--<input type="text" value="${user.firstname}" name="firstname" class="">-->
                        </td>
                        <td>
                            <f:input path="lastname" cssClass="input-block-level"></f:input>
                            <!--<input type="text" value="${user.lastname}" name="lastname" class="input-block-level">-->
                        </td>
                        <td>
                            <f:input path="address" cssClass="input-block-level"></f:input>
                            <!--<input type="text" value="${user.address}" name="address" class="input-block-level">-->
                        </td>
                        <td>
                            <f:input path="email" cssClass="input-block-level"></f:input>
                            <!--<input type="text" value="${user.email}" name="email" class="input-block-level">-->
                        </td>
                        <td>
                            <input type="submit" value="Päivitä" class="btn btn-primary" />
                        </td>
                    </tr>
                </f:form>                            
        </table>
    </body>
</html>
