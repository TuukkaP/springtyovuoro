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
        <title>${place.name}</title>
    </head>
    <body>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>${place.name}</h1>
                </div>
                <div class="panel-body">
                    <dl class="dl-horizontal">
                        <dt>Yhteyshenkilö</dt>
                        <dd>${place.contact}</dd>
                        <dt>Puhelinnumero</dt>
                        <dd>${place.phone}</dd>
                        <dt>Osoite</dt>
                        <dd>${place.address}</dd>
                        <dt>Info</dt>
                        <dd>${place.info}</dd>
                    </dl>
                </div>
            </div>
        </div>
    </body>

</html>
