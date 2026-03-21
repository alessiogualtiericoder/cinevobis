<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once(__DIR__ . '/../config/connection.php');
require_once(__DIR__ . '/../includes/userObj.php');

$errore = '';

if (isset($_POST['login'])) {
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);

    try {
        $user = new userObj($conn, $username, $password);
        $utente = $user->findByUsername();

        if ($utente && password_verify($password, $utente['password'])) {
            if ($utente['attivo'] != 0) {
                if ($utente['idProfilo'] == 1) {
                    session_regenerate_id(true);

                    $idSessione = session_id();
                    $_SESSION['id_utente'] = $utente['id'];
                    $_SESSION['username']  = $utente['username'];

                    $user->createDataLogin(date('Y-m-d H:i:s'), $idSessione, $utente['id']);

                    header("Location: adminArea.php");
                    exit();
                }

                if ($utente['idProfilo'] == 2) {
                    session_regenerate_id(true);

                    $idSessione = session_id();
                    $_SESSION['id_utente'] = $utente['id'];
                    $_SESSION['username']  = $utente['username'];

                    $user->createDataLogin(date('Y-m-d H:i:s'), $idSessione, $utente['id']);

                    header("Location: userArea.php");
                    exit();
                }
            } else {
                $errore = "Utente non attivo";
            }
        } else {
            $errore = "Dati non validi";
        }   
    } catch (PDOException $e) {
        $errore = "Errore: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../style.css">
</head>
<body class="bg-light">

    <div class="container vh-100 d-flex justify-content-center align-items-center">
        <div class="card shadow-sm border-0 p-4" style="max-width: 520px; width: 100%;">
            <div class="card-body">
                <h2 class="text-center mb-4 fw-bold text-primary">Login</h2>

                <?php if ($errore): ?>
                    <div class="alert alert-danger py-2 small text-center" role="alert">
                        <?= htmlspecialchars($errore) ?>
                    </div>
                <?php endif; ?>

                <form method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label small fw-semibold">Username</label>
                        <input type="text"
                               id="username"
                               name="username"
                               class="form-control"
                               placeholder="Inserisci username"
                               required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label small fw-semibold">Password</label>
                        <input type="password"
                               id="password"
                               name="password"
                               class="form-control"
                               placeholder="••••••••"
                               required>
                    </div>

                    <div class="d-grid gap-2 mt-4">
                        <button type="submit" name="login" class="btn btn-primary py-2">Accedi</button>
                    </div>
                </form>

                <div class="text-center mt-4">
                    <span class="text-muted small">Sei nuovo?</span>
                    <a href="registration.php" class="small text-decoration-none fw-bold">Registrati</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>