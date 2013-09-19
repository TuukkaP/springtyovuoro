<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="login"/>
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <form class="form-signin" method="post" action="<c:url value='perform_login' />">
                <h2 class="form-signin-heading">Kirjaudu sisään</h2>
                <p> ${message}
                    <c:if test="${not empty error}">
                        <b class="error">${error}</b>
                    </c:if>
                </p>
                <input type="text" class="input-block-level" placeholder="Käyttäjätunnus" name="j_username">
                <input type="password" class="input-block-level" placeholder="Salasana" name="j_password" >
                <!--                <label class="checkbox">
                                    <input type="checkbox" value="remember-me" name="_spring_security_remember_me"> Muista sisäänkirjautuminen
                                </label>-->
                <button class="btn btn-large btn-primary" type="submit">Kirjaudu sisään</button>
            </form>
        </div>
    </body>
</html>
