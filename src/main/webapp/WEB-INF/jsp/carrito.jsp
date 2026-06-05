<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
<title>Carrito</title>
<link rel="stylesheet" href="/styles.css">
</head>

<body>

<%@ include file="/header.jsp" %>

<div class="carrito-layout">

    <!-- IZQUIERDA -->
    <div class="carrito-left">

        <h3 class="titulo">
            PRODUCTO
        </h3>

        <c:choose>
            <c:when test="${not empty carrito}">
                <c:forEach items="${carrito}" var="item" varStatus="estado">

                    <div class="carrito-item">

                        <img src="${item.producto.imagen}" class="item-img">

                        <div class="item-info">

                            <p class="nombre">
                                ${item.producto.nombre}
                            </p>

                            <p class="precio">
                                S/. ${item.producto.precioFinal}
                            </p>

                            <div class="cantidad-box">
                                <a href="/carrito/menos?index=${estado.index}">
                                    -
                                </a>

                                <span> ${item.cantidad} </span>

                                <a href="/carrito/mas?index=${estado.index}">
                                    +
                                </a>

                            </div>

                        </div>

                        <div class="item-total">
                            S/. ${item.subtotal}
                            <a href="/carrito/eliminar?index=${estado.index}" class="eliminar">
                                🗑
                            </a>

                        </div>
                    </div>
                </c:forEach>

            </c:when>

            <c:otherwise>

                <p>
                    No hay productos en el carrito
                </p>

            </c:otherwise>
        </c:choose>
    </div>

    <!-- DERECHA -->
    <div class="carrito-right">

        <h4>TOTAL DEL CARRITO</h4>

        <div class="total-box">
            <span>Estimated total</span>
            <strong> S/. ${total} </strong>
        </div>

        <a href="/pago" class="btn-pagar">
            Proceder al Pago
        </a>

    </div>

</div>

</body>


</html>