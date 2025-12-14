# Muni Gestor de Beneficios

Proyecto PHP 8.2 con patrón MVC para gestionar beneficios municipales y portal de beneficiarios.

## Requisitos
- PHP 8.2+
- MySQL 8
- Composer
- Apache con mod_rewrite

## Instalación
1. Clonar repositorio.
2. Ejecutar `composer install` para cargar dependencias (dotenv, phpmailer).
3. Copiar `.env.example` a `.env` y ajustar credenciales.
4. Importar base de datos: `mysql -u usuario -p < database/schema.sql` y luego `database/seed.sql`.
5. Configurar virtual host apuntando a `public/`.

## Usuarios demo
- Intranet: admin@demo.cl / Admin@1234
- Portal beneficiario: 12345678-5 / Clave@1234

## Worker de notificaciones
```
php cli/send_notifications.php
```

## Estructura principal
- `app/core`: núcleo MVC, router, DB, seguridad.
- `app/controllers`: controladores de módulos.
- `app/models`: modelos PDO con soft-delete.
- `app/views`: vistas integradas con plantilla `tema/`.
- `public`: front-controller y .htaccess.
- `storage/uploads`: archivos cargados.

## Base de datos
Esquema y catálogos en `database/schema.sql` y `database/seed.sql`.
