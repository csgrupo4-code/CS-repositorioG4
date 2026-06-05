package com.tec.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;
import com.tec.carrito.ItemCarrito;
import java.util.List;

@Controller
public class PagoController {

    @GetMapping("/pago")
    public String pago(HttpSession session){

        String usuario =
                (String) session.getAttribute("usuario");

        if(usuario == null){
            return "redirect:/login";
        }

        List<ItemCarrito> carrito =
                (List<ItemCarrito>)
                        session.getAttribute("carrito");

        if(carrito == null ||
                carrito.isEmpty()){

            return "redirect:/carrito";
        }

        return "pago";
    }
}
