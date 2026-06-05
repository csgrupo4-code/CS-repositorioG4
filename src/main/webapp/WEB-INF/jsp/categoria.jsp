<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>
<head>

<title>Categoría</title>

<link rel="stylesheet" href="/styles.css">

<meta charset="UTF-8">

</head>

<body>

<%@ include file="/header.jsp" %>

<h1 style="text-align:center; margin-top:30px;">
    ${empty nombreCategoria
    ? 'Categoría'
    : nombreCategoria}
</h1>

<div class="productos-vertical">

    <c:choose>
        <c:when test="${not empty productos}">

            <c:forEach items="${productos}" var="p">
                <div class="card">
                    <img src="${p.imagen}">

                    <h3> ${p.nombre} </h3>

                    <p> S/. ${p.precio} </p>

                    <a href="/carrito/agregar?id=${p.id}" class="btn-agregar">
                        Añadir al carrito
                    </a>

                </div>

            </c:forEach>
        </c:when>

        <c:otherwise>

            <p style="text-align:center;">
                No hay productos en esta categoría
            </p>

        </c:otherwise>
    </c:choose>

</div>
</body>
</html>