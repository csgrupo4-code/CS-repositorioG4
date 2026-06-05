package com.tec.pedido;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Pedido {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Integer idPedido;
    private String dni;
    private String nombreCliente;
    private String fecha;
    private String estado;
    private String direccion;
    private double total;

    @OneToMany(
            cascade = CascadeType.ALL
    )
    private List<DetallePedido> detalles;

    public Pedido() {
    }

    public Pedido(
            Integer idPedido,
            String dni,
            String nombreCliente,
            String fecha,
            String estado,
            String direccion,
            double total,
            List<DetallePedido> detalles
    ) {

        this.idPedido = idPedido;
        this.dni = dni;
        this.nombreCliente = nombreCliente;
        this.fecha = fecha;
        this.estado = estado;
        this.direccion = direccion;
        this.total = total;
        this.detalles = detalles;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(
            Integer idPedido
    )
    {
        this.idPedido = idPedido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(
            String dni
    )
    {
        this.dni = dni;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(
            String nombreCliente
    )
    {
        this.nombreCliente = nombreCliente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(
            String fecha
    )
    {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(
            String estado
    )
    {
        this.estado = estado;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(
            String direccion
    )
    {
        this.direccion = direccion;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(
            double total
    )
    {
        this.total = total;
    }

    public List<DetallePedido> getDetalles() {
        return detalles;
    }

    public void setDetalles(
            List<DetallePedido> detalles
    )
    {
        this.detalles = detalles;
    }
}