<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

<title>Promociones</title>
<link rel="stylesheet" href="/styles.css">

</head>
<body class="promo-body">
<%@ include file="/header.jsp" %>

<h1 class="promo-title">
🔥 Productos en Promoción
</h1>

<div class="promo-grid">

<c:forEach items="${productos}" var="p">

    <c:if test="${p.destacado}">
        <div class="promo-card">
            <img src="${p.imagen}">

            <h3> ${p.nombre} </h3>

            <p class="precio-antiguo"> S/. ${p.precio} </p>
            <p class="precio-nuevo"> S/. ${p.precioFinal} </p>

            <span class="descuento"> 15% OFF </span>

            <a href="/carrito/agregar?id=${p.id}" class="btn-agregar">
                🛒 Añadir al carrito
            </a>

        </div>
    </c:if>
</c:forEach>

</div>
<div style="text-align:center; margin-top:30px;">
<a href="/"> ⬅ Volver </a>

</div>
</body>
</html>