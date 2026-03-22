<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['logout'])) {
        header("Location: /pages/logout.php");
        exit();
    }
    if (isset($_POST['login'])) {
        header("Location: /pages/login.php");
        exit();
    }
    if (isset($_POST['signup'])) {
        header("Location: /pages/signup.php");
        exit();
    }
    if (isset($_POST['profile'])) {
        header("Location: /pages/profile.php");
        exit();
    }
}

$currentPage = basename($_SERVER['SCRIPT_NAME']);
?>

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a href="/index.php" class="navbar-brand text-decoration-none">Cinevobis</a>

        <form method="POST" class="d-flex gap-2">
            <?php if ($currentPage === 'index.php' AND isset($_SESSION['username'])): ?>
                <button class="btn btn-primary" name="profile">Profile</button>
            <?php endif; ?>

            <?php if (in_array($currentPage, ['sessionArea.php', 'addFilmArea.php', 'editUser.php', 'profile.php', 'adminArea.php', 'userArea.php'])): ?>
                <button class="btn btn-primary" name="profile">Profile</button>
            <?php endif; ?>

            <?php if ($currentPage === 'index.php'): ?>
                <button class="btn btn-secondary" name="login">Login</button>
                <button class="btn btn-primary" name="signup">Sign up</button>
            <?php endif; ?>
        </form>
    </div>
</nav>