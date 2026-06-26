package com.tec.usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioClienteServiceImpl implements UsuarioClienteService {

    @Autowired
    private UsuarioClienteRepository repository;

    @Override
    public List<UsuarioCliente> listar() {
        return repository.findAll();
    }

    @Override
    public UsuarioCliente buscar(int id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void actualizar(UsuarioCliente usuario) {
        repository.save(usuario);
    }

    @Override
    public UsuarioCliente buscarPorUsuario(String usuario){
        return repository.findByUsuario(usuario);
    }

}