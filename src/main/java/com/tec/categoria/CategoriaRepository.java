package com.tec.categoria;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoriaRepository extends JpaRepository< Categoria, Integer> {

    Categoria findByNombre(String nombre);
    List<Categoria> findByActivoTrue();
}