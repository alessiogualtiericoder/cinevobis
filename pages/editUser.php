<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once(__DIR__ . '/../config/connection.php');
require_once(__DIR__ . '/../includes/userObj.php');

$username = $_POST['username'] ?? '';

if (!$username) {
    header("Location: adminArea.php");
    exit();
}

$errore    = '';
$messaggio = '';

if (isset($_POST['indietro'])) {
    header("Location: sessionArea.php");
    exit();
}

if (isset($_POST['salva'])) {
    $nome      = trim($_POST['nome']      ?? '');
    $cognome   = trim($_POST['cognome']   ?? '');
    $indirizzo = trim($_POST['indirizzo'] ?? '');
    $citta     = trim($_POST['citta']     ?? '');
    $cap       = trim($_POST['cap']       ?? '');
    $email     = trim($_POST['email']     ?? '');
    $telefono  = trim($_POST['telefono']  ?? '');
    $attivo    = $_POST['attivo'] ?? 0;

    if (!$nome || !$cognome || !$email) {
        $errore = "Nome, cognome ed email sono obbligatori";
    } else {
        try {
            $userUpdate = new userObj(
                $conn,
                $username,
                null,
                $nome,
                $cognome,
                $indirizzo,
                $citta,
                $cap,
                $email,
                $telefono,
                $attivo
            );

            $userUpdate->update($username);
            $messaggio = "Utente aggiornato";

        } catch (PDOException $e) {
            $errore = "Errore: " . $e->getMessage();
        }
    }
}

$user   = new userObj($conn, $username);
$utente = $user->findByUsername();

if (!$utente) {
    header("Location: adminArea.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica utente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <?php require_once(__DIR__ . '/../includes/header.php'); ?>

    <div class="container d-flex justify-content-center align-items-start flex-grow-1 py-5">
        <div class="card shadow-sm border-0 p-4" style="width: 100%; max-width: 640px;">
            <div class="card-body">

                <h4 class="fw-bold mb-4">Modifica utente</h4>

                <?php if ($errore): ?>
                    <div class="alert alert-danger py-2" role="alert">
                        <?= htmlspecialchars($errore) ?>
                    </div>
                <?php endif; ?>

                <?php if ($messaggio): ?>
                    <div class="alert alert-success py-2" role="alert">
                        <?= htmlspecialchars($messaggio) ?>
                    </div>
                <?php endif; ?>

                <form method="POST">
                    <input type="hidden" name="username" value="<?= htmlspecialchars($username) ?>">

                    <div class="row g-3">

                        <!-- Username (full width, disabilitato) -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Username</label>
                            <input type="text" class="form-control" value="<?= htmlspecialchars($utente['username']) ?>" disabled>
                        </div>

                        <!-- Nome | Cognome -->
                        <div class="col-6">
                            <label class="form-label fw-semibold">Nome</label>
                            <input type="text" name="nome" class="form-control" value="<?= htmlspecialchars($utente['nome']) ?>" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Cognome</label>
                            <input type="text" name="cognome" class="form-control" value="<?= htmlspecialchars($utente['cognome']) ?>" required>
                        </div>

                        <!-- Email | Telefono -->
                        <div class="col-6">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" class="form-control" value="<?= htmlspecialchars($utente['email']) ?>" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Telefono</label>
                            <input type="tel" name="telefono" class="form-control" value="<?= htmlspecialchars($utente['telefono']) ?>" maxlength="20">
                        </div>

                        <!-- Indirizzo (full width) -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Indirizzo</label>
                            <input type="text" name="indirizzo" class="form-control" value="<?= htmlspecialchars($utente['indirizzo']) ?>">
                        </div>

                        <!-- Città | CAP -->
                        <div class="col-8">
                            <label class="form-label fw-semibold">Città</label>
                            <input type="text" name="citta" class="form-control" value="<?= htmlspecialchars($utente['citta']) ?>">
                        </div>
                        <div class="col-4">
                            <label class="form-label fw-semibold">CAP</label>
                            <input type="text" name="cap" class="form-control" value="<?= htmlspecialchars($utente['cap']) ?>" maxlength="10">
                        </div>

                        <!-- Attivo -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Attivo</label>
                            <div class="d-flex gap-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="attivo" id="attivoSi" value="1" <?= $utente['attivo'] == 1 ? 'checked' : '' ?>>
                                    <label class="form-check-label" for="attivoSi">Sì</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="attivo" id="attivoNo" value="0" <?= $utente['attivo'] == 0 ? 'checked' : '' ?>>
                                    <label class="form-check-label" for="attivoNo">No</label>
                                </div>
                            </div>
                        </div>

                        <!-- Bottoni -->
                        <div class="col-12 d-flex gap-2 mt-2">
                            <button type="submit" name="salva" class="btn btn-primary">Salva modifiche</button>
                            <button type="submit" name="indietro" class="btn btn-secondary">Indietro</button>
                        </div>

                    </div>
                </form>

            </div>
        </div>
    </div>

    <?php require_once(__DIR__ . '/../includes/footer.php'); ?>

</body>
</html>