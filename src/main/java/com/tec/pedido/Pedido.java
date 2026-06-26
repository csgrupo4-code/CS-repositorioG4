package com.tec.pedido;

import jakarta.persistence.*;
import jakarta.persistence.Transient;

@Entity
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPedido;
    private Integer idUsuario;
    private String dni;
    private String nombreCliente;
    private String fecha;
    private String estado;
    private String direccion;
    private double total;

    @Transient
    private String estadoEnvio;

    public Pedido() {
    }

    public Pedido(
            Integer idPedido,
            Integer idUsuario,
            String dni,
            String nombreCliente,
            String fecha,
            String estado,
            String direccion,
            double total
    ) {

        this.idPedido = idPedido;
        this.idUsuario = idUsuario;
        this.dni = dni;
        this.nombreCliente = nombreCliente;
        this.fecha = fecha;
        this.estado = estado;
        this.direccion = direccion;
        this.total = total;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstadoEnvio() {
        return estadoEnvio;
    }

    public void setEstadoEnvio(String estadoEnvio) {
        this.estadoEnvio = estadoEnvio;
    }
}