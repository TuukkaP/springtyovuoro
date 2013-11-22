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
    <body><div class="row" id="login-form">
            <form class="form-signin" method="post" action="<c:url value='/do_login' />">
                <h2 class="form-signin-heading">Kirjaudu sisään</h2>
                ${message}
                    <c:if test="${not empty error}">
                        <p class="text-danger">${error}</p>
                    </c:if>
                
                <input type="text" class="form-control input-lg" placeholder="Käyttäjätunnus" name="j_username" required autofocus>
                <input type="password" class="form-control input-lg" placeholder="Salasana" name="j_password" required >
                <!--                <label class="checkbox">
                                    <input type="checkbox" value="remember-me" name="_spring_security_remember_me"> Muista sisäänkirjautuminen
                                </label>-->
                <button class="btn btn-lg btn-primary btn-block" type="submit">Kirjaudu sisään</button>
            </form>
        </div>
    </body>
</html>
