<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Administrador</title>

    <link rel="stylesheet" href="/styles.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

</head>
<body>

<div class="admin-layout">

    <!-- MENÚ LATERAL -->
    <div class="sidebar">

        <h2>SysTec Admin</h2>

        <a href="/producto/lista">📦 Productos</a>

        <a href="#" onclick="cerrarSesion()">
        🚪 Cerrar Sesión
        </a>

    </div>

    <!-- CONTENIDO -->
    <div class="admin-content" id="contenido">

        <h1>Panel Administrador</h1>
        <p>Bienvenido Admin</p>

    </div>

</div>

<script>

function cerrarSesion() {

    localStorage.removeItem("usuarioLogueado");
    localStorage.removeItem("rol");
    window.location.href = "/";
}

</script>
</body>
</html>