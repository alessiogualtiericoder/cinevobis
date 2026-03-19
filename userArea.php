<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once("connection.php");
require_once("userObj.php");

?>

<!DOCTYPE html>
<html lang="it">
<head>
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area utente</title>
</head>
<body>
    <?php require_once("header.php"); ?>

    <h1>Ciao <?= htmlspecialchars($_SESSION['username']) ?></h1>

    <?php require_once("footer.php"); ?>
</body>
</html>