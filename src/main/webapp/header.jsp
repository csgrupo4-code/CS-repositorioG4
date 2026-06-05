<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<header class="top-header">

<div class="barra-superior">

    <!-- IZQUIERDA -->
    <div class="menu-container">
        <div class="menu-icon">☰</div>
        <div class="menu-dropdown">

            <a href="/promociones">
                Promociones
            </a>

            <a href="/contacto">
                Contacto
            </a>
        </div>
    </div>

    <!-- DERECHA -->
    <div class="categoria-dropdown">
        <button class="btn-categorias">
            Categorías ▼
        </button>

        <div class="categoria-menu">

            <c:forEach items="${categorias}" var="c">

                <a href="/categoria?tipo=${c.id}">
                    ${c.nombre}
                </a>

            </c:forEach>

        </div>
    </div>

    <c:if test="${usuario != null && rol == 'cliente'}">

        <a href="/pedido/mis-pedidos">
            📦 Mis pedidos
        </a>

    </c:if>

</div>

<a href="/" class="logo">

    <h2>SysTec</h2>

</a>

<div class="info">

    <span>📞 981 309 331</span>
    <a href="/carrito">🛒</a>
    <c:choose>

        <c:when test="${usuario != null}">
            <span>
                👤 ${usuario}
            </span>

            <a href="/logout">
                Cerrar sesión
            </a>
        </c:when>

        <c:otherwise>

            <a href="/login">
                👤 Login
            </a>

        </c:otherwise>
    </c:choose>

</div>

</header>