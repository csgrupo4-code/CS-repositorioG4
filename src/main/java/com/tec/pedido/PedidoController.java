package com.tec.pedido;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.ArrayList;

import com.tec.carrito.ItemCarrito;

@Controller
@RequestMapping("/pedido")
public class PedidoController {

    private PedidoService service = new PedidoServiceImpl();

    // =========================
    // ADMIN - VER TODOS LOS PEDIDOS
    // =========================
    @GetMapping("/lista")
    public String listar(Model model, HttpSession session){

        if(session.getAttribute("usuario") == null){
            return "redirect:/login";
        }

        if(!"admin".equals(session.getAttribute("rol"))){
            return "redirect:/";
        }

        model.addAttribute("pedidos", service.listar());

        return "pedido-admin";
    }

    // =========================
    // CREAR PEDIDO DESDE PAGO
    // =========================
    @PostMapping("/crear")
    public String crearPedido(
            String dni,
            String direccion,
            HttpSession session){

        List<ItemCarrito> carrito =
                (List<ItemCarrito>) session.getAttribute("carrito");

        if(carrito == null || carrito.isEmpty()){
            return "redirect:/carrito";
        }

        String usuario = (String) session.getAttribute("usuario");

        for(ItemCarrito item : carrito){

            Pedido p = new Pedido(
                    (int)(Math.random()*1000),
                    dni,
                    usuario, // 👈 CLAVE: usar usuario de sesión
                    item.getProducto().getNombre(),
                    item.getCantidad(),
                    "2026-05-05",
                    "Pendiente",
                    direccion
            );

            service.agregar(p);
        }

        session.removeAttribute("carrito");

        return "redirect:/"; // 👈 NO ir al admin
    }

    // =========================
    // CLIENTE - MIS PEDIDOS
    // =========================
    @GetMapping("/mis-pedidos")
    public String misPedidos(HttpSession session, Model model){

        String usuario = (String) session.getAttribute("usuario");

        if(usuario == null){
            return "redirect:/login";
        }

        List<Pedido> todos = service.listar();
        List<Pedido> propios = new ArrayList<>();

        for(Pedido p : todos){
            if(usuario.equals(p.getNombreCliente())){
                propios.add(p);
            }
        }

        model.addAttribute("pedidos", propios);

        return "pedido-cliente";
    }

    // =========================
    // ACTUALIZAR ESTADO (ADMIN)
    // =========================
    @PostMapping("/actualizar")
    public String actualizar(int id, String estado){

        service.actualizarEstado(id, estado);

        return "redirect:/pedido/lista";
    }

    // =========================
    // ELIMINAR PEDIDO (ADMIN)
    // =========================
    @GetMapping("/eliminar")
    public String eliminar(int id){

        service.eliminar(id);

        return "redirect:/pedido/lista";
    }
}