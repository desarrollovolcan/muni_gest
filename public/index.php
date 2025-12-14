<?php
require __DIR__ . '/../vendor/autoload.php';

use App\Core\Config;
use App\Core\Router;
use App\Controllers\AuthController;
use App\Controllers\DashboardController;
use App\Controllers\HomeController;
use App\Controllers\PortalAuthController;
use App\Controllers\PortalDashboardController;
use App\Controllers\PortalBeneficiosController;

Config::load(dirname(__DIR__));

$router = new Router();

$authController = new AuthController();
$router->get('/login', fn() => $authController->loginForm());
$router->post('/login', fn() => $authController->login());
$router->get('/logout', fn() => $authController->logout());

$dashboard = new DashboardController();
$router->get('/dashboard', fn() => $dashboard->index());

$home = new HomeController();
$router->get('/inicio', fn() => $home->index());
$router->get('/', fn() => $authController->loginForm());

$portalAuth = new PortalAuthController();
$router->get('/portal/login', fn() => $portalAuth->loginForm());
$router->post('/portal/login', fn() => $portalAuth->login());
$router->get('/portal/logout', fn() => $portalAuth->logout());

$portalDash = new PortalDashboardController();
$router->get('/portal', fn() => $portalDash->index());

$portalBeneficios = new PortalBeneficiosController();
$router->get('/portal/beneficios', fn() => $portalBeneficios->index());
$router->get('/portal/beneficios/{id}', function() use ($portalBeneficios) {
    $id = intval(basename(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)));
    $portalBeneficios->show($id);
});

$router->dispatch($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI']);
