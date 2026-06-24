package com.tec.controlador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;
import com.tec.producto.*;
import com.tec.categoria.Categoria;
import com.tec.categoria.CategoriaService;

@Controller
public class MainController {

    @Autowired
    private ProductoService service;

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/")
    public String inicio(Model model) {

        model.addAttribute("productos",service.listar());
        model.addAttribute("categorias", categoriaService.listar());

        return "main";
    }
    @GetMapping("/contacto")
    public String contacto() {

        return "contacto";

    }

    @GetMapping("/promociones")
    public String promociones(Model model) {

        model.addAttribute("productos", service.listar());

        return "promociones";
    }

    @GetMapping("/categoria")
    public String categoria(
            Integer tipo,
            Model model
    ) {

        List<Producto> lista = service.listar();
        List<Producto> filtrados = new ArrayList<>();

        if (tipo != null) {

            for (Producto p : lista) {

                if (
                        p.getCategoria().getId().equals(tipo)
                ) {
                    filtrados.add(p);
                }
            }

        } else {

            filtrados = lista;
        }

        String nombreCategoria = "Todas";

        if (tipo != null) {
            Categoria categoria = categoriaService.buscar(tipo);

            if (categoria != null) {
                nombreCategoria = categoria.getNombre();
            }
        }

        model.addAttribute("productos", filtrados);
        model.addAttribute("nombreCategoria", nombreCategoria);

        return "categoria";
    }
}