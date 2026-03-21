<?php
require_once(__DIR__ . '/../config/connection.php');
require_once(__DIR__ . '/../includes/userObj.php');

$errore    = '';
$messaggio = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username  = trim($_POST['username']  ?? '');
    $password  = trim($_POST['password']  ?? '');
    $nome      = trim($_POST['nome']      ?? '');
    $cognome   = trim($_POST['cognome']   ?? '');
    $indirizzo = trim($_POST['indirizzo'] ?? '');
    $email     = trim($_POST['email']     ?? '');
    $telefono  = trim($_POST['telefono']  ?? '');
    $attivo    = $_POST['attivo'] ?? 1;
    $citta     = trim($_POST['citta']     ?? '');
    $cap       = trim($_POST['cap']       ?? '');
    $ruolo     = 2;

    if (!$username || !$password || !$nome || !$cognome || !$email) {
        $errore = "Compila tutti i campi obbligatori";
    } else {
        try {
            $user = new userObj($conn, $username, $password, $nome, $cognome, $indirizzo, $citta, $cap, $email, $telefono, $attivo, $ruolo);
            $user->create();
            $messaggio = "Registrazione completata";
        } catch (PDOException $e) {
            $errore = "Errore: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <div class="container d-flex justify-content-center align-items-center flex-grow-1 py-5 min-vh-100">
        <div class="card shadow-sm border-0 p-4" style="width: 100%; max-width: 640px;">
            <div class="card-body">

                <h4 class="fw-bold mb-2">Crea un account</h4>
                <p class="text-muted small mb-4">Compila i campi per registrarti</p>

                <?php if ($errore): ?>
                    <div class="alert alert-danger py-2" role="alert">
                        <?= htmlspecialchars($errore) ?>
                    </div>
                <?php endif; ?>

                <?php if ($messaggio): ?>
                    <div class="alert alert-success py-2" role="alert">
                        <?= htmlspecialchars($messaggio) ?>
                        — <a href="login.php" class="alert-link">Vai al login</a>
                    </div>
                <?php endif; ?>

                <form method="POST">
                    <div class="row g-3">

                        <div class="col-6">
                            <label class="form-label fw-semibold">Username</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label fw-semibold">Nome</label>
                            <input type="text" name="nome" class="form-control" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Cognome</label>
                            <input type="text" name="cognome" class="form-control" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="esempio@mail.it" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Telefono</label>
                            <input type="tel" name="telefono" class="form-control" maxlength="20">
                        </div>

                        <div class="col-12">
                            <label class="form-label fw-semibold">Indirizzo</label>
                            <input type="text" name="indirizzo" class="form-control">
                        </div>
                        <div class="col-8">
                            <label class="form-label fw-semibold">Città</label>
                            <input type="text" name="citta" class="form-control">
                        </div>
                        <div class="col-4">
                            <label class="form-label fw-semibold">CAP</label>
                            <input type="text" name="cap" class="form-control" maxlength="10">
                        </div>

                        <div class="col-12 mt-5">
                            <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">Crea Account</button>
                        </div>

                    </div>
                </form>

                <div class="text-center mt-4">
                    <p class="text-muted small mb-0">
                        Già registrato? <a href="login.php" class="text-decoration-none fw-bold">Esegui il Login</a>
                    </p>
                </div>

            </div>
        </div>
    </div>

</body>
</html>