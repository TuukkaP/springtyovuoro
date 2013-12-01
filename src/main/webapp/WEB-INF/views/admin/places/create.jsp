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
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>Luo uusi paikka</h1>
                </div>
                <div class="panel-body">
                    <table class="table table-no-border">
                        <tbody>                
                            <f:form method="post" action="${pageContext.request.contextPath}/admin/place/create" modelAttribute="place">
                                <f:errors path="*" cssClass="error" element="div" />
                                <tr>
                                    <td><f:label path="name" cssClass="control-label">Nimi</f:label></td>
                                    <td><f:input path="name"  placeholder="Nimi" cssClass="form-control"></f:input></td>
                                    <td><f:errors path="name" cssClass="alert alert-danger" element="div"  /></td>
                                </tr>
                                <tr>
                                    <td><f:label path="contact" cssClass="control-label">Yhteyshenkilö</f:label></td>
                                    <td><f:input path="contact"  placeholder="Yhteyshenkilö" cssClass="form-control"></f:input></td>
                                    <td><f:errors path="contact" cssClass="alert alert-danger" element="div"  /></td>
                                </tr>
                                <tr>
                                    <td><f:label path="phone" cssClass="control-label">Puhelinnumero</f:label></td>
                                    <td><f:input path="phone"  placeholder="Puhelinnumero" cssClass="form-control"></f:input></td>
                                    <td><f:errors path="phone" cssClass="alert alert-danger" element="div"  /></td>
                                </tr>
                                <tr>
                                    <td><f:label path="address" cssClass="control-label">Osoite</f:label></td>
                                    <td><f:input path="address" placeholder="Osoite" cssClass="form-control"></f:input></td>
                                    <td><f:errors path="address" cssClass="alert alert-danger" element="div"  /></td>
                                </tr>
                                <tr>
                                    <td><f:label path="info" cssClass="control-label">Info</f:label></td>
                                    <td><f:textarea path="info" cols="25" rows="5" placeholder="Info" cssClass="form-control"></f:textarea></td>
                                    <td><f:errors path="info" cssClass="alert alert-danger" element="div"  /></td>
                                </tr>
                                <tr>
                                    <td><label class="control-label">Ei sallitut tekijät</label></td>
                                    <td colspan="2">
                                            <f:checkboxes path="bannedUsers" items="${userList}" multiple="true" itemValue="username" delimiter="&emsp;"/>  
                                        </td>
                                </tr>
                                <tr>
                                    <td colspan="3"><input type="submit" value="Lisää" class="btn btn-primary" /></td>
                                </tr>
                            </f:form>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>