package com.tec.pedido;

public class Pedido {

    private int id;
    private String dni;
    private String nombreCliente;
    private String producto;
    private int cantidad;
    private String fecha;
    private String estado;
    private String direccion;

    public Pedido(int id, String dni, String nombreCliente,
                  String producto, int cantidad,
                  String fecha, String estado, String direccion) {

        this.id = id;
        this.dni = dni;
        this.nombreCliente = nombreCliente;
        this.producto = producto;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.estado = estado;
        this.direccion = direccion;
    }

    public int getId(){ return id; }
    public String getDni(){ return dni; }
    public String getNombreCliente(){ return nombreCliente; }
    public String getProducto(){ return producto; }
    public int getCantidad(){ return cantidad; }
    public String getFecha(){ return fecha; }
    public String getEstado(){ return estado; }
    public String getDireccion(){
        return direccion;
    }

    public void setEstado(String estado){
        this.estado = estado;
    }
}