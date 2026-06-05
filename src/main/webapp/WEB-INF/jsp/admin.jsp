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
        <a href="/categoria/lista">📂 Categorías</a>
        <a href="/pedido/lista">📦 Pedidos</a>
        <a href="/envio/lista">📦 Envios</a>
        <a href="/metrica/pedidos-dia">📈 Métricas</a>

        <!-- LOGOUT -->
        <a href="/logout">
            🚪 Cerrar Sesión
        </a>

    </div>

    <!-- CONTENIDO -->
    <div class="admin-content">

        <h1>Panel Administrador</h1>
        <p>Bienvenido Admin</p>

    </div>

</div>

</body>
</html>