package com.tec.producto;

import java.util.List;

public interface ProductoService {

    List<Producto> listar();

    void agregar(Producto p);

    Producto buscar(int id);

    void editar(Producto p);

    void eliminar(int id);

    List<Producto> listarPorCategoria(Integer id);

}
