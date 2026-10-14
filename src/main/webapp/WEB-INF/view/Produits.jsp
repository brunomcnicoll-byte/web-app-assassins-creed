<%--
    Document   : Produits
    Created on : May 11, 2026, 7:32:58 PM
    Author     : Bruno
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <fmt:setLocale value="${sessionScope.locale}"/>
        <fmt:bundle basename="app">
            <title><fmt:message key="PTitleProduits"/></title>
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

            <main class="main-content">
                <div class="container-fluid px-5 py-5">
                    <br>
                    <br>

                    <div id="gamesCarousel" class="carousel slide" data-bs-ride="false">
                        <div class="carousel-inner">

                            <c:forEach var="group" items="${groupsOf3}" varStatus="status">
                                <div class="carousel-item ${status.first ? 'active' : ''}">
                                    <div class="d-flex justify-content-center gap-4">

                                        <c:forEach var="g" items="${group}">
                                            <div class="game-card">
                                                <form action="${pageContext.request.contextPath}/videogames/details" method="get">
                                                    <input type="hidden" name="id" value="${g.gameId}">

                                                    <button type="submit" class="game-card-inner" style="border:none; background:none; padding:0;">
                                                        <img src="${pageContext.request.contextPath}${g.imageUrl}"
                                                             alt="${g.title}" class="game-cover"/>
                                                    </button>
                                                </form>
                                                <form action="${pageContext.request.contextPath}/cart" method="get">
                                                    <input type="hidden" name="action" value="select">
                                                    <input type="hidden" name="gameId" value="${g.gameId}">

                                                    <button class="btn-add-cart btn btn-block btn-lg">
                                                        <fmt:bundle basename="app">
                                                            <fmt:message key="BoutonAjouter"/>
                                                        </fmt:bundle>
                                                    </button>
                                                </form>

                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                            </c:forEach>
                            <c:if test="${param.error == 'duplicate'}">
                                <div class="alert alert-danger" role="alert">
                                    <fmt:bundle basename="app">
                                        <fmt:message key="messageDuplicate"/>
                                    </fmt:bundle>
                                </div>
                            </c:if>
                        </div>
                    <!-- Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#gamesCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>

                    <button class="carousel-control-next" type="button" data-bs-target="#gamesCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
                </div>
            </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>  
    </body>
</html>
