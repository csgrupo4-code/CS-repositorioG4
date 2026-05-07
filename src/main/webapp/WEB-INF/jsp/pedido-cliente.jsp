<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.pedido.Pedido" %>

<%
List<Pedido> pedidos =
(List<Pedido>) request.getAttribute("pedidos");
%>

<html>
<head>
<title>Mis Pedidos</title>
<link rel="stylesheet" href="/styles.css">
</head>

<body>

<%@ include file="/header.jsp" %>



<table class="tabla">

<tr>
<th>Producto</th>
<th>Cantidad</th>
<th>Fecha</th>
<th>Estado</th>
<th>Dirección</th>
</tr>

<%
for(Pedido p : pedidos){
%>

<tr>
<td><%= p.getProducto() %></td>
<td><%= p.getCantidad() %></td>
<td><%= p.getFecha() %></td>
<td><%= p.getEstado() %></td>
<td><%= p.getDireccion() %></td>
</tr>

<%
}
%>

</table>

</body>
</html>