<%-- 
    Document   : PageCart
    Created on : May 13, 2026, 11:13:09 AM
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

    <!-- CONTENT -->
    <div class="container-fluid px-5 py-5">

        <div class="section-title" style="color:#C00000 ; margin: 20px; font-size: 30px; font-weight: bold; text-align: center">
            <fmt:bundle basename="app">
                <fmt:message key="PHeadCart"/>
            </fmt:bundle>
        </div>

        <main class="content" style="text-align:center">
            <div class="row px3">
                <ul class="cart-list p-0" style="list-style-type:none; width: 100%">
                    <c:forEach var="item" items="${cart.cartItems}" >
                        <li class="cart-item d-flex align-items-center justify-content-between w-100 mb-3">

                            <span class="fs-4">${item.videogame.title}</span>
                            <span class="fs-4">${item.videogame.platform}</span>
                            <span class="fs-4">
                                <fmt:bundle basename="app">
                                    <fmt:message key="Prix"/>
                                </fmt:bundle>
                                ${item.videogame.unitPrice}$
                            </span>

                            <form action="${pageContext.request.contextPath}/cart" method="post" class="m-0">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="cartItemId" value="${item.cartItemId}">
                                <button type="submit" class="btn-remove-cart btn btn-block" >
                                <fmt:bundle basename="app">
                                    <fmt:message key="BoutonRemove"/>
                                </fmt:bundle>
                                </button>
                            </form>
                        </li>
                    </c:forEach>
                </ul>

                <span class="fs-3" style="color: red">${cart.calculateCartTotal()}$</span>

            </div>
            <div class="row" style="justify-content: center">
                <form action="${pageContext.request.contextPath}/cart" method="get" class="m-0">
                    <input type="hidden" name="action" value="continue">
                    <button type="submit" class="btn-continuer-cart btn btn-block btn-lg" style="margin: 20px;" >
                        <fmt:bundle basename="app">
                            <fmt:message key="BoutonContinuer"/>
                        </fmt:bundle>
                    </button>
                </form>
            </div>
            <form action="${pageContext.request.contextPath}/cart" name="formCheckout" method="post">
                <input type="hidden" name="action" value="checkout">
                <div class="row" style="justify-content: center">
                    <button class="btn-remove-cart" style="margin:20px"
                            data-bs-toggle="model" data-bs-target="#checkoutModal">
                        <fmt:bundle basename="app">
                            <fmt:message key="BoutonCheckout"/>
                        </fmt:bundle>
                    </button>
                </div>
            </form>
        </main>
    </div>

<!-- checkout modal -->
<div class="modal fade" id="checkoutModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #1a1a1a; border: 1px solid #cc1a1a; padding: 15px">
            <div class="modal-header" style="border-bottom: none; justify-content: center">
                <h4 class="modal-title" style="color: #c00000; font-weight: bold; text-align: center">
                    <fmt:bundle basename="app">
                        <fmt:message key="messageMerci"/>
                    </fmt:bundle>
                </h4>
            </div>

            <div class="modal-body" style="border-bottom: none; text-align: center; color: #ffffff;">
                <p>
                    <fmt:bundle basename="app">
                        <fmt:message key="messageCommande"/>
                    </fmt:bundle>
                </p>
            </div>

            <div class="modal-footer" style="border-top: none; justify-content: center;">
                <button type="button" id="btn-ok" class="btn btn-continuer-cart"
                        style="margin: 10px; width: 120px;" data-dismiss="modal" onclick="hideCheckoutModal()">
                    OK
                    </button>
            </div>
        </div>
    </div>
</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <c:if test="${param.success == 'true'}">
            <script>
                const modalElement = document.getElementById('checkoutModal');
                const myModal = new window.bootstrap.Modal(modalElement);
                myModal.show();

                function hideCheckoutModal() {
                    const modalElement = document.getElementById('checkoutModal');
                    const modalInstance =window.bootstrap.Modal.getInstance(modalElement);
                    if (modalInstance) {
                        modalInstance.hide();
                    }
                }
            </script>
        </c:if>
    </body>
</html>
