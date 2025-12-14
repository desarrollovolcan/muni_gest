<!doctype html>
<html lang="es">
<head>
    <?php include __DIR__ . '/../../../tema/src/partials/title-meta.php'; ?>
    <?php include __DIR__ . '/../../../tema/src/partials/head-css.php'; ?>
</head>
<body class="bg-light">
<div class="account-pages my-5 pt-5">
    <div class="container">
        <?= $content ?? '' ?>
    </div>
</div>
<?php include __DIR__ . '/../../../tema/src/partials/footer-scripts.php'; ?>
</body>
</html>
