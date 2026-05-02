<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.producto.Producto" %>

<%
List<Producto> productos =
(List<Producto>) request.getAttribute("productos");

String tipo =
(String) request.getAttribute("tipo");
%>

<html>

<head>

<title>Categoría</title>

<link rel="stylesheet" href="/styles.css">

</head>

<body>

<!-- ===================== -->
<!-- MENU LATERAL -->
<!-- ===================== -->
<div id="dropdown-menu" class="dropdown-menu">
    <a href="/contacto">Contacto</a>
    <a href="/promociones">Promociones</a>
</div>

<!-- ===================== -->
<!-- CARRITO -->
<!-- ===================== -->
<div id="cart" class="cart">

    <div class="cart-header">
        <h2>Carrito</h2>
        <span class="close-cart" onclick="toggleCart()">✖</span>
    </div>

    <div class="cart-items" id="cart-items">
        <p>No hay productos aún</p>
    </div>

    <div class="cart-footer">

        <button id="btn-pagar"
                onclick="pagar()"
                style="display:none;">

            Pagar

        </button>

        <button onclick="toggleCart()">
            Seguir comprando
        </button>

    </div>

</div>

<!-- ===================== -->
<!-- HEADER -->
<!-- ===================== -->
<header class="top-header">

    <div class="menu-icon"
         onclick="toggleMenu()">

        ☰

    </div>

    <div class="logo">

        <a href="/" style="text-decoration:none; color:inherit;">
            <h2>SysTec</h2>
        </a>

    </div>

    <div class="info">

        <span>📞 981 309 331</span>

        <span onclick="toggleCart()"
              style="cursor:pointer;">

            🛒

        </span>

        <div class="usuario-box">

            <span id="usuario-login"
                  style="cursor:pointer;">

                👤 Login

            </span>

            <div id="menu-usuario"
                 class="menu-usuario">

                <a href="#"
                   onclick="cerrarSesion()">

                    Cerrar sesión

                </a>

            </div>

        </div>

    </div>

</header>

<!-- ===================== -->
<!-- MENU CATEGORIAS -->
<!-- ===================== -->
<nav class="menu">

    <a href="/categoria?tipo=celular">
        Celulares 📱
    </a>

    <a href="/categoria?tipo=laptop">
        Laptops 💻
    </a>

    <a href="/categoria?tipo=computadora">
        Computadoras 🖥️
    </a>

    <a href="/categoria?tipo=impresora">
        Impresoras 🖨️
    </a>

</nav>

<!-- ===================== -->
<!-- TITULO -->
<!-- ===================== -->
<h1 style="text-align:center; margin-top:30px;">

<%= tipo.toUpperCase() %>

</h1>

<!-- ===================== -->
<!-- PRODUCTOS -->
<!-- ===================== -->
<div class="productos-vertical">

<%
for(Producto p : productos){

if(tipo.equals(p.getCategoria())){
%>

<div class="card">

    <img src="<%= p.getImagen() %>">

    <h3><%= p.getNombre() %></h3>

    <p>S/. <%= p.getPrecio() %></p>

    <button onclick="addToCart(
    '<%= p.getNombre().replace("'","") %>',
    '<%= p.getPrecio() %>'
    )">

        Añadir al carrito

    </button>

</div>

<%
}
}
%>

</div>

<!-- ===================== -->
<!-- SCRIPTS -->
<!-- ===================== -->

<script>

function toggleMenu(){

    var menu =
    document.getElementById("dropdown-menu");

    if(menu.style.display == "block"){

        menu.style.display = "none";

    }else{

        menu.style.display = "block";
    }
}

document.addEventListener("click",
function(event){

    var menu =
    document.getElementById("dropdown-menu");

    var icon =
    document.querySelector(".menu-icon");

    if(
        menu.style.display == "block"
        &&
        !menu.contains(event.target)
        &&
        !icon.contains(event.target)
    ){

        menu.style.display = "none";
    }

});

</script>

<script>

function toggleCart(){

    var cart =
    document.getElementById("cart");

    if(cart.style.right == "0px"){

        cart.style.right = "-300px";

    }else{

        cart.style.right = "0px";
    }
}

</script>

<script>

let cartList = [];

function addToCart(nombre, precio){

    var existe =
    cartList.find(
    p => p.nombre === nombre
    );

    if(existe){

        existe.cantidad++;

    }else{

        cartList.push({

            nombre:nombre,
            precio:precio,
            cantidad:1

        });
    }

    renderCart();
}

</script>

<script>

function renderCart(){

    var container =
    document.getElementById("cart-items");

    container.innerHTML = "";

    if(cartList.length == 0){

        container.innerHTML =
        "<p>No hay productos</p>";

        document.getElementById(
        "btn-pagar"
        ).style.display = "none";

        return;
    }

    document.getElementById(
    "btn-pagar"
    ).style.display = "block";

    for(let i=0; i<cartList.length; i++){

        var item = cartList[i];

        var div =
        document.createElement("div");

        var nombre =
        document.createElement("strong");

        nombre.textContent =
        item.nombre;

        var precio =
        document.createElement("p");

        var total =
        parseFloat(item.precio)
        *
        item.cantidad;

        precio.textContent =
        "S/. " + total.toFixed(2);

        var cantidad =
        document.createElement("p");

        cantidad.textContent =
        "Cantidad: " + item.cantidad;

        var btnMas =
        document.createElement("button");

        btnMas.textContent = "+";

        btnMas.onclick =
        function(){
            aumentar(i);
        };

        var btnMenos =
        document.createElement("button");

        btnMenos.textContent = "-";

        btnMenos.onclick =
        function(){
            disminuir(i);
        };

        var btnEliminar =
        document.createElement("button");

        btnEliminar.textContent = "🗑️";

        btnEliminar.onclick =
        function(){
            eliminar(i);
        };

        var acciones =
        document.createElement("div");

        acciones.className =
        "acciones";

        acciones.appendChild(btnMenos);
        acciones.appendChild(btnMas);
        acciones.appendChild(btnEliminar);

        div.appendChild(nombre);
        div.appendChild(precio);
        div.appendChild(cantidad);
        div.appendChild(acciones);

        container.appendChild(div);
    }
}

</script>

<script>

function aumentar(index){

    cartList[index].cantidad++;

    renderCart();
}

function disminuir(index){

    if(cartList[index].cantidad > 1){

        cartList[index].cantidad--;
    }

    renderCart();
}

function eliminar(index){

    cartList.splice(index,1);

    renderCart();
}

</script>

<script>

function pagar(){

    let usuario =
    localStorage.getItem(
    "usuarioLogueado"
    );

    if(usuario == null){

        alert("Debes iniciar sesión");

        window.location.href =
        "/login";

    }else{

        window.location.href =
        "/pago";
    }
}

</script>

<script>

window.onload = function(){

    let usuario =
    localStorage.getItem(
    "usuarioLogueado"
    );

    let span =
    document.getElementById(
    "usuario-login"
    );

    if(usuario){

        span.innerHTML =
        "👤 " + usuario;

        span.onclick =
        function(e){

            e.stopPropagation();

            let menu =
            document.getElementById(
            "menu-usuario"
            );

            if(menu.style.display
            == "block"){

                menu.style.display =
                "none";

            }else{

                menu.style.display =
                "block";
            }
        };

    }else{

        span.innerHTML =
        "👤 Login";

        span.onclick =
        function(){

            window.location.href =
            "/login";
        };
    }
};

function cerrarSesion(){

    localStorage.removeItem(
    "usuarioLogueado"
    );

    localStorage.removeItem(
    "rol"
    );

    window.location.href="/";
}

</script>

</body>
</html>