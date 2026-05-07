<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.pedido.Pedido" %>

<%
List<Pedido> pedidos =
(List<Pedido>) request.getAttribute("pedidos");
%>

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
<th>DNI</th>
<th>Cliente</th>
<th>Producto</th>
<th>Cantidad</th>
<th>Fecha</th>
<th>Estado</th>
<th>Dirección</th>
<th>Acciones</th>
</tr>

<%
for(Pedido p : pedidos){
%>

<tr>

<td><%= p.getDni() %></td>
<td><%= p.getNombreCliente() %></td>
<td><%= p.getProducto() %></td>
<td><%= p.getCantidad() %></td>
<td><%= p.getFecha() %></td>

<td>
<form action="/pedido/actualizar" method="post">

<input type="hidden" name="id" value="<%= p.getId() %>">

<select name="estado">
<option <%= "Pendiente".equals(p.getEstado()) ? "selected" : "" %>>Pendiente</option>
<option <%= "Facturado".equals(p.getEstado()) ? "selected" : "" %>>Facturado</option>
<option <%= "En camino".equals(p.getEstado()) ? "selected" : "" %>>En camino</option>
<option <%= "Entregado".equals(p.getEstado()) ? "selected" : "" %>>Entregado</option>
<option <%= "Cancelado".equals(p.getEstado()) ? "selected" : "" %>>Cancelado</option>
</select>

<button class="btn-update">Actualizar</button>

</form>
</td>

<td><%= p.getDireccion() %></td>

<td>

<a href="/pedido/eliminar?id=<%= p.getId() %>">
<button class="btn-delete">Eliminar</button>
</a>

</td>

</tr>

<%
}
%>

</table>

</body>
</html>