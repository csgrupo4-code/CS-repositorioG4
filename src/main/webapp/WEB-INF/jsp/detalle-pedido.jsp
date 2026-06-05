<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

<title>Detalle Pedido</title>
<link rel="stylesheet" href="/styles.css">

</head>

<body>

<%@ include file="/header.jsp" %>

<h2> Pedido #${pedido.idPedido} </h2>

<p> Estado: ${pedido.estado} </p>

<p> Dirección: ${pedido.direccion} </p>

<p> Total: S/. ${pedido.total} </p>

<table class="tabla">

<tr>

<th>Producto</th>
<th>Cantidad</th>
<th>Precio</th>

</tr>

<c:forEach items="${pedido.detalles}" var="d">

    <tr>
        <td>${d.producto}</td>
        <td>${d.cantidad}</td>
        <td>S/. ${d.precio}</td>
    </tr>

</c:forEach>

</table>
</body>
</html>