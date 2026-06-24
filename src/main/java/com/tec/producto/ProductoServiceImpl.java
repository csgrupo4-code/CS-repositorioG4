package com.tec.producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoRepository repository;

    @Override
    public List<Producto> listar(){

        return repository.findByActivoTrue();

    }

    @Override
    public void agregar(Producto p){

        p.setActivo(true);

        repository.save(p);

    }

    @Override
    public Producto buscar(int id){

        return repository.findById(id).orElse(null);

    }

    @Override
    public void editar(Producto p){

        repository.save(p);

    }

    @Override
    public void eliminar(int id){

        Producto producto =
                repository
                        .findById(id)
                        .orElse(null);

        if(producto != null){

            producto.setActivo(false);

            repository.save(producto);

        }
    }

    @Override
    public List<Producto> listarPorCategoria(Integer id)
    {
        return repository
                .findTop4ByCategoriaId(id);
    }


}