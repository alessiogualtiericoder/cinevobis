<?php
require_once("connection.php");
require_once("userObj.php");

$errore = '';
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
    $ruolo     = $_POST['ruolo'] ?? 2;              // Ruolo dovrebbe essere scelto via DB e non dal FORM

    if (!$username || !$password || !$nome || !$cognome || !$email) {
        $errore = "Compila tutti i campi obbligatori";
    } else {
        try {
            // DB, username, password, nome, cognome, indirizzo, città, cap, email, telefono, attivo, ruolo
            $user = new userObj($conn, $username, $password, $nome, $cognome, $indirizzo, $citta, $cap, $email, $telefono, $attivo, $ruolo);
            $user->create();

            $messaggio = "Registrazione completata <a href='index.php'>Vai al login</a>";
        } catch (PDOException $e) {
            $errore = "Errore: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head><title>Registrazione</title></head>
<body>
    <h1>Registrazione</h1>
    <?php if ($errore)   echo "<p style='color:red'>" . htmlspecialchars($errore) . "</p>"; ?>
    <?php if ($messaggio) echo "<p style='color:green'>" . htmlspecialchars($messaggio) . "</p>"; ?>

    <form action="" method="POST">
        Username:  <input type="text"     name="username"  required><br><br>
        Password:  <input type="password" name="password"  required><br><br>
        Nome:      <input type="text"     name="nome"      required><br><br>
        Cognome:   <input type="text"     name="cognome"   required><br><br>
        Indirizzo: <input type="text"     name="indirizzo"><br><br>
        Città:     <input type="text"     name="citta"><br><br>
        CAP:       <input type="text"     name="cap"       maxlength="10"><br><br>
        Email:     <input type="email"    name="email"     required><br><br>
        Telefono:  <input type="tel"      name="telefono"  maxlength="20"><br><br>
        Ruolo:
        <select name="ruolo">
            <option value="1">Amministratore</option>
            <option value="2">Utente</option>
            <option value="3">Ospite</option>
        </select><br><br>
        Attivo:    
        <input type="radio"    name="attivo"    value="1"> Si
        <input type="radio"    name="attivo"    value="0"> No
        <br><br>
        <button type="submit">Registrati</button>
        <p>Già registrato? <a href="index.php">Login</a></p>
    </form>
</body>
</html>