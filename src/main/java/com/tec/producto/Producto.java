package com.tec.producto;

public class Producto {

    private int id;
    private String nombre;
    private String precio;
    private String imagen;
    private int categoriaId;
    private String destacado;

    public Producto(int id, String nombre, String precio,
                    String imagen, int categoriaId, String destacado) {

        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.categoriaId  = categoriaId;
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

    public int getCategoriaId() { return categoriaId; }

    public String getDestacado() {
        return destacado;
    }

    public double getPrecioFinal(){
        double precio = Double.parseDouble(this.precio);

        if("true".equals(this.destacado)){
            return precio * 0.85;
        }

        return precio;
    }
}