package com.tec.usuario;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioClienteRepository extends JpaRepository<UsuarioCliente,Integer> {
    UsuarioCliente findByUsuarioAndPassword(
            String usuario,
            String password
    );

    UsuarioCliente findByUsuario(String usuario);

}
