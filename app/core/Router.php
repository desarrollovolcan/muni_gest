<?php
namespace App\Core;

class Router
{
    private array $routes = [];

    public function get(string $path, callable $handler): void
    {
        $this->routes['GET'][$path] = $handler;
    }

    public function post(string $path, callable $handler): void
    {
        $this->routes['POST'][$path] = $handler;
    }

    public function dispatch(string $method, string $uri)
    {
        $path = parse_url($uri, PHP_URL_PATH);
        if (isset($this->routes[$method][$path])) {
            return call_user_func($this->routes[$method][$path]);
        }

        header('HTTP/1.0 404 Not Found');
        echo '404 Not Found';
        exit;
    }
}
