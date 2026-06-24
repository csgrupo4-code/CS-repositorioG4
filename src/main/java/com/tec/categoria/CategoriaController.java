package com.tec.categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {

    @Autowired
    private CategoriaService service;

    @GetMapping("/lista")
    public String listar(
            Model model,
            HttpSession session
    ){

        if(session.getAttribute("usuario") == null){
            return "redirect:/login";
        }

        if(!"admin".equals(session.getAttribute("rol"))){
            return "redirect:/";
        }

        model.addAttribute("categorias", service.listar()
        );
        return "categoriaAdmin";
    }

    @GetMapping("/nuevo")
    public String nuevo(){
        return "formCategoria";
    }

    @PostMapping("/guardar")
    public String guardar(
            String nombre,
            Model model
    ){

        if(nombre == null || nombre.trim().isEmpty()){
            model.addAttribute(
                    "error",
                    "El nombre de la categoría es obligatorio."
            );

            return "formCategoria";
        }

        try{
            service.agregar(new Categoria(null, nombre.trim(), true)
            );

        }catch(Exception e){

            model.addAttribute("error", e.getMessage()
            );
            return "formCategoria";
        }

        return "redirect:/categoria/lista";
    }

    @GetMapping("/eliminar")
    public String eliminar(int id, Model model){

        try{
            service.eliminar(id);
        }catch(Exception e){

            model.addAttribute(
                    "error",
                    "No se puede eliminar la categoría porque tiene productos asociados."
            );

            model.addAttribute(
                    "categorias",
                    service.listar()
            );

            return "categoriaAdmin";
        }

        return "redirect:/categoria/lista";
    }

    @GetMapping("/editar")
    public String editar(int id, Model model){

        model.addAttribute("categoria", service.buscar(id));
        return "formCategoria";
    }

    @PostMapping("/actualizar")
    public String actualizar(int id, String nombre){

        Categoria categoria = service.buscar(id);
        categoria.setNombre(nombre);
        service.actualizar(categoria);

        return "redirect:/categoria/lista";
    }
}