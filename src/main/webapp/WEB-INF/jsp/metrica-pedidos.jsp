<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <title>Métricas</title>

    <link rel="stylesheet" href="/styles.css">

    <script src="https://cdn.jsdelivr.net/npm/chart.js">
    </script>

</head>

<body>

<%@ include file="/header.jsp" %>

<div class="admin-content">

    <h1>📈 Pedidos por Día</h1>

    <canvas
            id="graficoPedidos"
            width="800"
            height="400">
    </canvas>

</div>

<script>

const etiquetas = [

<c:forEach items="${datos}" var="d">

"${d.key}",

</c:forEach>

];

const valores = [

<c:forEach items="${datos}" var="d">

${d.value},

</c:forEach>

];

new Chart(
    document.getElementById("graficoPedidos"),

    {
        type: "line",
        data: {
            labels: etiquetas,
            datasets: [
                {
                    label:"Pedidos por día",
                    data: valores,
                    fill: false,
                    tension: 0.3
                }
            ]
        },

        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true
                }
            },

            scales: {
                y: {
                    beginAtZero: true
                }

            }

        }

    }

);

</script>

</body>

</html>