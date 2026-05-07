<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.producto.Producto" %>

<%
List<Producto> productos =
(List<Producto>) request.getAttribute("productos");

String nombreCategoria =
(String) request.getAttribute("nombreCategoria");
%>

<html>
<head>
<title>Categoría</title>
<link rel="stylesheet" href="/styles.css">
<meta charset="UTF-8">
</head>

<body>

<!-- HEADER -->
<%@ include file="/header.jsp" %>

<!-- TÍTULO -->
<h1 style="text-align:center; margin-top:30px;">
    <%= nombreCategoria != null ? nombreCategoria : "Categoría" %>
</h1>

<!-- PRODUCTOS -->
<div class="productos-vertical">

<%
if(productos != null && !productos.isEmpty()){

    for(Producto p : productos){
%>

<div class="card">

    <img src="<%= p.getImagen() %>">

    <h3><%= p.getNombre() %></h3>

    <p>S/. <%= p.getPrecio() %></p>

    <a href="/carrito/agregar?id=<%= p.getId() %>" class="btn-agregar">
        Añadir al carrito
    </a>

</div>

<%
    }

}else{
%>

<p style="text-align:center;">No hay productos en esta categoría</p>

<%
}
%>

</div>

</body>
</html>