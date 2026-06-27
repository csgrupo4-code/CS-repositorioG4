package com.tec.pedido;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PedidoRepository extends JpaRepository< Pedido, Integer> {

    List<Pedido> findByNombreCliente(
            String nombreCliente
    );

    @Query("""
SELECT p.fecha, SUM(p.total)
FROM Pedido p
GROUP BY p.fecha
ORDER BY p.fecha
""")
    List<Object[]> ventasPorDia();

    @Query("""
SELECT p.fecha, SUM(d.cantidad)
FROM Pedido p
JOIN DetallePedido d
ON p.idPedido = d.idPedido
GROUP BY p.fecha
ORDER BY p.fecha
""")
    List<Object[]> productosVendidosPorDia();

}

