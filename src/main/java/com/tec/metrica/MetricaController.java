package com.tec.metrica;

import com.tec.pedido.Pedido;
import com.tec.pedido.PedidoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class MetricaController {

    @Autowired
    private PedidoRepository repository;

    @GetMapping("/metrica/pedidos-dia")
    public String pedidosPorDia(Model model){

        List<Pedido> pedidos = repository.findAll();

        Map<String,Integer> datos = new TreeMap<>();

        for(Pedido p : pedidos){
            String fecha = p.getFecha();
            datos.put(fecha, datos.getOrDefault(fecha,0) + 1);
        }

        model.addAttribute("datos", datos);

        return "metrica-pedidos";
    }
}