<%--

    Document   : gamePage

    Created on : 3 juin 2026, 12 h 07 min 45 s

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/MonStyle.css">
    <title>
        ${videogame.title}
    </title>
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

    <br>
    <div class="container">
        <div class="row">
            <div class="col-4">
                <img src="${pageContext.request.contextPath}${videogame.imageUrl}" alt="${videogame.title}">
            </div>

            <form class="col-8 rounded bg-light" action="${pageContext.request.contextPath}/cart" method="get">
                <h1 style="color:black">${videogame.title}</h1>

                <p style="color:black">
                    <fmt:bundle basename="app">
                        <fmt:message key="Prix"/>
                    </fmt:bundle>
                    <span>${videogame.unitPrice}</span></p>

                <div>
                    <span class="review-icon"><img src="${pageContext.request.contextPath}/images/reviews5.png" width="auto" height="60px"></span>

                    <input type="hidden" name="action" value="select">
                    <input type="hidden" name="gameId" value="${videogame.gameId}">

                    <button class="btn-add-cart btn btn-block btn-lg">
                        <fmt:bundle basename="app">
                            <fmt:message key="BoutonAjouter"/>
                        </fmt:bundle>
                    </button>
                    <div>
                        <br>
                        <p style="color:black; ">
                            <fmt:bundle basename="app">
                                <fmt:message key="${videogame.description}"/>
                            </fmt:bundle>
                        </p>
                    </div>
                </div>
            </form>
            </div>
        </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
