package com.tec.pedido;

import java.util.List;

public interface PedidoService {

    List<Pedido> listar();

    Pedido agregar(Pedido p);

    Pedido buscar(int id);

    void actualizarEstado(int id, String estado);

    List<Pedido> buscarPorCliente(String nombreCliente);

}