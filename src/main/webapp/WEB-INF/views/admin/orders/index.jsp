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
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderList}" var="days">                  
                    <c:choose>
                        <c:when test="${days.value != null}">
                            <c:forEach items="${days.value}" var="order" varStatus="loop">
                                <tr <c:if test="${days.key.getDayOfWeek() == 1}"> class="maanantai" </c:if><c:if test="${days.key.getDayOfWeek() == 3}"> class="viikonpaiva" </c:if><c:if test="${days.key.getDayOfWeek() == 5}"> class="viikonpaiva" </c:if>>
                                    <c:if test="${loop.index == 0}">
                                        <td rowspan="${fn:length(days.value)}" class="success">
                                            <c:if test="${days.key.getDayOfWeek() == 1}">
                                                ${days.key.getWeekOfWeekyear()}
                                            </c:if>
                                        </td>
                                        <td rowspan="${fn:length(days.value)}" 
                                            onclick="document.location = '${pageContext.request.contextPath}/order/create/${days.key.toString("dd.MM.yyyy")}';"
                                            title="Lisää päivälle uusi vuoro">${days.key.toString("dd.MM.yyyy")}
                                            <br>${viikko[days.key.getDayOfWeek()]}<br>
                                        </td>
                                        </c:if>    
                                    <td onclick="document.location = '${pageContext.request.contextPath}/order/edit/${order.id}';">${order.place.name}</td>
                                    <td onclick="document.location = '${pageContext.request.contextPath}/order/edit/${order.id}';">${order.user.username}
                                        <c:forEach items="${days.value}" var="test">
                                            <c:if test="${test.id != order.id && test.user.id == order.user.id && test.user != null}">
                                            <span class="badge">Hox!</span>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td onclick="document.location = '${pageContext.request.contextPath}/order/edit/${order.id}';">
                                        ${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr onclick="document.location = '${pageContext.request.contextPath}/order/create/${days.key.toString("dd.MM.yyyy")}';" 
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
            </body>
            </html>
