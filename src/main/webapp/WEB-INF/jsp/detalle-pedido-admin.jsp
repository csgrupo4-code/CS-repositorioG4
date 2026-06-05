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
<h1 class="titulo">

📦 Detalle Pedido #${pedido.idPedido}

</h1>

<br>
<p>
<b>Cliente:</b>
${pedido.nombreCliente}
</p>

<p>
<b>Fecha:</b>
${pedido.fecha}
</p>

<p>
<b>Estado:</b>
${pedido.estado}
</p>

<p>
<b>Dirección:</b>
${pedido.direccion}
</p>

<br>
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
<br>

<h2>Total: S/. ${pedido.total}</h2>

</body>
</html>