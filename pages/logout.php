<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once(__DIR__ . '/../config/connection.php');
require_once(__DIR__ . '/../includes/userObj.php');

if (!isset($_SESSION['username'])) {
    header("Location: /index.php");
    exit();
}

try {
    $idSessione = session_id();
    $username = $_SESSION['username'];

    $user = new userObj($conn, $username);
    $user->setDataLogout('dataLogout', date('Y-m-d H:i:s'), $idSessione);

    session_destroy();
    header("Location: /index.php");
    exit();
} catch (PDOException $e) { }
?>