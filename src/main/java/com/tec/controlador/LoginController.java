package com.tec.controlador;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    private List<String[]> usuarios = new ArrayList<>();

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String ingresar(String usuario,
                           String password,
                           HttpSession session) {

        if("admin".equals(usuario) && "123".equals(password)) {

            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", "admin");

            return "redirect:/admin";
        }

        for(String[] u : usuarios){
            if(u[0].equals(usuario) && u[1].equals(password)){
                session.setAttribute("usuario", usuario);
                session.setAttribute("rol", "cliente");
                return "redirect:/";
            }
        }

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/registro")
    public String registro(){
        return "registro";
    }

    @PostMapping("/registro")
    public String guardar(String usuario, String password){

        usuarios.add(new String[]{usuario, password});

        return "redirect:/login";
    }
}