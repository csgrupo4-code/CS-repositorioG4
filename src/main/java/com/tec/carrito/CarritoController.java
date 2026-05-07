package com.tec.carrito;

import com.tec.producto.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class CarritoController {

    @GetMapping("/carrito")
    public String verCarrito(HttpSession session, Model model) {

        List<ItemCarrito> carrito =
                (List<ItemCarrito>) session.getAttribute("carrito");

        if(carrito == null){
            carrito = new ArrayList<>();
        }

        model.addAttribute("carrito", carrito);

        return "carrito";
    }

    @GetMapping("/carrito/agregar")
    public String agregar(int id, HttpSession session) {

        ProductoService service = new ProductoServiceImpl();
        Producto p = service.buscar(id);

        List<ItemCarrito> carrito =
                (List<ItemCarrito>) session.getAttribute("carrito");

        if(carrito == null){
            carrito = new ArrayList<>();
        }

        boolean encontrado = false;

        for(ItemCarrito item : carrito){
            if(item.getProducto().getId() == id){
                item.aumentar();
                encontrado = true;
                break;
            }
        }

        if(!encontrado){
            carrito.add(new ItemCarrito(p));
        }

        session.setAttribute("carrito", carrito);

        return "redirect:/";
    }

    @GetMapping("/carrito/mas")
    public String mas(int index, HttpSession session){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>) session.getAttribute("carrito");

        carrito.get(index).aumentar();

        return "redirect:/carrito";
    }

    @GetMapping("/carrito/menos")
    public String menos(int index, HttpSession session){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>) session.getAttribute("carrito");

        carrito.get(index).disminuir();

        return "redirect:/carrito";
    }

    @GetMapping("/carrito/eliminar")
    public String eliminar(int index, HttpSession session){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>) session.getAttribute("carrito");

        carrito.remove(index);

        return "redirect:/carrito";
    }
}