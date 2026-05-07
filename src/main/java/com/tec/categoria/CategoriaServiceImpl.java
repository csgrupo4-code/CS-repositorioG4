package com.tec.categoria;

import java.util.*;

public class CategoriaServiceImpl implements CategoriaService {

    private static List<Categoria> lista = new ArrayList<>();
    private static int contador = 1;

    static {

        lista.add(new Categoria(contador++, "Laptop"));
        lista.add(new Categoria(contador++, "Impresoras"));
        lista.add(new Categoria(contador++, "Computadoras"));
        lista.add(new Categoria(contador++, "Celulares"));

    }

    @Override
    public List<Categoria> listar() {
        return lista;
    }

    @Override
    public void agregar(Categoria c) {
        c = new Categoria(contador++, c.getNombre());
        lista.add(c);
    }

    @Override
    public void eliminar(int id) {
        lista.removeIf(c -> c.getId() == id);
    }

    @Override
    public Categoria buscar(int id) {
        for(Categoria c : lista){
            if(c.getId() == id) return c;
        }
        return null;
    }

    @Override
    public void actualizar(Categoria c) {
        for(Categoria cat : lista){
            if(cat.getId() == c.getId()){
                cat.setNombre(c.getNombre());
            }
        }
    }
}