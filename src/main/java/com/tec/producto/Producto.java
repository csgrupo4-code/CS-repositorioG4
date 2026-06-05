package com.tec.producto;

import com.tec.categoria.Categoria;

import jakarta.persistence.*;

@Entity
public class Producto {

    @Id
    @GeneratedValue(
            strategy =
                    GenerationType.IDENTITY
    )
    private Integer id;

    private String nombre;

    private Double precio;

    private String imagen;

    private Boolean destacado;

    private Boolean activo;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private Categoria categoria;

    public Producto(){}

    public Producto(
            Integer id,
            String nombre,
            Double precio,
            String imagen,
            Boolean destacado,
            Boolean activo,
            Categoria categoria
    ){

        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.destacado = destacado;
        this.activo = activo;
        this.categoria = categoria;

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

    public Double getPrecio() {

        return precio;

    }

    public void setPrecio(Double precio) {

        this.precio = precio;

    }

    public String getImagen() {

        return imagen;

    }

    public void setImagen(String imagen) {

        this.imagen = imagen;

    }

    public Boolean getDestacado() {

        return destacado;

    }

    public void setDestacado(
            Boolean destacado
    ) {

        this.destacado = destacado;

    }

    public Boolean getActivo() {

        return activo;

    }

    public void setActivo(
            Boolean activo
    ) {

        this.activo = activo;

    }

    public Categoria getCategoria() {

        return categoria;

    }

    public void setCategoria(
            Categoria categoria
    ) {

        this.categoria = categoria;

    }

    public double getPrecioFinal(){

        if(Boolean.TRUE.equals(destacado)){

            return precio * 0.85;

        }

        return precio;
    }
}