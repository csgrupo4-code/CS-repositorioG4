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
        model.addAttribute("categorias", categoriaService.listarActivas());

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

        List<Producto> lista = service.listarActivos();
        List<Producto> filtrados = new ArrayList<>();

        String nombreCategoria = "Todas";

        if (tipo != null) {

            Categoria categoria = categoriaService.buscar(tipo);

            if (categoria == null || !categoria.getActivo()) {
                return "redirect:/";
            }

            nombreCategoria = categoria.getNombre();

            for (Producto p : lista) {

                if (p.getCategoria().getId().equals(tipo)) {
                    filtrados.add(p);
                }
            }

        } else {
            filtrados = lista;
        }

        model.addAttribute("productos", filtrados);
        model.addAttribute("nombreCategoria", nombreCategoria);
        model.addAttribute("categorias", categoriaService.listarActivas());

        return "categoria";
    }
}