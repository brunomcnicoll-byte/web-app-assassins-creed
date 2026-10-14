<%-- 
    Document   : PageChoixPlateforme
    Created on : 19 mai 2026, 19 h 49 min 23 s
    Author     : Bruno
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <fmt:setLocale value="${sessionScope.locale}"/>
        <fmt:bundle basename="app">
            <title><fmt:message key="PTitlePlateforme"/></title>
        </fmt:bundle>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/MonStyle.css">

    </head>
    <body>
        <header class="site-header d-flex align-items-center px-4">
            <div class="logo d-flex align-items-center gap-2 me-auto">
                <img src="${pageContext.request.contextPath}/images/aclogo.png" id="logo" alt="aclogo" width="60px" height="auto" />
                <div class="logo-text" >
                    <span class="logo-top" style="color:black">Assassin's</span>
                    <span class="logo-bottom" style="color:#C00000">creed</span>
                </div>
            </div>
        </header>

        <!-- ===== NAVBAR ===== -->
        <%@ include file="navbar.jsp" %>

        <!-- ===== choix de platerforme ===== -->
        <form action="${pageContext.request.contextPath}/cart" name="maForme2" method="post">
            <input type="hidden" name="action" value="add" />
            <input type="hidden" name="gameId" value="${gameId}">
            <div class="container text-center" style="background-color: white; border-radius: 20px; margin-top: 60px">
                <header class="row justify-content-center">
                    <div class="col-12 col-md-6"
                         style="color:#C00000; background-color:lightgray; border-radius:15px; margin-top:60px;">
                        <h1>
                            <fmt:bundle basename="app">
                                <fmt:message key="PHeadPlateforme"/>
                            </fmt:bundle>
                        </h1>
                    </div>
                </header>

                <div class="row" style=" margin-top: 50px">
                    <fieldset>
                        <input type="radio" name="plateforme" id="plateformePS" value="playstation" checked="checked" />
                        <label class="review-icon" for="plateformePS"><img src="${pageContext.request.contextPath}/images/PsLogo.png" alt="Pslogo" width="60px" height="auto"></label>

                        <input type="radio" name="plateforme" id="plateformeXBOX" value="xbox">
                        <label class="review-icon" for="plateformeXBOX"><img src="${pageContext.request.contextPath}/images/XboxLogo.png" alt=XboxLogo width="60px" height="auto"></label>

                        <input type="radio" name="plateforme" id="plateformeSTEAM" value="steam">
                        <label class="review-icon" for="plateformeSTEAM"><img src="${pageContext.request.contextPath}/images/SteamLogo.png"alt="SteamLogo" width="60px" height="auto"></label>
                        <br><br>
                            <input type="submit" class="btn-add-cart" value="add" style="margin-bottom: 60px">
                    </fieldset>                                
                </div>
            </div>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
