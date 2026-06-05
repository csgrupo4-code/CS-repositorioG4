package com.tec.carrito;

import com.tec.producto.Producto;

public class ItemCarrito {

    private Producto producto;
    private int cantidad;

    public ItemCarrito(Producto producto) { this.producto = producto; this.cantidad = 1; }

    public Producto getProducto() { return producto; }

    public int getCantidad() { return cantidad; }

    public void aumentar() { cantidad++; }

    public void disminuir() { if(cantidad > 1) cantidad--; }

    public double getSubtotal(){ return producto.getPrecioFinal() * cantidad; }
}