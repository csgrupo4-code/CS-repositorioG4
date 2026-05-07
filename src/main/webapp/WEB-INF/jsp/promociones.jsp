<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.producto.Producto" %>

<%
List<Producto> productos =
(List<Producto>) request.getAttribute("productos");
%>

<html>
<head>

<title>Promociones</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body class="promo-body">

<!-- HEADER -->
<%@ include file="/header.jsp" %>

<h1 class="promo-title">🔥 Productos en Promoción</h1>

<div class="promo-grid">

<%
for(Producto p : productos){

if("true".equals(p.getDestacado())){
%>

<div class="promo-card">

<img src="<%= p.getImagen() %>">

<h3><%= p.getNombre() %></h3>

<p class="precio-antiguo">
S/. <%= p.getPrecio() %>
</p>

<p class="precio-nuevo">
S/. <%= Double.parseDouble(p.getPrecio()) * 0.85 %>
</p>

<span class="descuento">15% OFF</span>

<a href="/carrito/agregar?id=<%= p.getId() %>" class="btn-agregar">
    🛒 Añadir al carrito
</a>

</div>

<%
}
}
%>

</div>

<div style="text-align:center; margin-top:30px;">
<a href="/">⬅ Volver</a>
</div>

</body>
</html>