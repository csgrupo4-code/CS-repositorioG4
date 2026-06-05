<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

<title>Envíos</title>

<link rel="stylesheet"
href="/styles.css">

</head>

<body>

<%@ include file="/header.jsp" %>

<h1 class="titulo">
📦 Gestión de Envíos
</h1>

<table class="tabla">

<tr>
<th>ID</th>
<th>Pedido</th>
<th>Estado</th>
</tr>

<c:forEach items="${envios}" var="e">

<tr>



<td>
${e.idEnvio}
</td>
<td>
${e.idPedido}
</td>
<td>
${e.estado}
</td>
</tr>

</c:forEach>

</table>

</body>

</html>