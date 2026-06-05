<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>
<title>Nuevo Producto</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body class="editar-body">

<div class="editar-box">

<h1>Agregar Producto</h1>

<c:if test="${not empty error}">

    <div class="mensaje-error"> ${error} </div>

</c:if>

<form action="/producto/guardarNuevo" method="post">

<label>Nombre</label>
<input type="text" name="nombre">
<label>Precio</label>

<input type="text" name="precio">

<label>Imagen URL</label>
<input type="text" name="imagen">
<label>Categoría</label>

<select name="categoriaId" class="select-categoria">

    <c:forEach items="${categorias}" var="c">
        <option value="${c.id}"> ${c.nombre} </option>
    </c:forEach>

</select>

<div class="editar-botones">

<button type="submit" class="btn-guardar"> Guardar </button>

<a href="/producto/lista" class="btn-volver"> Volver </a>

</div>

</form>

</div>
</body>
</html>