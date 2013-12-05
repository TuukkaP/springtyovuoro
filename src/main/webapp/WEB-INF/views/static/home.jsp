<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="currentPage" content="home"/>
        <title>Kotisivu</title>
    </head>
    <body>
        <h1>Tervetuloa ${username} </h1>
        <div class="col-md-6">
            <h3>Linkkejä</h3>
            <ul>
                <li><a href="https://github.com/TuukkaP/springtyovuoro">https://github.com/TuukkaP/springtyovuoro</a></li>
                <li><a href="http://skutti.dlinkddns.com:8080/tyovuorosovellus/">skutti.dlinkddns.com:8080/tyovuorosovellus</a></li>
                <li>Devaus</li>
                <ul>
                    <li><a href="http://www.petrikainulainen.net/spring-mvc-test-tutorial/">Spring MVC Test Tutorial</a></li>
                    <li><a href="http://getbootstrap.com/">Bootstrap</a></li>
                    <li><a href="http://www.luckyryan.com/2013/08/25/testing-spring-mvc-controllers/">Integration Testing Spring MVC Controllers</a></li>
                </ul>
            </ul>
            <blockquote>
                <p>Tuntien laskeminen, DateTime erotus lopetus - aloitus, solun aika kenttään data-w(weeknumber)hr(weekday)=8h, jquerylla laske viikon tunnit
                   laske kaikki yhteen kk. tunnit.
                </p>
            </blockquote>

        </div><div class="col-md-6">
            <h3>Feature backlog</h3>
            <ol>            
                <li><strong>Testit (ainakin aluksi yhdelle controllerille)</strong></li>
                <li>tee orderAdmin-rooli, joka voi muokata ja luoda vuoroja muttei paikkoja tai käyttäjiä</li>
                <li>Apteekin näkymä täytyy työstää</li>
                <li>Apteekki voi luoda vuoron ilman tekijää</li>
                <li>Tekijä voi kuitata omat työvuoronsa</li>
                <li>Järjestelmä muistuttaa tekijää vuorojen kuittaamisesta maililla</li>
                <ul>
                    <li>Tekijä vahvistaa jokaisen vuoron</li>
                    <li>Mihin mennessä pitää kuitata?</li>
                    <li>Kuinka pitkälle ajalle vuorot kuitataan?</li>
                    <li>Muistutus palvelun asetuksien asettaminen</li>
                    <li>Jos kuitatut vuorot muuttuvat järjestelmä huomauttaa muutoksesta</li>
                </ul>
                <li>Statistiikkaa</li>
                <li>Remember me -sisäänkirjaus?</li>
                <li>Mobiiliulkoasu</li>            
                <li>Virheiden käsittely esim. SimpleMappingExceptionResolver</li>
                <ul>
                    <li>Esim. virheellisen tilauksen haussa tulee nullpointer exception</li>
                </ul>
                <li>HTTPS!! </li>
                <li>Tekijä voi lisätä työvuorotoiveet, jotka näkyisi vuoroja luotaessa ja editoitaessa</li>
                <li>Automaattinen buildaus ja testaus (heroku tai jenkins)</li>
                <li>Tekijä voi valita omat työvuorot??</li>
            </ol>
        </div>
        ${role}<br>
        <sec:authorize access="hasRole('ROLE_MODERATOR')">
            Moderator<br>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            Admin<br>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            User<br>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_PHARMACY')">
            Pharmacy<br>
        </sec:authorize>
    </body>
</html>
