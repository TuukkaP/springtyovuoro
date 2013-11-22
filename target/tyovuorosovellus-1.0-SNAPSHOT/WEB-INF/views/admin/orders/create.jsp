<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="place"/>
        <title>Luo uusi tilaus</title>
    </head>
    <body>
        <table class="table">
            <thead> 
                <tr><td colspan="7"><h3>Luo uusi tilaus</h3></td></tr>
                <tr><td colspan="7">
                        <f:errors path="*" cssClass="errorblock" element="div" />
                        <c:choose>
                            <c:when test="${OrdersForToday.isEmpty() == true}">
                                ${order.date.toString("dd.MM.yyyy")} ei ole muita vuoroja
                            </c:when>
                            <c:otherwise>
                                <h3>Vuorot ${order.date.toString("dd.MM.yyyy")}</h3>
                                <ul>
                                    <c:forEach items="${OrdersForToday}" var="order">
                                        <li><c:if test="${order.user != null}">${order.user}</c:if><c:if test="${order.user == null}">Ei tekijää</c:if>, ${order.place.name}, ${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")} </li>
                                        </c:forEach>
                                </ul>
                                Yhteensä ${OrdersForToday.size()} vuoroa.
                            </c:otherwise>
                        </c:choose>
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
                        <f:form method="post" action="${pageContext.request.contextPath}/admin/order/create" modelAttribute="order">
                            <f:errors path="*" cssClass="error" element="div" />
                            <f:input path="date" cssClass="input-block-level"></f:input>
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
                <f:input path="order_start" cssClass="input-block-level"></f:input>
                </td>
                <td>
                <f:input path="order_end" cssClass="input-block-level"></f:input>
                </td>
                <td>        
                    <input type="submit" value="Lisää" class="btn btn-primary" />
                </td>
        </f:form>
</body>
</html>