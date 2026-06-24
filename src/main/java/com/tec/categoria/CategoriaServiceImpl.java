package com.tec.categoria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tec.producto.ProductoRepository;

import java.util.List;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    @Autowired
    private CategoriaRepository repository;

    @Autowired
    private ProductoRepository productoRepository;

    @Override
    public List<Categoria> listar(){

        return repository.findByActivoTrue();

    }

    @Override
    public void agregar(Categoria c){

        Categoria existente =
                repository.findByNombre(c.getNombre());

        if(existente != null){

            throw new RuntimeException(
                    "La categoría ya existe."
            );
        }
        repository.save(c);
    }

    @Override
    public Categoria buscar(int id){

        return repository
                .findById(id)
                .orElse(null);

    }

    @Override
    public void actualizar(Categoria c){

        repository.save(c);

    }

    @Override
    public void eliminar(int id){

        Categoria categoria = repository.findById(id).orElse(null);

        if(categoria != null){
            categoria.setActivo(false);
            repository.save(categoria);
        }
    }
}