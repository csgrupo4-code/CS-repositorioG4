<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>

<title>Nuevo Producto</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body class="editar-body">

<div class="editar-box">

<h1>Agregar Producto</h1>

<form action="/producto/guardarNuevo" method="post">

<label>Nombre</label>
<input type="text" name="nombre">

<label>Precio</label>
<input type="text" name="precio">

<label>Imagen URL</label>
<input type="text" name="imagen">

<label>Categoría</label>
<input type="text" name="categoria">

<div class="editar-botones">

<button type="submit" class="btn-guardar">
Guardar
</button>

<a href="/producto/lista" class="btn-volver">
Volver
</a>

</div>

</form>

</div>

</body>
</html>