package com.tec.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;
import com.tec.producto.*;

@Controller
public class MainController {

    @GetMapping("/")
    public String inicio(Model model) {

        ProductoService service = new ProductoServiceImpl();

        model.addAttribute("productos", service.listar());

        return "main";

    }

    @GetMapping("/carrito")
    public String carrito() {
        return "carrito";
    }

    @GetMapping("/contacto")
    public String contacto() {
        return "contacto";
    }

    @GetMapping("/promociones")
    public String promociones(Model model) {

        ProductoService service = new ProductoServiceImpl();

        model.addAttribute("productos", service.listar());

        return "promociones";
    }

    @GetMapping("/categoria")
    public String categoria(String tipo, Model model){

        ProductoService service = new ProductoServiceImpl();

        model.addAttribute("productos", service.listar());

        model.addAttribute("tipo", tipo);

        return "categoria";
    }
}