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
}