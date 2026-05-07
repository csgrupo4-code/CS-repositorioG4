<%@ page pageEncoding="UTF-8" %>

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

    <%
    String rol = (String) session.getAttribute("rol");

    if(usuario != null && "cliente".equals(rol)){
    %>

  <a href="/pedido/mis-pedidos">📦 Mis pedidos</a>

    <%
    }
    %>

</div>

<a href="/" class="logo">
    <h2>SysTec</h2>
</a>

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
