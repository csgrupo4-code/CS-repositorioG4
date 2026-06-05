package com.tec.categoria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    @Autowired
    private CategoriaRepository repository;

    @Override
    public List<Categoria> listar(){

        return repository.findAll();

    }

    @Override
    public void agregar(Categoria c){

        Categoria existente =
                repository.findByNombre(
                        c.getNombre()
                );

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

        repository.deleteById(id);

    }
}