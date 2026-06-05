<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>
<title>Mis Pedidos</title>
<link rel="stylesheet" href="/styles.css">
</head>

<body>
<%@ include file="/header.jsp" %>

<c:if test="${param.error == 'noCancelar'}">
<div class="mensaje-error">
No se puede cancelar el pedido porque el envío ya se encuentra en camino.
</div>
</c:if>

<table class="tabla">

<tr>
<th>Pedido</th>
<th>Fecha</th>
<th>Estado Pedido</th>
<th>Estado Envio</th>
<th>Dirección</th>
<th>Detalle</th>
<th>Cancelar</th>
</tr>

<c:forEach items="${pedidos}" var="p">

<tr>
<td> #${p.idPedido} </td>
<td> ${p.fecha} </td>
<td> ${p.estado} </td>
<td> ${p.estadoEnvio} </td>
<td> ${p.direccion} </td>

<td>
<a href="/pedido/detalle?id=${p.idPedido}">
Ver detalle
</a>
</td>

<td>
<c:if test="${p.estado != 'Cancelado' && p.estado != 'Completado'}">
<form action="/pedido/cancelar" method="post">

<input type="hidden" name="id" value="${p.idPedido}">

<button type="submit" class="btn-delete">
Cancelar
</button>

</form>
</c:if>
</td>

</tr>
</c:forEach>
</table>
</body>
</html>