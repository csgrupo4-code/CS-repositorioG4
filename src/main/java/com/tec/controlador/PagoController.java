package com.tec.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;

@Controller
public class PagoController {

    @GetMapping("/pago")
    public String pago(HttpSession session){

        String usuario = (String) session.getAttribute("usuario");

        if(usuario == null){
            return "redirect:/login";
        }

        return "pago";
    }
}
