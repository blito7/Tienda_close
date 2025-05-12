<?php
session_start();
$carrito = $_SESSION['carrito'] ?? [];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi carrito - Close Sports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #0A1F2E; color: white;">

<div class="container mt-5">
    <h1>🛒 Carrito de compras</h1>
    <table class="table table-dark table-striped mt-3">
        <thead>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $total = 0;
        foreach($carrito as $item) {
            $subtotal = $item['precio'] * $item['cantidad'];
            $total += $subtotal;
            echo "<tr>
                <td>{$item['nombre']}</td>
                <td>\${$item['precio']}</td>
                <td>{$item['cantidad']}</td>
                <td>\$$subtotal</td>
            </tr>";
        }
        ?>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3">Total a pagar</th>
                <th>$<?= $total ?></th>
            </tr>
        </tfoot>
    </table>
</div>

</body>
</html>
