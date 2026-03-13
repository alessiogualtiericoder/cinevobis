<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once("connection.php");
require_once("userObj.php");

$username = $_POST['username'] ?? '';

if (!$username) {
    header("Location: privateArea.php");
    exit();
}

$errore  = '';
$messaggio = '';

if (isset($_POST['indietro'])) {
    header("Location: privateArea.php");
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
    $attivo    = ($_POST['attivo'] ?? 0);

    if (!$nome || !$cognome || !$email) {
        $errore = "Nome, cognome ed email sono obbligatori";
    } else {
        try {
            $userDaAggiornare = new userObj(
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

            $userDaAggiornare->update($username);
            $messaggio = "Utente aggiornato";

        } catch (PDOException $e) {
            $errore = "Errore: " . $e->getMessage();
        }
    }
}

$user = new userObj($conn, $username);
$utente = $user->findByUsername();

if (!$utente) {
    header("Location: privateArea.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica utente</title>
</head>
<body>
    <h1>Modifica utente: <?= htmlspecialchars($username) ?></h1>

    <?php if ($errore)    echo "<p style='color:red'>"   . htmlspecialchars($errore)    . "</p>"; ?>
    <?php if ($messaggio) echo "<p style='color:green'>" . htmlspecialchars($messaggio) . "</p>"; ?>

    <form method="POST">
        <input type="hidden" name="username" value="<?= htmlspecialchars($username) ?>">

        <label>Username:</label>
        <input type="text" value="<?= htmlspecialchars($utente['username']) ?>" disabled>
        <br><br>

        <label>Nome:</label>
        <input type="text" name="nome" value="<?= htmlspecialchars($utente['nome']) ?>" required>
        <br><br>

        <label>Cognome:</label>
        <input type="text" name="cognome" value="<?= htmlspecialchars($utente['cognome']) ?>" required>
        <br><br>

        <label>Indirizzo:</label>
        <input type="text" name="indirizzo" value="<?= htmlspecialchars($utente['indirizzo']) ?>">
        <br><br>

        <label>Città:</label>
        <input type="text" name="citta" value="<?= htmlspecialchars($utente['citta']) ?>">
        <br><br>

        <label>CAP:</label>
        <input type="text" name="cap" value="<?= htmlspecialchars($utente['cap']) ?>" maxlength="10">
        <br><br>

        <label>Email:</label>
        <input type="email" name="email" value="<?= htmlspecialchars($utente['email']) ?>" required>
        <br><br>

        <label>Telefono:</label>
        <input type="tel" name="telefono" value="<?= htmlspecialchars($utente['telefono']) ?>" maxlength="20">
        <br><br>

        <label>Attivo:</label>
        <input type="radio" name="attivo" value="1" <?= $utente['attivo'] == 1 ? 'checked' : '' ?>> Sì
        <input type="radio" name="attivo" value="0" <?= $utente['attivo'] == 0 ? 'checked' : '' ?>> No
        <br><br>

        <button type="submit" name="salva">Salva modifiche</button>
        <button type="submit" name="indietro">Indietro</button>
    </form>
</body>
</html>