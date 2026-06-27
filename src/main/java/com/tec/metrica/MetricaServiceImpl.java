package com.tec.metrica;

import com.tec.pedido.Pedido;
import com.tec.pedido.PedidoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MetricaServiceImpl implements MetricaService{

    @Autowired
    private PedidoRepository repository;

    @Override
    public Map<String,Integer> obtenerPedidosPorDia(){

        List<Pedido> pedidos = repository.findAll();

        Map<String,Integer> datos = new TreeMap<>();

        for(Pedido p : pedidos){

            String fecha = p.getFecha();

            datos.put(
                    fecha,
                    datos.getOrDefault(fecha,0)+1
            );

        }

        return datos;
    }

    @Override
    public Map<String,Double> obtenerVentasPorDia(){

        List<Object[]> datos =
                repository.ventasPorDia();

        Map<String,Double> resultado =
                new TreeMap<>();

        for(Object[] fila : datos){

            resultado.put(
                    fila[0].toString(),
                    ((Number)fila[1]).doubleValue()
            );

        }

        return resultado;
    }

}