<%-- 
    Document   : PageAcceuil
    Created on : May 11, 2026, 7:17:24 PM
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
            <title><fmt:message key="PTitleAcceuil"/></title>
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

        <!-- ===== CONTENU PRINCIPAL ===== -->
        <div class="container acceuil" style="margin-top: 50px; border-radius: 20px;text-align: center">
            <div class="row justify-content-center align-items-center">
                <div class="col">
                    <img src="${pageContext.request.contextPath}/images/aclogo.png" id="logo" alt="aclogo" width="500px" height="auto" />
                </div>
                <div class="col">
                    <span class="acceuil_assassins">Assassin's</span>
                    <span class="acceuil_creed">creed</span>
                    <div class="acceuil_sous_text">
                        <span style="font-size:3rem">
                            <fmt:bundle basename="app">
                                <fmt:message key="SousTitre"/>
                            </fmt:bundle>
                        </span>
                    </div>
                    <div class="acceuil_sous_text">
                        <span style="font-size:2rem">
                            <fmt:bundle basename="app">
                                <fmt:message key="Auteurs"/>
                            </fmt:bundle>
                        </span>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
