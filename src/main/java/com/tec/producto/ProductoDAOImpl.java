package com.tec.producto;

import java.util.*;

public class ProductoDAOImpl implements ProductoDAO {

    private static List<Producto> productos = new ArrayList<>();

    // CONSTRUCTOR
    public ProductoDAOImpl() {

        if(productos.isEmpty()) {

            // LAPTOPS
            productos.add(new Producto(
                    1,
                    "Asus Vivobook 15",
                    "2450.00",
                    "https://tiendastec.com/wp-content/uploads/2026/03/laptop-asus-vivobook-15-16gb-ram.webp",
                    "laptop",
                    "true"
            ));

            productos.add(new Producto(
                    2,
                    "Lenovo Ideapad Slim 3",
                    "2300.00",
                    "https://tiendastec.com/wp-content/uploads/2026/04/Laptop-Lenovo-IdeaPad-Slim-3-15IAH8-Intel-Core-i5-12450H-3.webp",
                    "laptop",
                    "true"
            ));

            productos.add(new Producto(
                    3,
                    "Asus Zenbook 14",
                    "4050.00",
                    "https://tiendastec.com/wp-content/uploads/2026/04/Laptop-Asus-Zenbook-AMD-Ryzen-5-8640HS.webp",
                    "laptop",
                    "false"
            ));

            productos.add(new Producto(
                    4,
                    "Laptop Asus Vivobook 15 Intel Core 3 100U",
                    "1690.00",
                    "https://tiendastec.com/wp-content/uploads/2026/04/Laptop-Asus-Vivobook-15-Intel-Core-3-100U.webp",
                    "laptop",
                    "false"
            ));

            // IMPRESORAS
            productos.add(new Producto(
                    5,
                    "Impresora Epson L3250",
                    "650.00",
                    "https://rymportatiles.com.pe/cdn/shop/files/Epson-Ecotank-L3210.png",
                    "impresora",
                    "true"
            ));

            productos.add(new Producto(
                    7,
                    "Impresora Epson L4360",
                    "900.00",
                    "https://media.falabella.com/falabellaPE/146437938_01/w=1500,h=1500,fit=cover",
                    "impresora",
                    "false"
            ));

            productos.add(new Producto(
                    8,
                    "Impresora Epson L5590",
                    "1050.00",
                    "https://tiendastec.com/wp-content/uploads/2026/01/EPSON-L5590.webp",
                    "impresora",
                    "false"
            ));

            productos.add(new Producto(
                    9,
                    "Impresora Epson L6370",
                    "1450.00",
                    "https://tiendastec.com/wp-content/uploads/2026/04/Impresora-Epson-L6370-EcoTank.webp",
                    "impresora",
                    "false"
            ));

            // CELULARES
            productos.add(new Producto(
                    10,
                    "iPhone 15 Pro Max",
                    "5500.00",
                    "https://comprarmag.com/wp-content/uploads/2024/08/f48308a8-e9c5-703f-b554-9b077972806b-1-1-1-1-1.webp",
                    "celular",
                    "false"
            ));

            productos.add(new Producto(
                    11,
                    "Celular Honor X5c PLUS | 4GB RAM | 256GB",
                    "550.00",
                    "https://tiendastec.com/wp-content/uploads/2026/01/HONOR-X5c-Verde.webp",
                    "celular",
                    "true"
            ));

            productos.add(new Producto(
                    12,
                    "Honor 400 Pro 512GB",
                    "3100.00",
                    "https://multicelperu.com/wp-content/uploads/2025/08/71Wr7UAQE0L._UF10001000_QL80_.jpg",
                    "celular",
                    "false"
            ));

            productos.add(new Producto(
                    13,
                    "Samsung S24 Ultra 5G",
                    "3500.00",
                    "https://www.lacuracao.pe/media/catalog/product/s/2/s24ul-256grey_1.png",
                    "celular",
                    "false"
            ));

            // COMPUTADORAS
            productos.add(new Producto(
                    14,
                    "Computadora Lenovo IdeaCenter",
                    "2850.00",
                    "https://tiendastec.com/wp-content/uploads/2026/03/Computadora-All-in-One-Lenovo-IdeaCenter-24ARR9.webp",
                    "computadora",
                    "false"
            ));

            productos.add(new Producto(
                    15,
                    "Computadora HP ProOne",
                    "2950.00",
                    "https://tiendastec.com/wp-content/uploads/2026/04/Computadora-All-in-One-HP-ProOne-240-G10-Intel-Core-Ultra-5-125U-600x600.webp",
                    "computadora",
                    "false"
            ));

            productos.add(new Producto(
                    16,
                    "Computadora AMD Ryzen 5",
                    "3000.00",
                    "https://tiendastec.com/wp-content/uploads/2026/02/Computadora-AMD-Ryzen-5-8600G-TEC.webp",
                    "computadora",
                    "false"
            ));

            productos.add(new Producto(
                    17,
                    "Computadora Intel Core Ultra 5",
                    "3500.00",
                    "https://tiendastec.com/wp-content/uploads/2026/02/Computadora-Intel-Core-Ultra-5-255-TEC-Nuevo.webp",
                    "computadora",
                    "false"
            ));
        }
    }

    @Override
    public List<Producto> listar() {
        return productos;
    }

    @Override
    public void eliminar(int id) {

        for(int i = 0; i < productos.size(); i++) {

            if(productos.get(i).getId() == id) {
                productos.remove(i);
                break;
            }
        }
    }

    public Producto buscar(int id){

        for(Producto p : productos){

            if(p.getId() == id){
                return p;
            }
        }

        return null;
    }

    public void editar(Producto nuevo){

        for(int i=0; i<productos.size(); i++){

            if(productos.get(i).getId() == nuevo.getId()){

                productos.set(i, nuevo);
                break;
            }
        }
    }

    public void agregar(Producto p){

        productos.add(p);
    }
}