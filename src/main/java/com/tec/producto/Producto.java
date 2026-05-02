package com.tec.producto;

public class Producto {

    private int id;
    private String nombre;
    private String precio;
    private String imagen;
    private String categoria;
    private String destacado;

    public Producto(int id, String nombre, String precio,
                    String imagen, String categoria, String destacado) {

        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.categoria = categoria;
        this.destacado = destacado;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPrecio() {
        return precio;
    }

    public String getImagen() {
        return imagen;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getDestacado() {
        return destacado;
    }
}