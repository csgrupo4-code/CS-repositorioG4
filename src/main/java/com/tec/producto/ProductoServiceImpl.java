package com.tec.producto;

import java.util.List;

public class ProductoServiceImpl implements ProductoService {

    private ProductoDAO dao = new ProductoDAOImpl();
    @Override
    public List<Producto> listar() {

        ProductoDAO dao = new ProductoDAOImpl();

        return dao.listar();
    }

    public void eliminar(int id) {

        ProductoDAO dao = new ProductoDAOImpl();

        dao.eliminar(id);
    }

    public Producto buscar(int id){
        return dao.buscar(id);
    }

    public void editar(Producto p){
        dao.editar(p);
    }

    public void agregar(Producto p){
        dao.agregar(p);
    }
}