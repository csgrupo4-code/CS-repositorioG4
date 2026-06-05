<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>
<title>Editar Producto</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body class="editar-body">
<div class="editar-box">

<h1>Editar Producto</h1>

<c:if test="${not empty error}">
    <div class="mensaje-error">
        ${error}
    </div>
</c:if>

<form action="/producto/guardarEdicion" method="post">

<input type="hidden" name="id" value="${producto.id}">

<label>Nombre</label>
<input type="text" name="nombre" value="${producto.nombre}">

<label>Precio</label>
<input type="text" name="precio" value="${producto.precio}">

<label>Imagen URL</label>
<input type="text" name="imagen" value="${producto.imagen}">

<label>Categoría</label>
<select name="categoriaId" class="select-categoria">

<c:forEach items="${categorias}" var="c">

    <option value="${c.id}" ${c.id == producto.categoria.id ? 'selected' : ''}>
        ${c.nombre}
    </option>

</c:forEach>

</select>

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