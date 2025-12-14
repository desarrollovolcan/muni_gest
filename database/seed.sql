USE mun_beneficios;

INSERT INTO municipios (nombre, rut, email) VALUES ('Municipio Demo', '11111111-1', 'contacto@demo.cl');
INSERT INTO roles (nombre) VALUES ('Administrador'), ('AsistenteSocial'), ('Jefatura'), ('Finanzas');
INSERT INTO usuarios (id_municipio, nombre, email, password_hash) VALUES (1, 'Administrador', 'admin@demo.cl', '$2y$10$hJahtF81P5aFccC9D1TXmeC4AnmIgjDKGTeOitnkBC9rWlH0I1EAK');
INSERT INTO usuario_roles (id_usuario, id_rol) VALUES (1,1);
INSERT INTO beneficiarios (id_municipio, rut, nombre, fecha_nacimiento) VALUES (1, '12345678-5', 'Beneficiario Demo', '1990-01-01');
INSERT INTO beneficiario_cuentas (id_beneficiario, id_municipio, rut, email, password_hash) VALUES (1,1,'12345678-5','beneficiario@demo.cl','$2y$10$2YxHiF0A1JpMOaGHBHvNdel0DVpkl9ZtNRU9GvLKJx.nAsKUL5Jiu');
INSERT INTO beneficios (id_municipio, nombre, descripcion, id_estado) VALUES (1,'Beca Municipal','Apoyo económico',1);
INSERT INTO solicitudes (id_beneficiario, id_municipio, id_beneficio, id_estado) VALUES (1,1,1,1);
INSERT INTO entregas (id_solicitud, id_beneficiario, id_municipio, id_estado, fecha_entrega) VALUES (1,1,1,1,NOW());
