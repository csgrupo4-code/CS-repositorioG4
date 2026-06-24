<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>

<title>SysTec</title>

<link rel="stylesheet" href="/styles.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
rel="stylesheet">

</head>

<body>

<!-- HEADER -->

<body>

<%@ include file="/header.jsp" %>

<!-- BANNER -->

<div class="banner">

    <div class="banner-content">

        <h1 class="titulo-banner">
            Las mejores ofertas
        </h1>

        <p>Encuentra tecnología al mejor precio</p>

    </div>

</div>

<!-- PRODUCTOS DESTACADOS -->

<h2 style="text-align:center;">
Productos Destacados
</h2>

<div class="productos">

<c:forEach items="${productos}" var="p">

    <c:if test="${p.destacado}">

        <div class="card">
            <img src="${p.imagen}">

            <h3>${p.nombre}</h3>

            <p>S/. ${p.precio}</p>

            <a href="/carrito/agregar?id=${p.id}" class="btn-add-cart">
                Añadir al Carrito
            </a>

        </div>
    </c:if>
</c:forEach>
</div>

<c:forEach items="${categorias}" var="c">

    <h2 style="text-align:left; margin-left:100px;">
        ${c.nombre}
    </h2>

    <div class="productos">

        <c:forEach items="${productos}" var="p">

            <c:if test="${p.categoria.id == c.id}">

                <div class="card">

                    <img src="${p.imagen}">

                    <h3>${p.nombre}</h3>

                    <p>S/. ${p.precio}</p>

                    <a href="/carrito/agregar?id=${p.id}" class="btn-add-cart">
                        Añadir al Carrito
                    </a>

                </div>
            </c:if>
        </c:forEach>
    </div>

</c:forEach>

<footer class="footer">

<div class="footer-content">

<p>
© 2026 SysTec - Todos los derechos reservados
</p>

<p>
📞 981 309 331 |
✉️ contacto@systec.com
</p>

</div>

</footer>

</body>
</html>