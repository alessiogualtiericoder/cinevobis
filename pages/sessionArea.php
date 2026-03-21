<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once(__DIR__ . '/../config/connection.php');
require_once(__DIR__ . '/../includes/userObj.php');

$username = $_SESSION["username"] ?? '';

if (!$username) {
    header("Location: /index.php");
    exit();
}

$user     = new userObj($conn, $username);
$utenti   = $user->readAll();
$righe    = $_POST['righe'] ?? 5;
$sessioni = $user->readAccess($righe);
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area sessioni</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <?php require_once(__DIR__ . '/../includes/header.php'); ?>

    <div class="container mt-4 flex-grow-1">

        <p class="fs-5 fw-bold mb-3">Utenti registrati</p>
        <table class="table table-sm mb-5">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Indirizzo</th>
                    <th>Città</th>
                    <th>CAP</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Attivo</th>
                    <th>Modifica</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($utenti as $utente): ?>
                    <tr>
                        <td><?= htmlspecialchars($utente['username']) ?></td>
                        <td><?= htmlspecialchars($utente['nome']) ?></td>
                        <td><?= htmlspecialchars($utente['cognome']) ?></td>
                        <td><?= htmlspecialchars($utente['indirizzo']) ?></td>
                        <td><?= htmlspecialchars($utente['citta']) ?></td>
                        <td><?= htmlspecialchars($utente['cap']) ?></td>
                        <td><?= htmlspecialchars($utente['email']) ?></td>
                        <td><?= htmlspecialchars($utente['telefono']) ?></td>
                        <td><?= htmlspecialchars($utente['attivo']) ?></td>
                        <td>
                            <form method="POST" action="editUser.php">
                                <input type="hidden" name="username" value="<?= htmlspecialchars($utente['username']) ?>">
                                <button type="submit" class="btn btn-primary btn-sm">Modifica</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Sessioni -->
        <p class="fs-5 fw-bold mb-3">Sessioni registrate</p>

        <form action="" method="POST" class="d-flex align-items-center gap-2 mb-3">
            <label class="mb-0">Righe</label>
            <select name="righe" class="form-select form-select-sm w-auto">
                <option value="5"   <?= $righe == 5   ? 'selected' : '' ?>>5</option>
                <option value="10"  <?= $righe == 10  ? 'selected' : '' ?>>10</option>
                <option value="25"  <?= $righe == 25  ? 'selected' : '' ?>>25</option>
                <option value="50"  <?= $righe == 50  ? 'selected' : '' ?>>50</option>
                <option value="100" <?= $righe == 100 ? 'selected' : '' ?>>100</option>
            </select>
            <button type="submit" class="btn btn-primary btn-sm">Invia</button>
        </form>

        <table class="table table-sm mb-5">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Data Login</th>
                    <th>Data Logout</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($sessioni as $sessione): ?>
                    <tr>
                        <td><?= htmlspecialchars($sessione['username']) ?></td>
                        <td><?= htmlspecialchars($sessione['dataLogin']) ?></td>
                        <td><?= htmlspecialchars($sessione['dataLogout']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <?php require_once(__DIR__ . '/../includes/footer.php'); ?>

</body>
</html>