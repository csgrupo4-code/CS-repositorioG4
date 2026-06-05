<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>
<head>

<title>Admin - Categorías</title>
<link rel="stylesheet" href="/styles.css">
<meta charset="UTF-8">

</head>

<body>

<%@ include file="/header.jsp" %>
<div class="admin-container">

    <h1>📂 Gestión de Categorías</h1>

    <c:if test="${not empty error}">
        <div class="mensaje-error">
            ${error}
        </div>
    </c:if>

    <a href="/categoria/nuevo" class="btn-nuevo">
        ➕ Nueva Categoría
    </a>

    <table class="tabla">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>

        <c:choose>
            <c:when test="${not empty categorias}">
                <c:forEach items="${categorias}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.nombre}</td>
                        <td>
                            <a href="/categoria/editar?id=${c.id}" class="btn-editar">
                                ✏ Editar
                            </a>

                            <a href="/categoria/eliminar?id=${c.id}" class="btn-eliminar">
                                🗑 Eliminar
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>

            <c:otherwise>

                <tr>
                    <td colspan="3">
                        No hay categorías registradas
                    </td>
                </tr>

            </c:otherwise>
        </c:choose>

    </table>

    <a href="/admin" class="btn-volver">
        ⬅ Volver al Panel
    </a>

</div>
</body>
</html>