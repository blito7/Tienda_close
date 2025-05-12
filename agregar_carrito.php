<?php
session_start();

$id = $_GET['id']; // id del producto

// Simulamos productos (en realidad esto debería venir de base de datos o array)
$productos = [
    1 => ['nombre' => 'Zapatillas Nike Air Max', 'precio' => 45000],
    2 => ['nombre' => 'Remera Adidas', 'precio' => 25000],
    // Agregá más productos acá
];

// Validamos si existe ese producto
if(isset($productos[$id])) {
    if(!isset($_SESSION['carrito'])) {
        $_SESSION['carrito'] = [];
    }

    // Si ya está en el carrito, sumamos cantidad
    if(isset($_SESSION['carrito'][$id])) {
        $_SESSION['carrito'][$id]['cantidad']++;
    } else {
        $_SESSION['carrito'][$id] = [
            'nombre' => $productos[$id]['nombre'],
            'precio' => $productos[$id]['precio'],
            'cantidad' => 1
        ];
    }
}

// Redireccionamos de nuevo a la tienda
header('Location: index.php');
exit();
