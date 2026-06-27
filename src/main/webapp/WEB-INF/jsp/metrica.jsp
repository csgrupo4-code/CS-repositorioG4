<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <title>Dashboard de Métricas</title>
    <link rel="stylesheet" href="/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>

<%@ include file="/header.jsp" %>
<div class="admin-content">

    <h1>📈 Dashboard de Métricas</h1>

    <br>
    <h2>📦 Pedidos por Día</h2>

    <canvas
            id="graficoPedidos"
            width="800"
            height="350">
    </canvas>

    <br><br><br>

    <h2>💰 Ventas por Día</h2>

    <canvas
            id="graficoVentas"
            width="800"
            height="350">
    </canvas>

</div>

<script>

const etiquetasPedidos = [

<c:forEach items="${pedidosDia}" var="d">
"${d.key}",
</c:forEach>

];

const valoresPedidos = [

<c:forEach items="${pedidosDia}" var="d">
${d.value},
</c:forEach>

];

new Chart(
document.getElementById("graficoPedidos"),
{

type:"line",
data:{
labels: etiquetasPedidos,
datasets:[
{

label:"Pedidos por día",

data: valoresPedidos,
fill:false,
tension:0.3

}

]

},

options:{

responsive:true,
plugins:{
legend:{
display:true

}

},

scales:{

y:{

beginAtZero:true

}
}
}
}
);





const etiquetasVentas = [

<c:forEach items="${ventasDia}" var="d">
"${d.key}",
</c:forEach>

];

const valoresVentas = [

<c:forEach items="${ventasDia}" var="d">
${d.value},
</c:forEach>

];

new Chart(
document.getElementById("graficoVentas"),
{

type:"line",

data:{
labels: etiquetasVentas,
datasets:[
{

label:"Ventas por día",
data: valoresVentas,
fill:false,
tension:0.3

}

]

},

options:{

responsive:true,
plugins:{
legend:{
display:true
}

},

scales:{

y:{

beginAtZero:true,
ticks:{
callback:function(value){

return "S/. " + value;

}
}
}
}
}
}

);

</script>
</body>
</html>