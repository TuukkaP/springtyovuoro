<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="place"/>
        <title>Tilaukset</title>
    </head>
    <body>
        <c:set var="index" value="0" scope="page" />
        <c:set var="max" value="" scope="page" />
        ${pvm}
        ${dt}<br>

        <h3>${kuukausi[dt.getMonthOfYear()]}</h3>
        <table class="table table-condensed">
            <thead> 
                <tr>
                    <th>Viikko</th>
                    <th>Päivä</th>
                    <th>Paikka</th>
                    <th>Työntekijä</th>
                    <th>Aika</th>
                    <!--                    <th>Muokkaa</th>
                                        <th>Poista</th>-->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderList}" var="days">                  
                    <c:choose>
                        <c:when test="${days.value != null}">
                            <c:forEach items="${days.value}" var="order" varStatus="loop">
                                <tr onclick="document.location = '${pageContext.request.contextPath}/order/edit/${order.id}';" 
                                    <c:if test="${days.key.getDayOfWeek() == 1}"> class="maanantai" </c:if>
                                    <c:if test="${days.key.getDayOfWeek() == 3}"> class="viikonpaiva" </c:if>
                                    <c:if test="${days.key.getDayOfWeek() == 5}"> class="viikonpaiva" </c:if>
                                        >
                                    <c:if test="${loop.index == 0}">
                                        <td rowspan="${fn:length(days.value)}" class="success">
                                            <c:if test="${days.key.getDayOfWeek() == 1}">
                                                ${days.key.getWeekOfWeekyear()}
                                            </c:if>
                                        </td>
                                        <td rowspan="${fn:length(days.value)}">${days.key.toString("dd.MM.yyyy")}
                                            <br>${viikko[days.key.getDayOfWeek()]}</td>
                                        </c:if>    
                                    <td>${order.place.name}</td>
                                    <td>${order.user.username}
                                        <c:forEach items="${days.value}" var="test">
                                            <c:if test="${test.id != order.id && test.user.id == order.user.id && test.user != null}">
                                            <span class="badge">Hox!</span>
                                            </c:if>
                                        </c:forEach>
                                        
                                    </td>
                                    <td>${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")}</td>
                                    <!--                                    <td> 
                                                                            <form action="${pageContext.request.contextPath}/order/${order.id}">
                                                                                <input type="submit" value="Muokkaa" class="btn btn-warning">
                                                                            </form>
                                                                        </td>
                                                                        <td>
                                    <f:form action="${pageContext.request.contextPath}/place/delete" method="DELETE" onsubmit="return confirm('Haluatko varmasti poistaa käyttäjän: ${place.name} ?');">
                                        <input type="hidden" name="id" value="${order.id}">
                                        <input type="submit" value="Poista" class="btn btn-danger" />
                                    </f:form>
                                </td>-->
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr 
                                <c:if test="${days.key.getDayOfWeek() == 1}"> class="maanantai" </c:if>
                                <c:if test="${days.key.getDayOfWeek() == 3}"> class="viikonpaiva" </c:if>
                                <c:if test="${days.key.getDayOfWeek() == 5}"> class="viikonpaiva" </c:if>
                                    >
                                    <td>
                                    <c:if test="${days.key.getDayOfWeek() == 1}">
                                        ${days.key.getWeekOfWeekyear()}
                                    </c:if>
                                </td>
                                <td>${days.key.toString("dd.MM.yyyy")}<br>${viikko[days.key.getDayOfWeek()]}</td>
                                <td>EI OOOOO</td>
                                <td></td>
                                <td></td>
                                <!--                                <td></td>
                                                                <td></td>-->
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            <br>
<!--            <form action="${pageContext.request.contextPath}/place/create">
                <input type="submit" value="Lisää uusi paikka" class="btn btn-large">
            </form>-->
            </body>
            </html>
