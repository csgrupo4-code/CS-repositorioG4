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
    public String categoria(Integer tipo, Model model){

        ProductoService service = new ProductoServiceImpl();

        List<Producto> lista = service.listar();
        List<Producto> filtrados = new ArrayList<>();

        if(tipo != null){
            for(Producto p : lista){
                if(p.getCategoriaId() == tipo){
                    filtrados.add(p);
                }
            }
        } else {
            filtrados = lista; // muestra todo si no hay filtro
        }

        String nombreCategoria = "Todas";

        if(tipo != null){
            if(tipo == 4) nombreCategoria = "Celulares";
            if(tipo == 1) nombreCategoria = "Laptops";
            if(tipo == 3) nombreCategoria = "Computadoras";
            if(tipo == 2) nombreCategoria = "Impresoras";
        }

        model.addAttribute("productos", filtrados);
        model.addAttribute("nombreCategoria", nombreCategoria);

        return "categoria";
    }
}