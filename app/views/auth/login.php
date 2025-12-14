<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card">
            <div class="card-body p-4">
                <h4 class="text-center">Intranet Municipal</h4>
                <?php include __DIR__ . '/../partials/flash.php'; ?>
                <form method="post" action="/login">
                    <?php include __DIR__ . '/../partials/csrf_field.php'; ?>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="d-grid">
                        <button class="btn btn-primary" type="submit">Ingresar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
