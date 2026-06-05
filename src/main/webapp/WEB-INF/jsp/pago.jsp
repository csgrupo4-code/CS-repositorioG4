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

    <c:if test="${param.error == 'tarjeta'}">
    <div class="mensaje-error">
    El número de tarjeta debe tener 16 dígitos.
    </div>
    </c:if>

    <c:if test="${param.error == 'cvv'}">
    <div class="mensaje-error">
    El CVV debe tener 3 dígitos.
    </div>
    </c:if>

    <!-- FORM REAL -->
    <form action="/pedido/crear" method="post">

        <input type="text" name="dni" placeholder="DNI" required>

        <input type="text" name="nombreCliente" value="${cliente.nombre}" required>

        <input type="text" name="direccion"  value="${cliente.direccion}" required>

        <!-- Estos son solo visuales (no se guardan aún) -->
        <input type="text" name="numeroTarjeta" placeholder="Número de tarjeta" maxlength="16" required>
        <input type="text" name="fechaVencimiento" placeholder="Fecha vencimiento" required>
        <input type="text" name= "cvv" placeholder="CVV" maxlength="3" required>
        <button type="submit">Confirmar Pago</button>

    </form>

    </div>

</div>

</body>
</html>