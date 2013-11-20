<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="user"/>
        <title>Muokkaa tilausta</title>
    </head>
    <body>
        <table class="table">
            <thead> 
                <tr><td><h3>Tilaus</h3></td></tr>
                <tr>
                    <th><br><br>Päivämäärä</th>
                    <th>Paikka</th>
                    <th>Tekijä</th>
                    <th>Alkaa</th>
                    <th>Loppuu</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <f:form action="${pageContext.request.contextPath}/order/edit/${order.getId()}" method="PUT" modelAttribute="order">
                    <f:hidden path="id" />
                    <tr>
                        <td>
                            <f:input path="date" cssClass="input-block-level"></f:input>
                            </td>
                            <td>
                            <f:select path="place.id">
                                <f:options items="${placeList}" itemLabel="name" itemValue="id"/>
                            </f:select>
                        </td>
                        <td>
                            <f:select path="user.id">
                                <f:options items="${vacantUsers}" itemValue="id"/>
                                <c:if test="${vacantUsers.isEmpty() == true}"><option>Ei vapaita työntekijöitä</option></c:if>
                </f:select>
            </td>
            <td>
                <f:input path="order_start" cssClass="input-block-level"></f:input>
                </td>
                <td>
                <f:input path="order_end" cssClass="input-block-level"></f:input>
                </td>
                <td>                  
                </td>
                <td>
                    <input type="submit" value="Muokkaa" class="btn btn-primary" />
                </td>
            </tr>
    </f:form>                            
</table>
<ul>
    <c:forEach items="${OrdersForToday}" var="order">
        <li>${order.user}, ${order.place.name}, ${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")} </li>
        </c:forEach>
</ul>
</body>
</html>