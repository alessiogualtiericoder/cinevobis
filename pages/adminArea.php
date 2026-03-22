<?php
session_start();
date_default_timezone_set('Europe/Rome');

$username   = $_SESSION['username']   ?? '';
$id_profilo = $_SESSION['id_profilo'] ?? 0;

if (!$username || $id_profilo != 1) {
    header("Location: /index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area amministratore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <?php require_once(__DIR__ . '/../includes/header.php'); ?>

    <main class="container flex-grow-1 d-flex flex-column justify-content-center py-5">

        <div class="row mb-5">
            <div class="col-12 text-center">
                <h1 class="fw-bold">Profilo Amministratore</h1>
                <p class="text-secondary">Gestisci i contenuti del sito da qui</p>
            </div>
        </div>

        <div class="row g-4 justify-content-center">

            <div class="col-md-5">
                <a href="addFilmArea.php" class="text-decoration-none h-100 d-block">
                    <div class="card border-0 shadow-sm text-center p-4 h-100">
                        <div class="card-body d-flex flex-column justify-content-center">
                            <div class="display-4 mb-3">🎬</div>
                            <h2 class="fw-bold mb-3 text-dark">Aggiungi film</h2>
                            <p class="text-muted mb-0">Carica un nuovo film nel sistema</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-5">
                <a href="sessionArea.php" class="text-decoration-none h-100 d-block">
                    <div class="card border-0 shadow-sm text-center p-4 h-100">
                        <div class="card-body d-flex flex-column justify-content-center">
                            <div class="display-4 mb-3">👥</div>
                            <h2 class="fw-bold mb-3 text-dark">Gestione sessioni</h2>
                            <p class="text-muted mb-0">Visualizza utenti e sessioni registrate</p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </main>

    <?php require_once(__DIR__ . '/../includes/footer.php'); ?>

</body>
</html>