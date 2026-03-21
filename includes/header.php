<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['logout'])) {
        header("Location: /pages/logout.php");
        exit();
    }
    if (isset($_POST['login'])) {
        header("Location: /pages/login.php");
        exit();
    }
    if (isset($_POST['registration'])) {
        header("Location: /pages/registration.php");
        exit();
    }
}

$currentPage = basename($_SERVER['SCRIPT_NAME']);
?>

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <span class="navbar-brand">
            Benvenuto
            <?php 
            if (isset($_SESSION['username'])) {
                echo htmlspecialchars($_SESSION['username']);
            }
            ?>
        </span>

        <form method="POST" class="d-flex gap-2">
            <?php 
            if ($currentPage == 'adminArea.php' || $currentPage == 'userArea.php' || 
                $currentPage == 'sessionArea.php' || $currentPage == 'addFilmArea.php') {
                echo "<button class='btn btn-danger' name='logout'>Logout</button>";
            }
            
            if ($currentPage == 'index.php') {
                echo "<button class='btn btn-primary' name='login'>Login</button>";
                echo "<button class='btn btn-secondary' name='registration'>Registrati</button>";
            }
            ?>
        </form>
    </div>
</nav>