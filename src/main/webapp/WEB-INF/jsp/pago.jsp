<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Pagar</title>

    <link rel="stylesheet" href="/styles.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

</head>
<body>

<div class="pago-container">

    <div class="formulario">

    <h1>Finalizar Compra</h1>

    <!-- FORM REAL -->
    <form action="/pedido/crear" method="post">

        <input type="text" name="dni" placeholder="DNI" required>

        <input type="text" name="nombreCliente" placeholder="Nombre completo" required>

        <input type="text" name="direccion" placeholder="Dirección" required>

        <!-- Estos son solo visuales (no se guardan aún) -->
        <input type="text" placeholder="Número de tarjeta">

        <input type="text" placeholder="Fecha vencimiento">

        <input type="text" placeholder="CVV">

        <button type="submit">Confirmar Pago</button>

    </form>

    </div>

</div>

</body>
</html>