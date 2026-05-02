package com.tec.producto;

import java.util.List;

public interface ProductoService {

    List<Producto> listar();
    void eliminar(int id);
    Producto buscar(int id);
    void editar(Producto p);
    void agregar(Producto p);
}