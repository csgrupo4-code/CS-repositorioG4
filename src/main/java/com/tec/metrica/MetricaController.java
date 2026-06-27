package com.tec.metrica;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MetricaController {

    @Autowired
    private MetricaService service;

    @GetMapping("/metrica")
    public String dashboard(Model model){

        model.addAttribute("pedidosDia", service.obtenerPedidosPorDia());
        model.addAttribute("ventasDia", service.obtenerVentasPorDia());
        return "metrica";
    }

}