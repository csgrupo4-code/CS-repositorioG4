<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

<title>Categoría</title>
<link rel="stylesheet" href="/styles.css">

</head>

<body class="editar-body">

<div class="editar-box">

<h1>

<c:choose>

    <c:when test="${not empty categoria}"> Editar Categoría </c:when>

    <c:otherwise> Nueva Categoría </c:otherwise>

</c:choose>

</h1>

<c:if test="${not empty error}">

    <div class="mensaje-error"> ${error} </div>

</c:if>

<form action="${not empty categoria ? '/categoria/actualizar' : '/categoria/guardar'}" method="post">

<c:if test="${not empty categoria}">

    <input
            type="hidden"
            name="id"
            value="${categoria.id}">

</c:if>

<label> Nombre de categoría </label>

<input
        type="text"
        name="nombre"
        value="${not empty categoria ? categoria.nombre : ''}"
        placeholder="Ej: Laptops, Celulares..."
        class="input-pro"
        required>

<div class="editar-botones">

<button type="submit" class="btn-guardar">

    <c:choose>

        <c:when test="${not empty categoria}"> Guardar Cambios </c:when>
        <c:otherwise> Crear Categoría </c:otherwise>

    </c:choose>

</button>

<a href="/categoria/lista" class="btn-volver">Volver</a>

</div>

</form>
</div>
</body>
</html>