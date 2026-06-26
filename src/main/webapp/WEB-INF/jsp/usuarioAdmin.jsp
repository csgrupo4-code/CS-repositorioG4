<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>
<head>

<title>Gestión de Usuarios</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body>

<%@ include file="/header.jsp" %>

<div class="admin-container">

    <h1>👤 Gestión de Usuarios</h1>

    <table class="tabla">
        <tr>
            <th>ID</th>
            <th>DNI</th>
            <th>Nombre</th>
            <th>Usuario</th>
            <th>Teléfono</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>

        <c:forEach items="${usuarios}" var="u">

            <tr>
                <td>${u.idUsuario}</td>
                <td>${u.dni}</td>
                <td>${u.nombre}</td>
                <td>${u.usuario}</td>
                <td>${u.telefono}</td>

                <td>
                    <c:choose>
                        <c:when test="${u.estadoUsuario == 'Activo'}">
                            🟢 Activo
                        </c:when>

                        <c:otherwise>
                            🔴 Inactivo
                        </c:otherwise>
                    </c:choose>

                </td>

                <td>

                    <a href="/usuario/editar?id=${u.idUsuario}" class="btn-editar">
                        ✏ Editar
                    </a>

                    <c:choose>
                        <c:when test="${u.estadoUsuario == 'Activo'}">

                            <a href="/usuario/desactivar?id=${u.idUsuario}" class="btn-eliminar">
                                Desactivar
                            </a>

                        </c:when>

                        <c:otherwise>

                            <a href="/usuario/activar?id=${u.idUsuario}" class="btn-guardar">
                                Activar
                            </a>

                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>

    </table>

    <a href="/admin" class="btn-volver">
        ⬅ Volver al Panel
    </a>

</div>
</body>
</html>