<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover - Cinevobis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <?php require_once(__DIR__ . '/../../includes/header.php'); ?>

    <main class="container flex-grow-1 py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm border-0 p-4 p-md-5 text-center">
                    <h1 class="display-5 fw-bold mb-4">La missione</h1>
                    
                    <p class="lead text-secondary mb-5">
                        Cinevobis nasce con l'obiettivo di creare uno spazio digitale dove ogni cinefilo possa sentirsi a casa.
                    </p>

                    <div class="row g-4 text-start mt-2">   
                        <h3 class="h3 fw-bold text-dark">La tua cineteca virtuale</h3>
                        <p class="text-muted">Vogliamo offrirti gli strumenti migliori per catalogare i film che hai visto, quelli che hai amato e quelli che non vedi l'ora di guardare, tutto è organizzato nel tuo profilo.</p>
                    </div>

                    <div class="row g-4 text-start mt-2">  
                        <h3 class="h3 fw-bold text-dark">Fai parte della community</h3>
                        <p class="text-muted mb-4">Il progetto è in continua evoluzione e il database verrà arrichito sempre da nuovi titoli. Inizia subito a tracciare la tua storia cinematografica!</p>
                        <a href="/actions/signup.php" class="btn btn-primary btn-lg px-4 rounded-pill">Crea un account gratuito</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <?php require_once(__DIR__ . '/../../includes/footer.php'); ?>
</body>
</html>