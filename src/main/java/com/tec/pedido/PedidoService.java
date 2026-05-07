package com.tec.pedido;

import java.util.List;

public interface PedidoService {

    List<Pedido> listar();

    void agregar(Pedido p);

    Pedido buscar(int id);

    void actualizarEstado(int id, String estado);

    void eliminar(int id);
}