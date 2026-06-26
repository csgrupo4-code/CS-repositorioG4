package com.tec.pedido;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PedidoServiceImpl implements PedidoService {

    @Autowired
    private PedidoRepository repository;

    @Override
    public List<Pedido> listar() {
        return repository.findAll();
    }

    @Override
    public Pedido agregar(Pedido p) {
        return repository.save(p);
    }

    @Override
    public Pedido buscar(int id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void actualizarEstado(int id, String estado) {

        Pedido pedido = buscar(id);

        if(pedido != null){pedido.setEstado(estado);
            repository.save(pedido);
        }
    }

    @Override
    public List<Pedido> buscarPorCliente(
            String nombreCliente
    ) {
        return repository.findByNombreCliente(
                nombreCliente
        );
    }
}