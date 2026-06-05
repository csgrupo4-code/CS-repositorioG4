package com.tec.pedido;

import jakarta.persistence.*;

@Entity
public class DetallePedido {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Integer idDetalle;

    private String producto;

    private int cantidad;

    private double precio;

    public DetallePedido() {
    }

    public DetallePedido(
            String producto,
            int cantidad,
            double precio
    ) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Integer getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(
            Integer idDetalle
    ) {
        this.idDetalle = idDetalle;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(
            String producto
    ) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(
            int cantidad
    ) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(
            double precio
    ) {
        this.precio = precio;
    }
}