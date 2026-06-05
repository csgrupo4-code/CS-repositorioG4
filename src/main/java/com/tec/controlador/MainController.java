package com.tec.controlador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;
import com.tec.producto.*;

@Controller
public class MainController {

    @Autowired
    private ProductoService service;

    @GetMapping("/")
    public String inicio(Model model) {

        model.addAttribute(
                "productos",
                service.listar()
        );

        model.addAttribute(
                "celulares",
                service.listarPorCategoria(4)
        );

        model.addAttribute(
                "laptops",
                service.listarPorCategoria(1)
        );

        model.addAttribute(
                "computadoras",
                service.listarPorCategoria(3)
        );

        model.addAttribute(
                "impresoras",
                service.listarPorCategoria(2)
        );

        return "main";
    }

    @GetMapping("/contacto")
    public String contacto() {

        return "contacto";

    }

    @GetMapping("/promociones")
    public String promociones(Model model) {

        model.addAttribute(
                "productos",
                service.listar()
        );

        return "promociones";
    }

    @GetMapping("/categoria")
    public String categoria(
            Integer tipo,
            Model model
    ){

        List<Producto> lista =
                service.listar();

        List<Producto> filtrados =
                new ArrayList<>();

        if(tipo != null){

            for(Producto p : lista){

                if(
                        p.getCategoria()
                                .getId() == tipo
                ){

                    filtrados.add(p);

                }
            }

        } else {

            filtrados = lista;

        }

        String nombreCategoria =
                "Todas";

        if(tipo != null){

            if(tipo == 4)
                nombreCategoria =
                        "Celulares";

            if(tipo == 1)
                nombreCategoria =
                        "Laptops";

            if(tipo == 3)
                nombreCategoria =
                        "Computadoras";

            if(tipo == 2)
                nombreCategoria =
                        "Impresoras";
        }

        model.addAttribute(
                "productos",
                filtrados
        );

        model.addAttribute(
                "nombreCategoria",
                nombreCategoria
        );

        return "categoria";
    }
}