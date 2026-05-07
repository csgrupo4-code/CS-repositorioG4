<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.tec.categoria.Categoria" %>

<%
Categoria c = (Categoria) request.getAttribute("categoria");
boolean editar = (c != null);
%>

<html>
<head>
<title>Categoría</title>
<link rel="stylesheet" href="/styles.css">
</head>

<body class="editar-body">

<div class="editar-box">

<h1>
<%= editar ? "Editar Categoría" : "Nueva Categoría" %>
</h1>

<form action="<%= editar ? "/categoria/actualizar" : "/categoria/guardar" %>" method="post">

<% if(editar){ %>
<input type="hidden" name="id" value="<%= c.getId() %>">
<% } %>

<label>Nombre de categoría</label>

<input type="text" name="nombre"
value="<%= editar ? c.getNombre() : "" %>"
placeholder="Ej: Laptops, Celulares..."
class="input-pro"
required>

<div class="editar-botones">

<button type="submit" class="btn-guardar">
<%= editar ? "Guardar Cambios" : "Crear Categoría" %>
</button>

<a href="/categoria/lista" class="btn-volver">
Volver
</a>

</div>

</form>

</div>

</body>
</html>