<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.producto.Producto" %>
<%@ page import="com.tec.categoria.*" %>

<%
List<Producto> productos =
(List<Producto>) request.getAttribute("productos");

CategoriaServiceImpl catService = new CategoriaServiceImpl();
%>

<html>
<head>
<link rel="stylesheet" href="/styles.css">
</head>

<body>

<div class="top-productos">

<a href="/admin" class="btn-volver-admin">
← Volver
</a>

<h1>Gestión de Productos</h1>

<a href="/producto/nuevo" class="btn-add">
+ Agregar Producto
</a>

</div>

<table class="tabla-productos">

<tr>
<th>Imagen</th>
<th>Nombre</th>
<th>Precio</th>
<th>Categoría</th>
<th>Acciones</th>
</tr>

<%
for(Producto p : productos){

    String nombreCategoria = "";

    for(Categoria c : catService.listar()){
        if(c.getId() == p.getCategoriaId()){
            nombreCategoria = c.getNombre();
        }
    }
%>

<tr>

<td>
<img src="<%= p.getImagen() %>">
</td>

<td><%= p.getNombre() %></td>

<td>S/. <%= p.getPrecio() %></td>

<td><%= nombreCategoria %></td>

<td>

<a href="/producto/editar?id=<%= p.getId() %>">
<button class="btn-edit">Editar</button>
</a>

<a href="/producto/eliminar?id=<%= p.getId() %>">
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