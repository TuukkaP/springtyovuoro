<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="order"/>
        <script>
            var BASE_URL = "${pageContext.request.contextPath}";
        </script>
        <title>Muokkaa tilausta</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/datepicker.css" rel="stylesheet">
    </head>
    <body>
        <div class="row">
            <%@ include file="../../util/vuoropaneeli.jsp" %> 
            <table class="table table-condensed">
                <thead> 
                    <tr><td><h3>Muokkaa tilausta</h3>
                            <f:errors path="*" cssClass="errorblock" element="div" />
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
                    <f:form action="${pageContext.request.contextPath}/admin/order/${order.getId()}" method="PUT" modelAttribute="order">
                        <f:hidden path="id" />
                        <tr>
                            <td>
                                <f:input path="date" cssClass="input-block-level" data-date-format="dd.mm.yyyy"></f:input>
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
                                <input type="submit" value="Muokkaa" class="btn btn-primary" /></f:form> 
                            </td>
                            <td>
                            <f:form action="${pageContext.request.contextPath}/admin/order/delete" method="DELETE" onsubmit="return confirm('Haluatko varmasti poistaa vuoron \n ${order.date.toString('dd.MM.yyyy')}, ${order.place.name}, ${order.user.username}, ${order.order_start.toString('HH:mm')}-${order.order_end.toString('HH:mm')}?');">
                                <input type="hidden" name="id" value="${order.id}">
                                <input type="submit" value="Poista" class="btn btn-danger" />
                            </f:form>
                        </td>
                    </tr>

            </table>
        </div>
    </body>

</html>