<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.producto.Producto" %>

<!DOCTYPE html>
<html>
<head>
    <title>SysTec</title>
    <link rel="stylesheet" href="/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>


<body>



<!-- ================== -->

<!-- HEADER -->
<%
String usuario = (String) session.getAttribute("usuario");
%>

<header class="top-header">

<div class="barra-superior">

    <!-- IZQUIERDA -->
    <div class="menu-container">
        <div class="menu-icon">☰</div>

        <div class="menu-dropdown">
            <a href="/promociones">Promociones</a>
            <a href="/contacto">Contacto</a>
        </div>
    </div>

    <!-- DERECHA -->
    <div class="categoria-dropdown">

        <button class="btn-categorias">Categorías ▼</button>

        <div class="categoria-menu">
            <a href="/categoria?tipo=4">Celulares 📱</a>
            <a href="/categoria?tipo=1">Laptops 💻</a>
            <a href="/categoria?tipo=3">Computadoras 🖥️</a>
            <a href="/categoria?tipo=2">Impresoras 🖨️</a>
        </div>

    </div>

</div>

<div class="logo">
<h2>SysTec</h2>
</div>

<div class="info">

<span>📞 981 309 331</span>

<a href="/carrito">🛒</a>

<%
if(usuario != null){
%>

<span>👤 <%= usuario %></span>

<a href="/logout">Cerrar sesión</a>

<%
}else{
%>

<a href="/login">👤 Login</a>

<%
}
%>

</div>

</header>


<!-- BANNER -->
<div class="banner">
    <div class="banner-content">
        <h1 class="titulo-banner">
            Las mejores ofertas
        </h1>
        <p>Encuentra tecnología al mejor precio</p>
    </div>
</div>

<%
   List<Producto> productos =
   (List<Producto>) request.getAttribute("productos");
%>

<!-- 🔥 PRODUCTOS DESTACADOS -->
<h2 style="text-align:center;">Productos Destacados</h2>

<div class="productos">
<%
    for(Producto p : productos){
    if("true".equals(p.getDestacado())){
%>
    <div class="card">
        <img src="<%= p.getImagen() %>">
        <h3><%= p.getNombre() %></h3>
        <p>S/. <%= p.getPrecio() %></p>
        <a href="/carrito/agregar?id=<%= p.getId() %>" class="btn-add-cart">
        Añadir al Carrito
        </a>
    </div>
<%
        }
    }
%>
</div>

<!-- 🔥 SECCIÓN CELULARES -->
<div class="seccion">
    <div class="seccion-header">
        <h2>Celulares</h2>
        <a href="/categoria?tipo=4" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countCel = 0;
        for(Producto p : productos){
            if((p.getCategoriaId() == 4) && countCel < 4){
    %>
        <div class="card">
            <img src="<%= p.getImagen() %>">
            <h3><%= p.getNombre() %></h3>
            <p>S/. <%= p.getPrecio() %></p>
        </div>
    <%
                countCel++;
            }
        }
    %>
    </div>
</div>

<!-- 🔥 SECCIÓN LAPTOPS -->
<div class="seccion">
    <div class="seccion-header">
        <h2>Laptops</h2>
        <a href="/categoria?tipo=1" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countLap = 0;
        for(Producto p : productos){
            if((p.getCategoriaId() == 1) && countLap < 4){
    %>
        <div class="card">
            <img src="<%= p.getImagen() %>">
            <h3><%= p.getNombre() %></h3>
            <p>S/. <%= p.getPrecio() %></p>
        </div>
    <%
                countLap++;
            }
        }
    %>
    </div>
</div>

<!-- 🔥 SECCIÓN COMPUTADORAS -->
<div class="seccion">
    <div class="seccion-header">
        <h2>Computadoras</h2>
        <a href="/categoria?tipo=3" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countPc = 0;
        for(Producto p : productos){
            if((p.getCategoriaId() == 3) && countPc < 4){
    %>
        <div class="card">
            <img src="<%= p.getImagen() %>">
            <h3><%= p.getNombre() %></h3>
            <p>S/. <%= p.getPrecio() %></p>
        </div>
    <%
                countPc++;
            }
        }
    %>
    </div>
</div>

<!-- 🔥 SECCIÓN IMPRESORAS -->
<div class="seccion">
    <div class="seccion-header">
        <h2>Impresoras</h2>
        <a href="/categoria?tipo=2" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countImp = 0;
        for(Producto p : productos){
            if((p.getCategoriaId() == 2) && countImp < 4){
    %>
        <div class="card">
            <img src="<%= p.getImagen() %>">
            <h3><%= p.getNombre() %></h3>
            <p>S/. <%= p.getPrecio() %></p>
        </div>
    <%
                countImp++;
            }
        }
    %>
    </div>
</div>

<footer class="footer">

    <div class="footer-content">
        <p>© 2026 SysTec - Todos los derechos reservados</p>
        <p>📞 981 309 331 | ✉️ contacto@systec.com</p>
    </div>

</footer>


</body>
</html>