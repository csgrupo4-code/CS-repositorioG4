<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.categoria.Categoria" %>

<%
List<Categoria> categorias =
(List<Categoria>) request.getAttribute("categorias");
%>

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

    <!-- BOTÓN NUEVO -->
    <a href="/categoria/nuevo" class="btn-nuevo">
        ➕ Nueva Categoría
    </a>

    <!-- TABLA -->
    <table class="tabla">

        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>

        <%
        if(categorias != null && !categorias.isEmpty()){
            for(Categoria c : categorias){
        %>

        <tr>
            <td><%= c.getId() %></td>

            <td><%= c.getNombre() %></td>

            <td>
                <a href="/categoria/editar?id=<%= c.getId() %>" class="btn-editar">
                    ✏ Editar
                </a>

                <a href="/categoria/eliminar?id=<%= c.getId() %>" class="btn-eliminar">
                    🗑 Eliminar
                </a>
            </td>
        </tr>

        <%
            }
        } else {
        %>

        <tr>
            <td colspan="3">No hay categorías registradas</td>
        </tr>

        <%
        }
        %>

    </table>

    <!-- VOLVER -->
    <a href="/admin" class="btn-volver">
        ⬅ Volver al Panel
    </a>

</div>

</body>
</html>