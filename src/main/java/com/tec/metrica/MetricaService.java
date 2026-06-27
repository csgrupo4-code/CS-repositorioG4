package com.tec.metrica;

import java.util.Map;

public interface MetricaService {

    Map<String,Integer> obtenerPedidosPorDia();

    Map<String,Double> obtenerVentasPorDia();

}