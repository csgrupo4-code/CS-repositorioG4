package com.tec.categoria;

import jakarta.persistence.*;

@Entity
public class Categoria {

    @Id
    @GeneratedValue(
            strategy =
                    GenerationType.IDENTITY
    )
    private Integer id;

    private String nombre;

    public Categoria(){}

    public Categoria(
            Integer id,
            String nombre
    ){

        this.id = id;
        this.nombre = nombre;

    }

    public Integer getId() {

        return id;

    }

    public void setId(Integer id) {

        this.id = id;

    }

    public String getNombre() {

        return nombre;

    }

    public void setNombre(String nombre) {

        this.nombre = nombre;

    }
}