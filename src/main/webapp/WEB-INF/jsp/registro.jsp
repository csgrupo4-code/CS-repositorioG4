<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Registro</title>
<link rel="stylesheet" href="/styles.css">
<meta charset="UTF-8">
</head>

<body class="auth-body">

<div class="auth-container">

    <h1>Registrate</h1>

    <form action="/registro" method="post" class="auth-form">

        <input type="text" name="nombre" placeholder="Nombre completo" required>
        <input type="text" name="dni" placeholder="DNI" maxlength="8" required>
        <input type="text" name="telefono" maxlength="9" placeholder="Teléfono" required>
        <input type="text" name="direccion" placeholder="Dirección" required>
        <input type="text" name="usuario" placeholder="Usuario" required>
        <input type="password" name="password" placeholder="Contraseña" required>
        <button type="submit">
            Registrarse
        </button>

    </form>

    <p class="auth-texto">
        ¿Ya tienes cuenta?
        <a href="/login">Inicia Sesion</a>
    </p>

</div>

</body>
</html>