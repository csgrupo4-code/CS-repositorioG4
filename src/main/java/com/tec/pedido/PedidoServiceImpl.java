package com.tec.pedido;

import java.util.*;

public class PedidoServiceImpl implements PedidoService {

    private static List<Pedido> lista = new ArrayList<>();
    private static int contador = 1;



    public List<Pedido> listar(){
        return lista;
    }

    public void agregar(Pedido p){
        lista.add(p);
    }

    public Pedido buscar(int id){
        for(Pedido p : lista){
            if(p.getId() == id){
                return p;
            }
        }
        return null;
    }

    public void actualizarEstado(int id, String estado){
        for(Pedido p : lista){
            if(p.getId() == id){
                p.setEstado(estado);
            }
        }
    }

    public void eliminar(int id){
        lista.removeIf(p -> p.getId() == id);
    }
}