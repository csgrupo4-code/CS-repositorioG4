package com.tec.envio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnvioServiceImpl
        implements EnvioService {

    @Autowired
    private EnvioRepository repository;

    @Override
    public List<Envio> listar() {
        return repository.findAll();
    }

    @Override
    public Envio buscar(Integer id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void actualizarEstado(
            Integer id,
            String estado
    ) {

        Envio envio = buscar(id);

        if(envio != null){
            envio.setEstado(estado);
            repository.save(envio);
        }
    }


}