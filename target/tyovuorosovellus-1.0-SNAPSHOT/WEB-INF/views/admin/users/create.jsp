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
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>Käyttäjätiedot</h1>
                </div>
                <div class="panel-body">
                    <table class="table table-no-border">
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
                        <f:form action="${pageContext.request.contextPath}/admin/user/create" method="POST" modelAttribute="user" class="form-horizontal" role="form">
                            <%--<f:errors path="*" cssClass="alert alert-danger" element="div" />--%>
                            <tbody>
                                <tr>
                                    <td>
                                        <f:label path="username" class="sr-only" for="username">Käyttäjätunnus</f:label>
                                        <f:input path="username" cssClass="form-control" placeholder="Käyttäjätunnus"></f:input>
                                        <f:errors path="username" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="password" class="sr-only" for="password">Salasana</f:label>
                                        <f:input path="password" cssClass="form-control" showPassword = "true" placeholder="Salasana"></f:input>
                                        <f:errors path="password" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="firstname" class="sr-only" for="firstname">Etunimi</f:label>
                                        <f:input path="firstname" cssClass="form-control" placeholder="Etunimi"></f:input>
                                        <f:errors path="firstname" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="lastname" class="sr-only" for="lastname">Sukunimi</f:label>
                                        <f:input path="lastname" cssClass="form-control" placeholder="Sukunimi"></f:input>
                                        <f:errors path="lastname" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="address" class="sr-only" for="address">Osoite</f:label>
                                        <f:input path="address" cssClass="form-control" placeholder="Osoite"></f:input>
                                        <f:errors path="address" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <f:label path="email" class="sr-only" for="email">Email</f:label>
                                        <f:input path="email" cssClass="form-control" placeholder="Email"></f:input>
                                        <f:errors path="email" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td>
                                        <select name="assigned_role" value="options" class="form-control">
                                            <c:forEach items="${roleList}" var="role">
                                                <option value="${role.id}">${role}</option>
                                            </c:forEach>
                                        </select>
                                        <f:errors path="role" cssClass="alert alert-danger" element="div"  />
                                    </td>
                                    <td> <input type="submit" value="Lisää" class="btn btn-primary" /></td>
                                </tr>
                            </f:form>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>