package com.tec.categoria;

import java.util.List;

public interface CategoriaService {

    List<Categoria> listar();

    void agregar(Categoria c);

    void eliminar(int id);

    Categoria buscar(int id);

    void actualizar(Categoria c);
}