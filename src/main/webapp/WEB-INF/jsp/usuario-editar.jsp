<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="/styles.css">
</head>

<body>

<%@ include file="/header.jsp" %>

<div class="form-container">

    <h1>✏ Editar Usuario</h1>

    <c:if test="${not empty error}">
        <div class="mensaje-error">
            ${error}
        </div>
    </c:if>

    <form action="/usuario/actualizar" method="post">

        <input type="hidden" name="id" value="${usuario.idUsuario}">

        <label>DNI</label>
        <input type="text" name="dni" value="${usuario.dni}" required>

        <label>Nombre</label>
        <input type="text" name="nombre" value="${usuario.nombre}" required>

        <label>Teléfono</label>
        <input type="text" name="telefono" value="${usuario.telefono}" required>

        <label>Dirección</label>
        <input type="text" name="direccion" value="${usuario.direccion}" required>

        <label>Usuario</label>
        <input type="text" name="usuario" value="${usuario.usuario}" required>

        <label>Contraseña</label>
        <input type="text" name="password" value="${usuario.password}" required>

        <br><br>

        <button type="submit" class="btn-guardar">
            Guardar Cambios
        </button>

        <a href="/usuario/lista" class="btn-volver">
            Cancelar
        </a>

    </form>

</div>
</body>
</html>