package com.tec.producto;

import com.tec.categoria.Categoria;
import com.tec.categoria.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductoController {

    @Autowired
    private ProductoService service;

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/producto/lista")
    public String lista(Model model) {

        model.addAttribute("productos", service.listar());
        return "producto-lista";
    }

    @GetMapping("/producto/editar")
    public String editar(
            int id,
            Model model
    ){

        model.addAttribute("producto", service.buscar(id));
        model.addAttribute("categorias", categoriaService.listar());
        return "producto-editar";
    }

    @PostMapping("/producto/guardarEdicion")
    public String guardar(
            int id,
            String nombre,
            Double precio,
            String imagen,
            int categoriaId,
            Model model
    ){

        if(precio <= 0){

            Categoria categoria = categoriaService.buscar(categoriaId);
            Producto viejo = service.buscar(id);
            Producto producto = new Producto(
                            id,
                            nombre,
                            precio,
                            imagen,
                            viejo.getDestacado(),
                            viejo.getActivo(),
                            categoria
                    );

            model.addAttribute("error", "El precio debe ser mayor a 0");
            model.addAttribute("producto", producto);
            model.addAttribute("categorias", categoriaService.listar());
            return "producto-editar";
        }

        Categoria categoria = categoriaService.buscar(categoriaId);
        Producto viejo = service.buscar(id);

        Producto p = new Producto(
                id,
                nombre,
                precio,
                imagen,
                viejo.getDestacado(),
                viejo.getActivo(),
                categoria
        );

        service.editar(p);
        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/nuevo")
    public String nuevo(Model model){

        model.addAttribute("categorias", categoriaService.listar());
        return "producto-nuevo";
    }

    @GetMapping("/producto/desactivar")
    public String desactivar(int id){

        Producto producto = service.buscar(id);
        producto.setActivo(false);
        service.editar(producto);
        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/activar")
    public String activar(int id){

        Producto producto = service.buscar(id);
        producto.setActivo(true);
        service.editar(producto);
        return "redirect:/producto/lista";
    }

    @PostMapping("/producto/guardarNuevo")
    public String guardarNuevo(
            String nombre,
            Double precio,
            String imagen,
            int categoriaId,
            Model model
    ){

        if(precio <= 0){

            model.addAttribute("error", "El precio debe ser mayor a 0");
            model.addAttribute("categorias", categoriaService.listar());
            return "producto-nuevo";

        }

        Categoria categoria = categoriaService.buscar(categoriaId);

        Producto p = new Producto(
                null,
                nombre,
                precio,
                imagen,
                false,
                true,
                categoria
        );

        service.agregar(p);
        return "redirect:/producto/lista";
    }

}