package com.tec.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;
import com.tec.carrito.ItemCarrito;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import com.tec.usuario.UsuarioCliente;
import com.tec.usuario.UsuarioClienteRepository;

@Controller
public class PagoController {

    @Autowired
    private UsuarioClienteRepository repository;

    @GetMapping("/pago")
    public String pago(HttpSession session, Model model){

        String usuario = (String) session.getAttribute("usuario");

        if(usuario == null){
            return "redirect:/login";
        }

        List<ItemCarrito> carrito = (List<ItemCarrito>) session.getAttribute("carrito");

        if(carrito == null || carrito.isEmpty()){

            return "redirect:/carrito";
        }

        UsuarioCliente cliente = repository.findByUsuario(usuario);

        model.addAttribute("cliente", cliente);

        return "pago";
    }
}
