<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Login</title>

    <link rel="stylesheet" href="/styles.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

</head>
<body>

<div class="login-container">

    <h1>Iniciar Sesión</h1>

    <div class="login-form">

        <input type="text" id="usuario" placeholder="Usuario">

        <input type="password" id="password" placeholder="Contraseña">

        <button onclick="login()">Ingresar</button>
        <p class="registro-texto">
            ¿No tienes cuenta?
            <a href="/registro">Regístrate</a>
        </p>

    </div>

</div>

<script>

function login() {

    let usuario = document.getElementById("usuario").value;

    let password = document.getElementById("password").value;

    if(usuario === "admin" && password === "123") {

        localStorage.setItem("usuarioLogueado", usuario);

        localStorage.setItem("rol", "admin");

        alert("Bienvenido Administrador");

        window.location.href = "/admin";

    }
    else if(usuario === "brayan" && password === "123") {

        localStorage.setItem("usuarioLogueado", usuario);

        localStorage.setItem("rol", "cliente");

        alert("Login correcto");

        window.location.href = "/";
    }
    else {

        alert("Usuario o contraseña incorrectos");
    }
}

</script>

</body>
</html>