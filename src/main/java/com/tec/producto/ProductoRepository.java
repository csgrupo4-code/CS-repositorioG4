package com.tec.producto;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProductoRepository extends JpaRepository< Producto, Integer> {

    List<Producto> findByActivoTrue();
    List<Producto> findTop4ByCategoriaId(Integer id);
    List<Producto> findByCategoriaIdAndActivoTrue(Integer categoriaId);
}


