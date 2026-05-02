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

<!-- RECUADRO -->
<script>
function toggleMenu() {
    var menu = document.getElementById("dropdown-menu");

    if (menu.style.display === "block") {
        menu.style.display = "none";
    } else {
        menu.style.display = "block";
    }
}
</script>
     <!-- SALIR CUANDO HACE CLIC -->
<script>
document.addEventListener("click", function(event) {
    var menu = document.getElementById("dropdown-menu");
    var icon = document.querySelector(".menu-icon");

    if (
        menu.style.display === "block" &&
        !menu.contains(event.target) &&
        !icon.contains(event.target)
    ) {
        menu.style.display = "none";
    }
});
</script>

<!-- CARRITO -->
<div id="cart" class="cart">

    <div class="cart-header">
        <h2>Carrito</h2>
        <span class="close-cart" onclick="toggleCart()">✖</span>
    </div>

    <div class="cart-items" id="cart-items">
        <p>No hay productos aún</p>
    </div>

    <div class="cart-footer">
        <button id="btn-pagar" onclick="pagar()" style="display:none;">
            Pagar
        </button>
        <button onclick="toggleCart()">Seguir comprando</button>
    </div>

</div>

<script>
function toggleCart() {
    var cart = document.getElementById("cart");

    if (cart.style.right === "0px") {
        cart.style.right = "-300px"; // cerrar
    } else {
        cart.style.right = "0px"; // abrir
    }
}
</script>

<script>
let cartList = [];

function addToCart(nombre, precio) {

    console.log(nombre, precio);

    var existe = cartList.find(p => p.nombre === nombre);

    if (existe) {
        existe.cantidad++;
    } else {
        cartList.push({
            nombre: nombre,
            precio: precio,
            cantidad: 1
        });
    }

    renderCart();
}
</script>

<script>
function renderCart() {

    var container = document.getElementById("cart-items");
    container.innerHTML = "";

    if (cartList.length === 0) {

        container.innerHTML = "<p>No hay productos</p>";

        document.getElementById("btn-pagar").style.display = "none";

        return;
    }

    document.getElementById("btn-pagar").style.display = "block";

    for (let i = 0; i < cartList.length; i++) {

        var item = cartList[i];

        // contenedor
        var div = document.createElement("div");

        // nombre
        var nombre = document.createElement("strong");
        nombre.textContent = item.nombre;

        // precio
        var precio = document.createElement("p");

        var total = parseFloat(item.precio) * item.cantidad;
        precio.textContent = "S/. " + total.toFixed(2);

        // cantidad
        var cantidad = document.createElement("p");
        cantidad.textContent = "Cantidad: " + item.cantidad;

        // botones

           // botón +
           var btnMas = document.createElement("button");

           btnMas.textContent = "+";

           btnMas.onclick = function() {
               aumentar(i);
           };

           // botón -
           var btnMenos = document.createElement("button");

           btnMenos.textContent = "-";

           btnMenos.onclick = function() {
               disminuir(i);
           };

           // botón eliminar
           var btnEliminar = document.createElement("button");

           btnEliminar.textContent = "🗑️";

           btnEliminar.onclick = function() {
               eliminar(i);
           };

           // agregar al div
           div.appendChild(nombre);
           div.appendChild(precio);
           div.appendChild(cantidad);

           // acciones
           var acciones = document.createElement("div");

           acciones.className = "acciones";

           acciones.appendChild(btnMenos);
           acciones.appendChild(btnMas);
           acciones.appendChild(btnEliminar);

           div.appendChild(acciones);



        // agregar al carrito
        container.appendChild(div);
    }
}
</script>

<script>
function aumentar(index) {
    cartList[index].cantidad++;
    renderCart();
}

function disminuir(index) {
    if (cartList[index].cantidad > 1) {
        cartList[index].cantidad--;
    }
    renderCart();
}

function eliminar(index) {
    cartList.splice(index, 1);
    renderCart();
}
</script>

<script>

function pagar() {

    let usuario = localStorage.getItem("usuarioLogueado");

    if(usuario == null) {

        alert("Debes iniciar sesión");

        window.location.href = "/login";

    } else {

        window.location.href = "/pago";
    }
}

</script>


<!-- ================== -->

<!-- HEADER -->
<header class="top-header">
    <div class="menu-icon" onclick="toggleMenu()">☰</div>
    <div id="dropdown-menu" class="dropdown-menu">
        <a href="/contacto">Contacto</a>
        <a href="/promociones">Promociones</a>
    </div>

    <div class="logo">
        <h2>SysTec</h2>
    </div>

    <div class="info">

        <span>📞 981 309 331</span>

        <span onclick="toggleCart()" style="cursor:pointer;">🛒</span>

        <div class="usuario-box">

            <span id="usuario-login" style="cursor:pointer;">
                👤 Login
            </span>

            <div id="menu-usuario" class="menu-usuario">

                <a href="#" onclick="cerrarSesion()">Cerrar sesión</a>

            </div>

        </div>

    </div>
</header>

<!-- MENU -->
<nav class="menu">
    <a href="/categoria?tipo=celular">Celulares 📱</a>

    <a href="/categoria?tipo=laptop">Laptops 💻</a>

    <a href="/categoria?tipo=computadora">Computadoras 🖥️</a>

    <a href="/categoria?tipo=impresora">Impresoras 🖨️</a>
</nav>

<!-- BANNER -->
<div class="banner">
    <div class="banner-content">
        <h1>Las mejores ofertas</h1>
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
        <button onclick="addToCart('<%= p.getNombre().replace("'","") %>', '<%= p.getPrecio()%>')">
            Añadir al Carrito
        </button>
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
        <a href="/categoria?tipo=celular" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countCel = 0;
        for(Producto p : productos){
            if("celular".equalsIgnoreCase(p.getCategoria()) && countCel < 4){
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
        <a href="/categoria?tipo=laptop" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countLap = 0;
        for(Producto p : productos){
            if("laptop".equalsIgnoreCase(p.getCategoria()) && countLap < 4){
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
        <a href="/categoria?tipo=computadora" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countPc = 0;
        for(Producto p : productos){
            if("computadora".equalsIgnoreCase(p.getCategoria()) && countPc < 4){
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
        <a href="/categoria?tipo=impresora" class="ver-todo">
        Ver todo
        </a>
    </div>

    <div class="productos">
    <%
        int countImp = 0;
        for(Producto p : productos){
            if("impresora".equalsIgnoreCase(p.getCategoria()) && countImp < 4){
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
<script>

window.onload = function() {

    let usuario = localStorage.getItem("usuarioLogueado");

    let spanUsuario = document.getElementById("usuario-login");

    let menu = document.getElementById("menu-usuario");

    if(usuario != null) {

        spanUsuario.innerHTML = "👤 " + usuario;

        spanUsuario.onclick = function(e) {

            e.stopPropagation();

            if(menu.style.display == "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        };

    } else {

        spanUsuario.innerHTML = "👤 Login";

        spanUsuario.onclick = function() {
            window.location.href = "/login";
        };
    }

    document.addEventListener("click", function() {
        menu.style.display = "none";
    });
};

function cerrarSesion() {

    localStorage.removeItem("usuarioLogueado");
    localStorage.removeItem("rol");

    window.location.href = "/";
}

</script>


</body>
</html>