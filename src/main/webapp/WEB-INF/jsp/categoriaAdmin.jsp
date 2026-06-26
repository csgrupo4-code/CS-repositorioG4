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
            <th>Estado</th>
            <th>Acciones</th>
        </tr>

        <c:choose>
            <c:when test="${not empty categorias}">
                <c:forEach items="${categorias}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.nombre}</td>

                        <td>
                            <c:choose>

                                <c:when test="${c.activo}">
                                    🟢 Activa
                                </c:when>

                                <c:otherwise>
                                    🔴 Inactiva
                                </c:otherwise>

                            </c:choose>

                        </td>

                        <td>
                            <a href="/categoria/editar?id=${c.id}" class="btn-editar">
                                ✏ Editar
                            </a>

                            <c:choose>
                                <c:when test="${c.activo}">

                                    <a href="/categoria/desactivar?id=${c.id}" class="btn-eliminar">
                                        Desactivar
                                    </a>
                                </c:when>

                                <c:otherwise>
                                    <a href="/categoria/activar?id=${c.id}" class="btn-guardar">
                                        Activar
                                    </a>
                                </c:otherwise>
                            </c:choose>
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