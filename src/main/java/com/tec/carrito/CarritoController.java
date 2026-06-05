package com.tec.carrito;

import com.tec.producto.Producto;
import com.tec.producto.ProductoService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CarritoController {

    @Autowired
    private ProductoService service;

    @GetMapping("/carrito")
    public String verCarrito(
            HttpSession session,
            Model model
    ) {

        List<ItemCarrito> carrito =
                (List<ItemCarrito>)
                        session.getAttribute("carrito");

        if(carrito == null){
            carrito = new ArrayList<>();
        }

        double total = 0;

        for(ItemCarrito item : carrito){

            total +=
                    item.getProducto()
                            .getPrecioFinal()
                            *
                            item.getCantidad();

        }

        model.addAttribute(
                "carrito",
                carrito
        );

        model.addAttribute(
                "total",
                total
        );

        return "carrito";
    }

    @GetMapping("/carrito/agregar")
    public String agregar(
            int id,
            HttpSession session
    ) {

        Producto p = service.buscar(id);

        if(p == null){
            return "redirect:/";
        }

        List<ItemCarrito> carrito =
                (List<ItemCarrito>)
                        session.getAttribute("carrito");

        if(carrito == null){
            carrito = new ArrayList<>();
        }

        boolean encontrado = false;

        for(ItemCarrito item : carrito){

            if(item.getProducto()
                    .getId()
                    .equals(id)){

                item.aumentar();

                encontrado = true;

                break;
            }
        }

        if(!encontrado){

            carrito.add(
                    new ItemCarrito(p)
            );

        }

        session.setAttribute(
                "carrito",
                carrito
        );

        return "redirect:/";
    }

    @GetMapping("/carrito/mas")
    public String mas(
            int index,
            HttpSession session
    ){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>)
                        session.getAttribute("carrito");

        carrito.get(index).aumentar();

        return "redirect:/carrito";
    }

    @GetMapping("/carrito/menos")
    public String menos(
            int index,
            HttpSession session
    ){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>)
                        session.getAttribute("carrito");

        carrito.get(index).disminuir();

        return "redirect:/carrito";
    }

    @GetMapping("/carrito/eliminar")
    public String eliminar(
            int index,
            HttpSession session
    ){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>)
                        session.getAttribute("carrito");

        carrito.remove(index);

        return "redirect:/carrito";
    }
}