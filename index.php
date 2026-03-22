<?php
session_start();
date_default_timezone_set('Europe/Rome');
 
if (isset($_SESSION['username'])) {
    if ($_SESSION['id_profilo'] == 1) {
        header("Location: /pages/adminArea.php");
        exit();
    } else {
        header("Location: /pages/userArea.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevobis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-dark text-white"> 
    <?php require_once("includes/header.php"); ?>

    <main class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center py-5">
        
        <div class="text-center mb-5">
            <h1 class="display-1 fw-bolder text-gradient mb-3">
                Cinevobis
            </h1>
            <p class="lead fs-2 fw-light">Il cinema a portata di mano</p>
        </div>

        <div class="row g-4 w-100 justify-content-center">
            <div class="col-md-5 text-center p-4 rounded-4 bg-secondary bg-opacity-10 border border-secondary">
                <h2 class="h3 fw-bold">Tieni traccia</h2>
                <p class="text-secondary">Non dimenticare mai i film che hai visto o che vuoi vedere</p>
            </div>
            <div class="col-md-5 text-center p-4 rounded-4 bg-secondary bg-opacity-10 border border-secondary ms-md-3">
                <h2 class="h3 fw-bold">Esplora</h2>
                <p class="text-secondary">Scopri nuovi generi e trova il tuo prossimo film preferito</p>
            </div>
        </div>

        <div class="mt-5">
            <a href="/pages/discover.php" class="btn btn-primary btn-lg px-5 py-3 rounded-pill fw-bold">Scopri chi siamo</a>
        </div>

    </main>

    <?php require_once("includes/footer.php"); ?>
</body>
</html>