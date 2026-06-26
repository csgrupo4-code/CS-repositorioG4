package com.tec.usuario;

import java.util.List;

public interface UsuarioClienteService {

    List<UsuarioCliente> listar();
    UsuarioCliente buscar(int id);
    void actualizar(UsuarioCliente usuario);
    UsuarioCliente buscarPorUsuario(String usuario);

}