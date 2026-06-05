package com.tec.controlador;

import com.tec.categoria.Categoria;
import com.tec.categoria.CategoriaService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice
public class GlobalController {

    @Autowired
    private CategoriaService service;

    @ModelAttribute("categorias")
    public List<Categoria> cargarCategorias(){

        return service.listar();

    }

}
