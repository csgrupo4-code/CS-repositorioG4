<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.tec.producto.Producto" %>

<%
Producto p = (Producto) request.getAttribute("producto");
%>

<html>
<head>

<title>Editar Producto</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body class="editar-body">

<div class="editar-box">

<h1>Editar Producto</h1>

<form action="/producto/guardarEdicion" method="post">

<input type="hidden" name="id" value="<%= p.getId() %>">

<label>Nombre</label>
<input type="text" name="nombre"
value="<%= p.getNombre() %>">

<label>Precio</label>
<input type="text" name="precio"
value="<%= p.getPrecio() %>">

<label>Imagen URL</label>
<input type="text" name="imagen"
value="<%= p.getImagen() %>">

<label>Categoría</label>
<input type="text" name="categoria"
value="<%= p.getCategoria() %>">

<div class="editar-botones">

<button type="submit" class="btn-guardar">
Guardar Cambios
</button>

<a href="/producto/lista" class="btn-volver">
Volver
</a>

</div>

</form>

</div>

</body>
</html>