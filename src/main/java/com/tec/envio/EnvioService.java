package com.tec.envio;

import java.util.List;

public interface EnvioService {

    List<Envio> listar();

    Envio buscar(Integer id);

    void actualizarEstado(Integer id, String estado);

}