<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once("connection.php");
require_once("userObj.php");

$errore = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);

    try {
        $user = new userObj($conn, $username, $password);
        $utente = $user->findByUsername();

        // Verifica l'hash della password inserita con l'hash della password salvata nel DB
        if ($utente && password_verify($password, $utente['password'])) {
            if ($utente['idProfilo'] == 1) {
                session_regenerate_id(true);

                $idSessione = session_id();
                $_SESSION['id_utente'] = $utente['id'];
                $_SESSION['username']  = $utente['username'];

                $user->createDataLogin(date('Y-m-d H:i:s'), $idSessione, $utente['id']);

                header("Location: privateArea.php");
                exit();
            } else {
                $errore = "Profilo non amministratore";
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
<head><title>Login</title></head>
<body>
    <h1>Login</h1>
    <?php if ($errore) echo "<p style='color:red'>" . htmlspecialchars($errore) . "</p>"; ?>

    <form method="POST">
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <button type="submit">Accedi</button>
        <p>Sei nuovo? <a href="registration.php">Registrati</a></p>
    </form>
</body>
</html>