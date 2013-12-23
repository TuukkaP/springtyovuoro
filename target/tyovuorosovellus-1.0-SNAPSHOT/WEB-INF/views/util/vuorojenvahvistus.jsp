<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title" id="panel-title">Vahvistamattomat vuorot</h3>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>P‰iv‰m‰‰r‰</th>
                <th>Paikka</th>
                <th>Aika</th>
                <th>Vahvista</th>
            </tr>
        </thead>
        <tbody id="todaysOrdersTableBody">
        <c:choose>
            <c:when test="${unconfirmedOrders.isEmpty() == true}">
                <tr><td colspan="3">Ei vahvistamattomia vuoroja</td></tr>
            </c:when>
            <c:otherwise> 
                    <c:forEach items="${unconfirmedOrders}" var="order">
                        <tr>
                            <td> ${order.date.toString("dd.MM.yyyy")}</td>
                            <td> ${order.place.name}</td>
                            <td> ${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")} </td>
                            <td><button type="button" class="btn btn-danger confirmation" value="false" name="confirm">Vahvista</button></td>
                        </tr>
                    </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <div class="panel-footer" id="panel-footer"><input type="submit" value="Hyv‰ksy" class="btn btn-primary" /></div>
</div>
