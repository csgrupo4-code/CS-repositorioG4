<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

<title>Detalle Envío</title>

<link rel="stylesheet"
href="/styles.css">

</head>

<body>

<%@ include file="/header.jsp" %>

<h1 class="titulo">
📦 Detalle del Envío
</h1>

<c:if test="${param.error == 'cancelado'}">
<div class="mensaje-error">
No se puede actualizar un pedido cancelado.
</div>
</c:if>

<c:if test="${param.error == 'completado'}">
<div class="mensaje-error">
No se puede actualizar un pedido completado.
</div>
</c:if>

<div class="card-detalle">

<p>
<b>ID Envío:</b>
${envio.idEnvio}
</p>

<p>
<b>ID Pedido:</b>
${envio.idPedido}
</p>

<form action="/envio/actualizar" method="post">
<input type="hidden" name="id" value="${envio.idEnvio}">

<p>
<b>Estado:</b>
<select name="estado">

<option value="Preparando">
Preparando
</option>

<option value="En camino">
En camino
</option>

<option value="Visita fallida">
Visita fallida
</option>

<option value="Reprogramado">
Reprogramado
</option>

<option value="Entregado">
Entregado
</option>

<option value="Cancelado">
Cancelado
</option>

</select>

</p>

<button type="submit" class="btn-update">
Actualizar
</button>

</form>

</div>

<br>

<a href="/pedido/lista">
<button class="btn-volver">
Volver
</button>

</a>
</body>
</html>