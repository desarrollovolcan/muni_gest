# Muni Gestor de Beneficios

Proyecto PHP 8.2 con patrón MVC para gestionar beneficios municipales y portal de beneficiarios.

## Requisitos
- PHP 8.2+
- MySQL 8 (compatible con MariaDB 10.4+)
- Composer
- Apache con mod_rewrite

## Instalación
1. Clonar repositorio.
2. Ejecutar `composer install` para cargar dependencias (dotenv, phpmailer).
3. Copiar `.env.example` a `.env` y ajustar credenciales.
4. Importar la base de datos provista en `database/schema.sql` (estructura completa enviada) y luego ejecutar `database/seed.sql` para datos demo:
   ```bash
   mysql -u usuario -p < database/schema.sql
   mysql -u usuario -p < database/seed.sql
   ```
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
Se incluye el esquema completo en `database/schema.sql` (coincide con el dump entregado) y datos iniciales en `database/seed.sql`.
