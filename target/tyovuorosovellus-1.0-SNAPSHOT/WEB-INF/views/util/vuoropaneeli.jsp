            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" id="panel-title">Vuorot ${order.date.toString("dd.MM.yyyy")}</h3>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tekij‰</th>
                            <th>Paikka</th>
                            <th>Aika</th>
                        </tr>
                    </thead>
                    <tbody id="todaysOrdersTableBody">
                        <c:choose>
                            <c:when test="${OrdersForToday.isEmpty() == true}">
                                <tr><td colspan="3">P‰iv‰lle ei ole muita vuoroja</td></tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${OrdersForToday}" var="order">
                                    <tr><td><c:if test="${order.user != null}">${order.user}</c:if><c:if test="${order.user == null}">Ei tekij‰‰</c:if></td><td> ${order.place.name}</td><td> ${order.order_start.toString("HH:mm")}-${order.order_end.toString("HH:mm")} </td></tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="panel-footer" id="panel-footer">Yhteens‰ ${OrdersForToday.size()} vuoroa.</div>
            </div>
