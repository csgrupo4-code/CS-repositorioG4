package com.tec.envio;

import jakarta.persistence.*;

@Entity
public class Envio {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Integer idEnvio;
    private String estado;
    private Integer idPedido;
    private String observacion;
    private String fechaEntrega;

    public Envio() {
    }

    public Integer getIdEnvio() {
        return idEnvio;
    }

    public void setIdEnvio(Integer idEnvio) {
        this.idEnvio = idEnvio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public String getObservacion() {return observacion;}

    public void setObservacion(String observacion) {this.observacion = observacion;}

    public String getFechaEntrega() {return fechaEntrega;}

    public void setFechaEntrega(String fechaEntrega) {this.fechaEntrega = fechaEntrega;}
}