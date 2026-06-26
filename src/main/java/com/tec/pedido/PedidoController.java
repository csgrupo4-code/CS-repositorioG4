package com.tec.pedido;

import com.tec.producto.Producto;
import com.tec.producto.ProductoRepository;
import com.tec.usuario.UsuarioCliente;
import com.tec.usuario.UsuarioClienteRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;
import com.tec.envio.Envio;
import com.tec.envio.EnvioRepository;
import com.tec.carrito.ItemCarrito;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping("/pedido")
public class PedidoController {

    @Autowired
    private EnvioRepository envioRepository;

    @Autowired
    private PedidoService service;

    @Autowired
    private UsuarioClienteRepository usuarioRepository;

    @Autowired
    private DetallePedidoRepository detalleRepository;

    @Autowired
    private ProductoRepository productoRepository;
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

    @GetMapping("/detalle")
    public String detallePedido(
            int id,
            Model model,
            HttpSession session){

        if(session.getAttribute("usuario") == null){
            return "redirect:/login";
        }

        Pedido pedido = service.buscar(id);

        List<DetallePedido> detalles = detalleRepository.findByIdPedido(id);

        for(DetallePedido d : detalles){

            Producto producto = productoRepository.findById(d.getIdProducto()).orElse(null);

            if(producto != null){

                d.setNombreProducto(
                        producto.getNombre()
                );
            }
        }

        model.addAttribute("pedido", pedido);
        model.addAttribute("detalles", detalles);

        return "detalle-pedido-admin";
    }

    // =========================
    // CREAR PEDIDO DESDE PAGO
    // =========================

    @PostMapping("/crear")

    public String crearPedido(
            String dni,
            String direccion,
            String numeroTarjeta,
            String fechaVencimiento,
            String cvv,
            HttpSession session){

        if(numeroTarjeta.length() != 16){
            return "redirect:/pago?error=tarjeta";
        }

        if(cvv.length() != 3){
            return "redirect:/pago?error=cvv";
        }

        List<ItemCarrito> carrito = (List<ItemCarrito>) session.getAttribute("carrito");

        if(carrito == null || carrito.isEmpty()){
            return "redirect:/carrito";
        }

        String usuario = (String) session.getAttribute("usuario");
        UsuarioCliente cliente = usuarioRepository.findByUsuario(usuario);
        Integer idUsuario = cliente.getIdUsuario();
        List<DetallePedido> detalles = new ArrayList<>();

        double total = 0;

        for(ItemCarrito item : carrito){

            double subtotal = item.getCantidad() * item.getProducto().getPrecioFinal();

            DetallePedido detalle = new DetallePedido(
                            item.getProducto().getId(),
                            item.getCantidad(),
                            item.getProducto().getPrecioFinal(),
                            subtotal
                    );

            detalles.add(detalle);
            total += subtotal;
        }

        String fecha = LocalDate.now().toString();

        Pedido pedido = new Pedido(
                null,
                idUsuario,
                dni,
                usuario,
                fecha,
                "Facturado",
                direccion,
                total
        );

        pedido = service.agregar(pedido);

        for(DetallePedido d : detalles){

            d.setIdPedido(pedido.getIdPedido());

            detalleRepository.save(d);
        }

        Envio envio = new Envio();

        envio.setIdPedido(pedido.getIdPedido());
        envio.setEstado("Preparando");

        envioRepository.save(envio);

        session.removeAttribute("carrito");

        return "redirect:/";
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

        List<Pedido> pedidos = service.buscarPorCliente(usuario);

        for(Pedido p : pedidos){

            Envio envio = envioRepository.findByIdPedido(p.getIdPedido());

            if(envio != null){
                p.setEstadoEnvio(envio.getEstado());
            }
        }

        model.addAttribute("pedidos", pedidos);

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

    @PostMapping("/cancelar")
    public String cancelar(int id){

        Envio envio = envioRepository.findByIdPedido(id);

        if(envio == null){
            return "redirect:/pedido/mis-pedidos";
        }

        if(!"Preparando".equals(envio.getEstado())){
            return "redirect:/pedido/mis-pedidos?error=noCancelar";
        }

        service.actualizarEstado(id,"Cancelado");

        envio.setEstado("Cancelado");

        envioRepository.save(envio);

        return "redirect:/pedido/mis-pedidos";
    }

}

