<%-- 
    Document   : Wiki
    Created on : May 11, 2026, 7:33:39 PM
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
            <title><fmt:message key="PTitleWiki"/></title>
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

        <div class="container" style="text-align:center">
            <h1 style="margin-top: 40px;color: #C00000">
                <fmt:bundle basename="app">
                    <fmt:message key="PHeadWiki" />
                </fmt:bundle>
            </h1>
            <div class="wiki-grid ">
                <c:forEach var="g" items="${games}">
                <div class="game-card m-3">
                    <a href="${baseUrl}${g.wikiUrl}" target="_blank">
                        <div class="game-card-inner">
                            <img src="${pageContext.request.contextPath}${g.imageUrl}" alt="g.title" class="game-cover">
                        </div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
