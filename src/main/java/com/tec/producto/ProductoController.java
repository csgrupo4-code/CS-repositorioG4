package com.tec.producto;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductoController {

    @GetMapping("/producto/lista")
    public String lista(Model model) {

        ProductoService service = new ProductoServiceImpl();

        model.addAttribute("productos", service.listar());

        return "producto-lista";
    }

    @GetMapping("/producto/eliminar")
    public String eliminar(int id) {

        ProductoService service = new ProductoServiceImpl();

        service.eliminar(id);

        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/editar")
    public String editar(int id, Model model){

        ProductoService service = new ProductoServiceImpl();

        model.addAttribute("producto", service.buscar(id));

        return "producto-editar";
    }

    @PostMapping("/producto/guardarEdicion")
    public String guardar(
            int id,
            String nombre,
            String precio,
            String imagen,
            int categoriaId
    ){

        Producto p = new Producto(
                id,nombre,precio,imagen,categoriaId,"false"
        );

        ProductoService service = new ProductoServiceImpl();

        service.editar(p);

        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/nuevo")
    public String nuevo(){

        return "producto-nuevo";
    }

    @PostMapping("/producto/guardarNuevo")
    public String guardarNuevo(
            String nombre,
            String precio,
            String imagen,
            int categoriaId
    ){

        int id = (int)(Math.random()*1000);

        Producto p = new Producto(
                id,nombre,precio,imagen,categoriaId,"false"
        );

        ProductoService service = new ProductoServiceImpl();

        service.agregar(p);

        return "redirect:/producto/lista";
    }
}