package com.tec.envio;

import com.tec.pedido.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.tec.pedido.Pedido;

@Controller
@RequestMapping("/envio")
public class EnvioController {

    @Autowired
    private EnvioService service;
    @Autowired
    private EnvioRepository repository;
    @Autowired
    private PedidoService pedidoService;


    @GetMapping("/lista")
    public String listar(Model model) {

        model.addAttribute("envios", service.listar());

        return "envio-admin";
    }

    @GetMapping("/detalle")
    public String detalle(int id, Model model){

        Envio envio = repository.findByIdPedido(id);

        model.addAttribute("envio", envio);

        return "envio-detalle";
    }

    @PostMapping("/actualizar")
    public String actualizar(Integer id, String estado){

        Envio envio = repository.findById(id).orElse(null);

        if(envio == null){
            return "redirect:/envio/lista";
        }

        Pedido pedido = pedidoService.buscar(envio.getIdPedido());

        if("Cancelado".equals(pedido.getEstado()) || "Completado".equals(pedido.getEstado())){
            return "redirect:/envio/detalle?id=" + envio.getIdPedido();
        }

        service.actualizarEstado(id, estado);

        if("Entregado".equals(estado)){

            pedidoService.actualizarEstado(envio.getIdPedido(),"Completado");
        }

        return "redirect:/envio/detalle?id=" + envio.getIdPedido();
    }

}