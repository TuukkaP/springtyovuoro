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
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>Käyttäjätiedot</h1>
                </div>
                <div class="panel-body">
                    <table class="table table-no-border">
                        <thead> 
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
                                        <f:label path="username" class="sr-only" for="username">Käyttäjätunnus</f:label>
                                        <f:input path="username" cssClass="form-control" readonly="true"></f:input>
                                        <f:errors path="username" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="firstname" class="sr-only" for="firstname">Etunimi</f:label>
                                        <f:input path="firstname" cssClass="form-control"></f:input>
                                        <f:errors path="firstname" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="lastname" class="sr-only" for="lastname">Sukunimi</f:label>
                                        <f:input path="lastname" cssClass="form-control"></f:input>
                                        <f:errors path="lastname" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="address" class="sr-only" for="address">Osoite</f:label>
                                        <f:input path="address" cssClass="form-control"></f:input>
                                        <f:errors path="address" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="email" class="sr-only" for="email">Email</f:label>
                                        <f:input path="email" cssClass="form-control"></f:input>
                                        <f:errors path="email" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <input type="submit" value="Päivitä" class="btn btn-primary" />
                                    </td>
                                </tr>
                            </f:form>                            
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
