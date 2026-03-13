<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once("connection.php");
require_once("userObj.php");

$username = $_SESSION["username"] ?? null;

if (!$username) {
    header("Location: index.php");
    exit();
}

$user   = new userObj($conn, $username);
$utenti = $user->readAll();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area riservata</title>
</head>
<body>
    <h1>Benvenuto <?php echo htmlspecialchars($username); ?></h1>

    <p style="font-size: 20px;"><b>Tabella utenti</b></p>
    <table border="1" cellpadding="5">
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
            <th>Azioni</th>
        </tr>

        <?php foreach ($utenti as $utente): ?>
            <tr>
                <td><?= htmlspecialchars($utente['username'])  ?></td>
                <td><?= htmlspecialchars($utente['nome'])      ?></td>
                <td><?= htmlspecialchars($utente['cognome'])   ?></td>
                <td><?= htmlspecialchars($utente['indirizzo']) ?></td>
                <td><?= htmlspecialchars($utente['citta'])     ?></td>
                <td><?= htmlspecialchars($utente['cap'])       ?></td>
                <td><?= htmlspecialchars($utente['email'])     ?></td>
                <td><?= htmlspecialchars($utente['telefono'])  ?></td>
                <td><?= htmlspecialchars($utente['attivo'])    ?></td>
                <td>
                    <form method="POST" action="editUser.php">
                        <input type="hidden" name="username" value="<?= htmlspecialchars($utente['username']) ?>">
                        <button type="submit">Modifica</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>

    <br>

    <?php
    $sessioni = $user->readAccess();

    echo '<p style="font-size: 20px;"><b>Tabella sessioni</b></p>';
    echo "<table border='1' cellpadding='5'>";
    echo "<tr>
            <th>Username</th>
            <th>Data Login</th>
            <th>Data Logout</th>
          </tr>";

    foreach ($sessioni as $sessione) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($sessione['username'])   . "</td>";
        echo "<td>" . htmlspecialchars($sessione['dataLogin'])  . "</td>";
        echo "<td>" . htmlspecialchars($sessione['dataLogout']) . "</td>";
        echo "</tr>";
    }

    echo "</table>";
    ?>

    <br><br>
    <a href="logout.php">Logout</a>
</body>
</html>