package com.tec.categoria;

import com.tec.categoria.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {

    private CategoriaService service = new CategoriaServiceImpl();

    @GetMapping("/lista")
    public String listar(Model model, HttpSession session){

        if(session.getAttribute("usuario") == null){
            return "redirect:/login";
        }

        if(!"admin".equals(session.getAttribute("rol"))){
            return "redirect:/";
        }

        model.addAttribute("categorias", service.listar());

        return "categoriaAdmin";
    }

    @GetMapping("/nuevo")
    public String nuevo(){
        return "formCategoria";
    }

    @PostMapping("/guardar")
    public String guardar(String nombre){
        service.agregar(new Categoria(0, nombre));
        return "redirect:/categoria/lista";
    }

    @GetMapping("/eliminar")
    public String eliminar(int id){
        service.eliminar(id);
        return "redirect:/categoria/lista";
    }

    @GetMapping("/editar")
    public String editar(int id, Model model){
        model.addAttribute("categoria", service.buscar(id));
        return "formCategoria";
    }

    @PostMapping("/actualizar")
    public String actualizar(int id, String nombre){
        service.actualizar(new Categoria(id, nombre));
        return "redirect:/categoria/lista";
    }

}