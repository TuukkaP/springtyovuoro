<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="order"/>
        <title>Luo uusi tilaus</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/datepicker.css" rel="stylesheet">
        <script>
            $(document).ready(function() {
                $("#date").datepicker();
                $('#place\\.id').change(function() {
                    var placeName = $('#place\\.id option:selected').text();
                    $("#user\\.id").empty();
                    $.getJSON('${pageContext.request.contextPath}/admin/place/' + placeName + '/users.json', function(data) {
                        $('#user\\.id').append('<option value=\"0\">Ei tekijää</option>');
                        $.each(data, function(k, v) {
                            $("#user\\.id").append('<option value=\"' + v.id + '\">' + v.firstname + ' ' + v.lastname + '</option>');
                        });
                    });
                });
                $('#date').datepicker()
                        .on('changeDate', function(ev) {
                            $("#panel-title").empty().append("Vuorot " + $("#date").val());
                            $("#todaysOrdersTableBody").empty();
                            $.getJSON('${pageContext.request.contextPath}/admin/order/' + $("#date").val() + '/orders.json', function(data) {
                                $.each(data, function(k, v) {
                                    $("#todaysOrdersTableBody").append("<tr><td>" + v.user + "</td><td>" + v.place + "</td><td>" + v.time + "</td></tr>");
                                });
                                $("#panel-footer").empty().append("Yhteensä " + data.length + " vuoroa.");
                            });
                        });
            });
        </script>
    </head>
    <body>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" id="panel-title">Vuorot ${order.date.toString("dd.MM.yyyy")}</h3>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tekijä</th>
                            <th>Paikka</th>
                            <th>Aika</th>
                        </tr>
                    </thead>
                    <tbody id="todaysOrdersTableBody">
                        <c:choose>
                            <c:when test="${OrdersForToday.isEmpty() == true}">
                                <tr><td colspan="3">Päivälle ei ole muita vuoroja</td></tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${OrdersForToday}" var="order">
                                    <tr><td><c:if test="${order.user != null}">${order.user}</c:if><c:if test="${order.user == null}">Ei tekijää</c:if></td><td> ${order.place.name}</td><td> ${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")} </td></tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="panel-footer" id="panel-footer">Yhteensä ${OrdersForToday.size()} vuoroa.</div>
            </div>
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
                            <f:form method="post" action="${pageContext.request.contextPath}/admin/order/create" modelAttribute="order">
                                <f:errors path="*" cssClass="error" element="div" />
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
                                <f:input path="order_start" cssClass="input-block-level"></f:input>
                                </td>
                                <td>
                                <f:input path="order_end" cssClass="input-block-level"></f:input>
                                </td>
                                <td>        
                                    <input type="submit" value="Lisää" class="btn btn-primary" />
                                </td>
                        </f:form>
                    </tr>
                </tbody>
            </table>
        </div>
        <!--<script src="${pageContext.request.contextPath}/resources/js/fetch_users.js"></script>-->
    <content tag=”script”>

    </content>
</body>
</html>