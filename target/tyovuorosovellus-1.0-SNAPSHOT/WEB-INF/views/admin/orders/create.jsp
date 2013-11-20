<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            $(document).ready(function() {
                $('#place.id').change(function() {
                    var selectedValue = $(this).val();
                    var servletUrl = 'getPaikanVapaatTekijat/' + selectedValue;

                    $.getJSON(servletUrl, function(options) {
                        var dropdown2 = $('#user.id');
                        $('>option', dropdown2).remove(); // Clean old options first.
                        if (options) {
                            $.each(opts, function(key, value) {
                                dropdown2.append($('<option/>').val(key).text(value));
                            });
                        } else {
                            dropdown2.append($('<option/>').text("Valitse ensin paikka"));
                        }
                    });
                });
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="place"/>
        <title>Luo uusi tilaus</title>
    </head>
    <body>
        <H1>Luo uusi tilaus</h1>

        <f:form method="post" action="${pageContext.request.contextPath}/order/create" modelAttribute="order">
            <f:errors path="*" cssClass="error" element="div" />
            <f:label path="date">Päivämäärä: </f:label><f:input path="date" cssClass="input-block-level"></f:input>
            <f:label path="place.id">Paikka: </f:label>
            <f:select path="place.id">
                <f:options items="${placeList}" itemLabel="name" itemValue="id"/>
            </f:select>
            <f:label path="user.id">Työntekijä: </f:label>
            <f:select path="user.id">
                <f:options items="${vacantUsers}" itemValue="id"/>
                <c:if test="${vacantUsers.isEmpty() == true}"><option>Ei vapaita työntekijöitä</option></c:if>
        </f:select>
        <f:label path="order_start">Alkaa: </f:label><f:input path="order_start" cssClass="input-block-level"></f:input>
        <f:label path="order_end">Loppuu: </f:label><f:input path="order_end" cssClass="input-block-level"></f:input>
            <label>&nbsp;</label><input type="submit" value="Lisää" class="btn btn-primary" />
    </f:form>
</body>
</html>