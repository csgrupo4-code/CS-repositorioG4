<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
<title>Pedidos</title>
<link rel="stylesheet" href="/styles.css">
</head>

<body>

<%@ include file="/header.jsp" %>

<h1 class="titulo">📦 Pedidos</h1>
<table class="tabla">

<tr>
<th>N° Pedido</th>
<th>DNI</th>
<th>Cliente</th>
<th>Fecha</th>
<th>Estado</th>
<th>Dirección</th>
<th>Detalle</th>
<th>Acciones</th>
</tr>

<c:forEach items="${pedidos}" var="p">

<tr>

<td> #${p.idPedido} </td>
<td> ${p.dni} </td>
<td> ${p.nombreCliente} </td>
<td> ${p.fecha} </td>
<td> ${p.estado} </td>
<td> ${p.direccion} </td>

<td>

<a href="/pedido/detalle?id=${p.idPedido}">
<button class="btn-detail">
Ver detalle
</button>

</a>
</td>

<td>

<a href="/envio/detalle?id=${p.idPedido}">
<button class="btn-detail">
Ver envío
</button>

</a>

</td>

</tr>
</c:forEach>
</table>
</body>
</html>