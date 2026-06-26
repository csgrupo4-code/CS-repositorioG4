package com.tec.usuario;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UsuarioClienteController {

    @Autowired
    private UsuarioClienteService service;

    // ==========================
    // LISTAR USUARIOS
    // ==========================
    @GetMapping("/usuario/lista")
    public String lista(
            Model model,
            HttpSession session
    ){

        if(session.getAttribute("usuario") == null){
            return "redirect:/login";
        }

        if(!"admin".equals(session.getAttribute("rol"))){
            return "redirect:/";
        }

        model.addAttribute("usuarios", service.listar());
        return "usuarioAdmin";
    }

    // ==========================
    // EDITAR USUARIO
    // ==========================
    @GetMapping("/usuario/editar")
    public String editar(
            int id,
            Model model
    ){

        model.addAttribute("usuario", service.buscar(id));
        return "usuario-editar";
    }

    // ==========================
    // GUARDAR EDICIÓN
    // ==========================
    @PostMapping("/usuario/actualizar")
    public String actualizar(
            int id,
            String dni,
            String nombre,
            String telefono,
            String direccion,
            String usuario,
            String password,
            Model model
    ){

        // Buscar el usuario actual
        UsuarioCliente cliente = service.buscar(id);

        // Validar DNI
        if(dni == null || !dni.matches("\\d{8}")){

            model.addAttribute("error", "El DNI debe tener exactamente 8 dígitos.");
            model.addAttribute("usuario", cliente);
            return "usuario-editar";
        }

        // Validar teléfono
        if(telefono == null || !telefono.matches("\\d{9}")){

            model.addAttribute("error", "El teléfono debe tener exactamente 9 dígitos.");
            model.addAttribute("usuario", cliente);
            return "usuario-editar";
        }

        // Validar nombre
        if(nombre == null || nombre.trim().isEmpty()){

            model.addAttribute("error", "El nombre es obligatorio.");
            model.addAttribute("usuario", cliente);
            return "usuario-editar";
        }

        // Validar usuario
        if(usuario == null || usuario.trim().isEmpty()){

            model.addAttribute("error", "El nombre de usuario es obligatorio.");
            model.addAttribute("usuario", cliente);
            return "usuario-editar";
        }

        // Validar que el nombre de usuario no esté registrado por otro usuario
        UsuarioCliente existente = service.buscarPorUsuario(usuario);

        if(existente != null && !existente.getIdUsuario().equals(cliente.getIdUsuario())){

            model.addAttribute("error", "El nombre de usuario ya se encuentra registrado.");
            model.addAttribute("usuario", cliente);
            return "usuario-editar";
        }

        // Validar contraseña
        if(password == null || password.trim().isEmpty()){

            model.addAttribute("error", "La contraseña es obligatoria.");
            model.addAttribute("usuario", cliente);
            return "usuario-editar";
        }

        // Actualizar datos
        cliente.setDni(dni);
        cliente.setNombre(nombre);
        cliente.setTelefono(telefono);
        cliente.setDireccion(direccion);
        cliente.setUsuario(usuario);
        cliente.setPassword(password);

        service.actualizar(cliente);
        return "redirect:/usuario/lista";
    }

    // ==========================
    // DESACTIVAR
    // ==========================
    @GetMapping("/usuario/desactivar")
    public String desactivar(int id){

        UsuarioCliente cliente = service.buscar(id);
        cliente.setEstadoUsuario("Inactivo");
        service.actualizar(cliente);
        return "redirect:/usuario/lista";
    }

    // ==========================
    // ACTIVAR
    // ==========================
    @GetMapping("/usuario/activar")
    public String activar(int id){

        UsuarioCliente cliente = service.buscar(id);
        cliente.setEstadoUsuario("Activo");
        service.actualizar(cliente);
        return "redirect:/usuario/lista";
    }

}