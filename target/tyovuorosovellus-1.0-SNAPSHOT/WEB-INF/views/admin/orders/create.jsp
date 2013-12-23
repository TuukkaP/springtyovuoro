<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            var BASE_URL = "${pageContext.request.contextPath}";
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="order"/>
        <title>Luo uusi tilaus</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/datepicker.css" rel="stylesheet">
    </head>
    <body>
        <div class="row">
            <%@ include file="../../util/vuoropaneeli.jsp" %> 
            <table class="table table-condensed">
                <thead>
                    <tr><td colspan="7">
                            <h3>Luo uusi tilaus</h3>
                            <f:errors path="*" cssClass="panel panel-warning" element="div" />
                        </td></tr>
                    <tr>
                        <th>Päivämäärä</th>
                        <th>Paikka</th>
                        <th>Tekijä</th>
                        <th>Alkaa</th>
                        <th>Loppuu</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <f:form method="post" action="${pageContext.request.contextPath}/admin/order/create/${order.date.toString('dd.MM.yyyy')}" modelAttribute="order">
                                <f:input path="date" cssClass="input-block-level" data-date-format="dd.mm.yyyy"></f:input>
                                <f:errors path="date" cssClass="alert alert-danger" element="div" />
                            </td>
                            <td>
                                <f:select path="place.id">
                                    <f:options items="${placeList}" itemLabel="name" itemValue="id"/>
                                </f:select>
                            </td>
                            <td>
                                <f:select path="user.id">
                                    <f:option value="0">Ei työntekijää</f:option>
                                    <f:options items="${vacantUsers}" itemValue="id"/>
                                </f:select>
                            </td>
                            <td>
                                <f:input path="order_start" cssClass="input-block-level" placeholder="Esim. 09:45"></f:input>
                                <f:errors path="order_start" cssClass="alert alert-danger" element="div" />
                            </td>
                            <td>
                                <f:input path="order_end" cssClass="input-block-level" placeholder="Esim. 17:15"></f:input>
                                <f:errors path="order_end" cssClass="alert alert-danger" element="div" />
                            </td>
                            <td>        
                                <input type="submit" value="Lisää" class="btn btn-primary" />
                            </td>
                        </f:form>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>