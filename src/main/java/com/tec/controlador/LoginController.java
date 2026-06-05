package com.tec.controlador;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import com.tec.usuario.UsuarioCliente;
import com.tec.usuario.UsuarioClienteRepository;


@Controller
public class LoginController {

    @Autowired
    private UsuarioClienteRepository repository;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String ingresar(String usuario,
                           String password,
                           HttpSession session) {

        if("admin".equals(usuario) && "123".equals(password)) {

            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", "admin");

            return "redirect:/admin";
        }

        UsuarioCliente cliente = repository.findByUsuarioAndPassword(usuario, password);

        if(cliente != null && "Activo".equals(cliente.getEstadoUsuario())){

            session.setAttribute("usuario", cliente.getUsuario());
            session.setAttribute("nombre", cliente.getNombre());
            session.setAttribute( "rol", "cliente");

            return "redirect:/";
        }

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/registro")
    public String registro(){
        return "registro";
    }

    @PostMapping("/registro")
    public String guardar(
            String nombre,
            String telefono,
            String direccion,
            String usuario,
            String password
    ){

        UsuarioCliente cliente = new UsuarioCliente();

        cliente.setNombre(nombre);
        cliente.setTelefono(telefono);
        cliente.setDireccion(direccion);
        cliente.setUsuario(usuario);
        cliente.setPassword(password);
        cliente.setEstadoUsuario("Activo");

        repository.save(cliente);

        return "redirect:/login";
    }
}