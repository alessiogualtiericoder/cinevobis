<?php
require_once(__DIR__ . '/../config/connection.php');
require_once(__DIR__ . '/../includes/userObj.php');

$errore    = '';
$messaggio = '';

$nazioni = [];
try {
    $stmt    = $conn->query("SELECT id_nazione, nome_nazione FROM nazioni ORDER BY nome_nazione");
    $nazioni = $stmt->fetchAll();
} catch (PDOException $e) {}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username   = trim($_POST['username']   ?? '');
    $password   = trim($_POST['password']   ?? '');
    $nome       = trim($_POST['nome']       ?? '');
    $cognome    = trim($_POST['cognome']    ?? '');
    $citta      = trim($_POST['citta']      ?? '');
    $email      = trim($_POST['email']      ?? '');
    $id_nazione = $_POST['id_nazione']      ?? null;
    $id_profilo = 2; // utente standard

    if (!$username || !$password || !$nome || !$cognome || !$email) {
        $errore = "Compila tutti i campi obbligatori";
    } else {
        try {
            // DB, username, password, nome, cognome, città, email, attivo, id_profilo, id_nazione, foto_profilo
            $user = new userObj($conn, $username, $password, $nome, $cognome, $citta, $email, 1, $id_profilo, $id_nazione ?: null);
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
<body>

    <?php require_once(__DIR__ . '/../includes/header.php'); ?>

    <div class="container flex-grow-1 d-flex justify-content-center align-items-start align-items-md-center py-4">
        <div class="card shadow-sm border-0 p-3 p-md-4" style="width: 100%; max-width: 640px;">
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
                            <label class="form-label fw-semibold">Username <span>*</span></label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Password <span>*</span></label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label fw-semibold">Nome <span>*</span></label>
                            <input type="text" name="nome" class="form-control" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Cognome <span>*</span></label>
                            <input type="text" name="cognome" class="form-control" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label fw-semibold">Email <span>*</span></label>
                            <input type="email" name="email" class="form-control" placeholder="esempio@mail.it" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Città</label>
                            <input type="text" name="citta" class="form-control">
                        </div>

                        <div class="col-12">
                            <label class="form-label fw-semibold">Nazione</label>
                            <select name="id_nazione" class="form-select">
                                <option value="">— Seleziona —</option>
                                <?php foreach ($nazioni as $n): ?>
                                    <option value="<?= (int)$n['id_nazione'] ?>">
                                        <?= htmlspecialchars($n['nome_nazione']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="text-center mt-4">
                            <input type="checkbox" required>
                            <label for="termini">Accetto l'Informativa sulla <a href="privacy.php" class="text-decoration-none fw-bold">
                                Privacy
                            </a> e i <a href="terms_of_service.php" class="text-decoration-none fw-bold">
                                Termini di servizio
                            </a> di Cinevobis</label>
                        </div>

                        <div class="col-12 mt-4">
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

    <?php require_once(__DIR__ . '/../includes/footer.php'); ?>

</body>
</html>