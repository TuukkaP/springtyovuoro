<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="order"/>
        <title>Tilaukset</title>
    </head>
    <body>
        <c:set var="index" value="0" scope="page" />
        <c:set var="adminUrl" value="/admin/order" scope="page" />
        <c:set var="userUrl" value="/order" scope="page" />
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-condensed">
                        <thead> 
                            <tr><td colspan="6">
                                    <h3>${kuukausi[dt.getMonthOfYear()]} ${dt.getYear()}</h3><br>
                                    ${message}

                                    <ul class="pager">
                                        <li class="previous"><a href="${pageContext.request.contextPath}${adminUrl}/show/${dt.minusMonths(1).withDayOfMonth(1).toString("dd.MM.yyyy")}">
                                                &larr;  ${kuukausi[dt.minusMonths(1).getMonthOfYear()]}</a></li>
                                        <li class="next"><a href="${pageContext.request.contextPath}${adminUrl}/show/${dt.plusMonths(1).withDayOfMonth(1).toString("dd.MM.yyyy")}">
                                                ${kuukausi[dt.plusMonths(1).getMonthOfYear()]}  &rarr;</a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr><td colspan="6"><p class="text-muted"><small>
                                    Voit lisätä uuden vuoron ko. päivälle klikkaamalla päivämäärän kohdalta.<br>
                                    Pääset selaamaan paikkatietoja klikkaamalla vuoron paikka saraketta.<br>
                                    Vuoroa voidaan muokata klikkaamalla työntekijän tai vuoron ajan kohdalta.<br>
                                    </small></p>
                                </td></tr>
                            <tr>
                                <th>Viikko</th>
                                <th>Päivä</th>
                                <th>Paikka</th>
                                <th>Työntekijä</th>
                                <th colspan="2">Aika</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderList}" var="days">                  
                                <c:choose>
                                    <c:when test="${days.value != null}">
                                        <c:forEach items="${days.value}" var="order" varStatus="loop">
                                            <tr <c:if test="${days.key.getDayOfWeek() == 1}"> class="maanantai" </c:if><c:if test="${days.key.getDayOfWeek() == 3}"> class="viikonpaiva" </c:if><c:if test="${days.key.getDayOfWeek() == 5}"> class="viikonpaiva" </c:if>>
                                                <c:if test="${loop.index == 0}">
                                                    <td rowspan="${fn:length(days.value)}">
                                                        <c:if test="${days.key.getDayOfWeek() == 1}">
                                                            ${days.key.getWeekOfWeekyear()}
                                                        </c:if>
                                                    </td>
                                                    <td rowspan="${fn:length(days.value)}" 
                                                        onclick="document.location = '${pageContext.request.contextPath}${adminUrl}/create/${days.key.toString("dd.MM.yyyy")}';"
                                                        title="Lisää päivälle uusi vuoro">
                                                        <a href="${pageContext.request.contextPath}${adminUrl}/create/${days.key.toString("dd.MM.yyyy")}">
                                                        ${days.key.toString("dd.MM.yyyy")}
                                                        <br>${viikko[days.key.getDayOfWeek()]}<br>
                                                        </a>
                                                    </td>
                                                </c:if>    
                                                            <td onclick="document.location = '${pageContext.request.contextPath}/place/${order.place.name}';"><a href="${pageContext.request.contextPath}/place/${order.place.name}">${order.place.name}</a></td>
                                                <td onclick="document.location = '${pageContext.request.contextPath}${adminUrl}/${order.id}';">
                                                    <a href="${pageContext.request.contextPath}${adminUrl}/${order.id}">
                                                    <c:choose>
                                                        <c:when test="${order.user.firstname == null && order.user.lastname == null}">
                                                            Ei tekijää
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${order.user.firstname}, ${order.user.lastname}
                                                        </c:otherwise></c:choose></a>
                                                    <c:forEach items="${days.value}" var="test">
                                                        <c:if test="${test.id != order.id && test.user.id == order.user.id && test.user != null}">
                                                            <span class="badge">Hox!</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}${adminUrl}/${order.id}">${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")}</a>
                                                </td>
                                                <td>
                                                    <f:form action="${pageContext.request.contextPath}/admin/order/delete" method="DELETE" onsubmit="return confirm('Haluatko varmasti poistaa vuoron \n ${order.date.toString('dd.MM.yyyy')}, ${order.place.name}, ${order.user.username}, ${order.order_start.toString('HH:mm')}-${order.order_end.toString('HH:mm')}?');">
                                                        <input type="hidden" name="id" value="${order.id}">
                                                        <input type="submit" value="Poista" class="btn btn-danger btn-sm" />
                                                    </f:form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr onclick="document.location = '${pageContext.request.contextPath}${adminUrl}/create/${days.key.toString("dd.MM.yyyy")}';" 
                                            <c:if test="${days.key.getDayOfWeek() == 1}"> class="maanantai" </c:if>
                                            <c:if test="${days.key.getDayOfWeek() == 3}"> class="viikonpaiva" </c:if>
                                            <c:if test="${days.key.getDayOfWeek() == 5}"> class="viikonpaiva" </c:if>
                                                >
                                                <td>
                                                <c:if test="${days.key.getDayOfWeek() == 1}">
                                                    ${days.key.getWeekOfWeekyear()}
                                                </c:if>
                                            </td>
                                            <td><a href="${pageContext.request.contextPath}${adminUrl}/create/${days.key.toString("dd.MM.yyyy")}">${days.key.toString("dd.MM.yyyy")}<br>${viikko[days.key.getDayOfWeek()]}</a></td>
                                            <td colspan="4"><a href="${pageContext.request.contextPath}${adminUrl}/create/${days.key.toString("dd.MM.yyyy")}">Lisää vuoro klikkaamalla tästä!</a></td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
