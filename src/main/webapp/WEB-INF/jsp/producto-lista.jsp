<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

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
        <th>Estado</th>
        <th>Acciones</th>
    </tr>

    <c:forEach items="${productos}" var="p">

        <tr>

            <td>
                <img src="${p.imagen}">
            </td>

            <td>${p.nombre}</td>
            <td>S/. ${p.precio}</td>
            <td>${p.categoria.nombre}</td>

            <td>

                <c:choose>

                    <c:when test="${p.activo}">
                        🟢 Activo
                    </c:when>

                    <c:otherwise>
                        🔴 Inactivo
                    </c:otherwise>

                </c:choose>

            </td>

            <td>

                <a href="/producto/editar?id=${p.id}">
                    <button class="btn-edit">
                        Editar
                    </button>
                </a>

                <c:choose>

                    <c:when test="${p.activo}">

                        <a href="/producto/desactivar?id=${p.id}">
                            <button class="btn-delete">
                                Desactivar
                            </button>
                        </a>

                    </c:when>

                    <c:otherwise>

                        <a href="/producto/activar?id=${p.id}">
                            <button class="btn-add">
                                Activar
                            </button>
                        </a>

                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>