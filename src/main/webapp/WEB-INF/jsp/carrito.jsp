<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tec.carrito.ItemCarrito" %>

<html>
<head>
<title>Carrito</title>
<link rel="stylesheet" href="/styles.css">
</head>

<body>

<%@ include file="/header.jsp" %>



<%
List<ItemCarrito> carrito =
(List<ItemCarrito>) request.getAttribute("carrito");

double total = 0;
%>


<div class="carrito-layout">

    <!-- IZQUIERDA -->
    <div class="carrito-left">

        <h3 class="titulo">PRODUCTO</h3>

        <%
        if(carrito != null && !carrito.isEmpty()){

        for(int i=0;i<carrito.size();i++){

        ItemCarrito item = carrito.get(i);

        double precio = 0;
        try{
            precio = item.getProducto().getPrecioFinal();
        }catch(Exception e){}

        double subtotal = precio * item.getCantidad();
        total += subtotal;
        %>

        <div class="carrito-item">

            <img src="<%= item.getProducto().getImagen() %>" class="item-img">

            <div class="item-info">
                <p class="nombre"><%= item.getProducto().getNombre() %></p>

                <p class="precio">
                    S/. <%= item.getProducto().getPrecioFinal() %>
                </p>

                <div class="cantidad-box">
                    <a href="/carrito/menos?index=<%= i %>">-</a>
                    <span><%= item.getCantidad() %></span>
                    <a href="/carrito/mas?index=<%= i %>">+</a>
                </div>
            </div>

            <div class="item-total">
                S/. <%= subtotal %>
                <a href="/carrito/eliminar?index=<%= i %>" class="eliminar">🗑</a>
            </div>

        </div>

        <%
        }

        }else{
        %>

        <p>No hay productos en el carrito</p>

        <%
        }
        %>
    </div>

    <!-- DERECHA -->
    <div class="carrito-right">

        <h4>TOTAL DEL CARRITO</h4>

        <div class="total-box">
            <span>Estimated total</span>
            <strong>S/ <%= total %></strong>
        </div>

        <a href="/pago" class="btn-pagar">
            Proceder al Pago
        </a>

    </div>

</div>

</body>


</html>