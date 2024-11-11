select * from Empleados;
INSERT INTO dbcamasutra.Categorias (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES 
('Colchones', 'Categoría de productos relacionados con colchones', 1, 1),
('Almohadas', 'Categoría de productos relacionados con almohadas', 1, 1),
('Ropa de Cama', 'Categoría de productos relacionados con sábanas y cobertores', 2, 2);
INSERT INTO dbcamasutra.EstadosProducto (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES 
('Disponible', 'Producto disponible para la venta', 1, 1),
('Agotado', 'Producto temporalmente agotado', 2, 2),
('En tránsito', 'Producto en proceso de reposición', 3, 3);

select * from dbcamasutra.Imagenes;
INSERT INTO dbcamasutra.Proveedores (empresa, telefono, direccion, correo, ruc, usuarioCreador, usuarioModificador)
VALUES 
('Colchones Perú S.A.', '999888777', 'Av. Siempre Viva 123', 'contacto@colchonesperu.com', '20100000001', 1, 1),
('Textiles Dormir S.A.C.', '999888666', 'Av. Principal 456', 'ventas@textilesdormir.com', '20200000002', 2, 2),
('Distribuidora Almohadas EIRL', '999888555', 'Jr. Almohada 789', 'contacto@almohadaseirl.com', '20300000003', 3, 3);


INSERT INTO dbcamasutra.Productos (nombre, descripcion, precioCompra, precioVenta, idCategoria, idEstado, idProveedor, usuarioCreador, usuarioModificador)
VALUES 
('Colchón Ortopédico', 'Colchón de alta calidad ortopédico', 250.00, 450.00, 1, 1, 1, 1, 1),
('Almohada Memory Foam', 'Almohada de memory foam con soporte cervical', 50.00, 100.00, 2, 1, 2, 1, 1),
('Sábana de Algodón', 'Sábana 100% algodón para cama queen', 30.00, 60.00, 3, 2, 3, 2, 2),
-- Más productos para la categoría 1
('Colchón Viscoelástico', 'Colchón viscoelástico con tecnología avanzada', 300.00, 550.00, 1, 1, 1, 1, 1),
('Base de Cama', 'Base de cama de madera maciza', 150.00, 300.00, 1,  1, 1, 1, 1),
-- Más productos para la categoría 2
('Funda para Almohada', 'Funda para almohada de microfibra', 10.00, 20.00, 2, 1, 2, 1, 1),
('Almohada de Plumas', 'Almohada de plumas de ganso', 40.00, 90.00, 2,  1, 2, 1, 1),
-- Más productos para la categoría 3
('Cobertor de Cama', 'Cobertor acolchado para cama king size', 60.00, 120.00, 3,  2, 3, 2, 2);

INSERT INTO dbcamasutra.Roles (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES 
('Administrador', 'Rol de administrador con acceso completo', 1, 1),
('Vendedor', 'Rol de vendedor con acceso a ventas', 2, 2),
('Transportista', 'Rol de transporte con acceso a envíos', 3, 3);

INSERT INTO dbcamasutra.EstadosEmpleado (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES 
('Activo', 'Empleado activo en el sistema', 1, 1),
('Suspendido', 'Empleado temporalmente suspendido', 2, 2),
('Despedido', 'Empleado ya no trabaja en la empresa', 3, 3);
select * from Empleados;
INSERT INTO dbcamasutra.Empleados (nombres, apePaterno,apeMaterno, correo, contra, telefono, idRol, idEstado, dni, usuarioCreador, usuarioModificador)
VALUES 
('Juan', 'Perez','Lopez', 'juan.perez@empresa.com', '$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', '999888777', 1, 1, '12345678', 1, 1),
('Ana', 'Gomez','Rivera', 'ana.gomez@empresa.com', '$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', '999888666', 2, 1, '87654321', 2, 2),
('Chula', 'Fuentes','Cabrera', 'chula.fuentes@empresa.com', '$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', '999428666', 2, 1, '47655371', 2, 2),
('Luis', 'Rodriguez','MataLucas', 'luis.rodriguez@empresa.com', '$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', '999888555', 3, 1, '11223344', 3, 3);
select * from dbcamasutra.Roles;

INSERT INTO dbcamasutra.Stock (idProducto, ubicacion, cantidad, usuarioCreador, usuarioModificador)
VALUES (1, 'Almacén A', 50, 1, 1),
       (2, 'Almacén B', 30, 1, 1),
       (3, 'Almacén C', 100, 1, 1);
INSERT INTO dbcamasutra.Clientes (nombres, apePaterno,apeMaterno, dni, correo,contra, usuarioCreador, usuarioModificador,telefono)
VALUES ('Laura', 'García','Carl', '45678901', 'laura.garcia@gmail.com','$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', 1, 1,'12345678'),
       ('Miguel', 'Torres','Carlton', '56789012', 'miguel.torres@gmail.com','$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', 1, 1,'12345678'),
       ('Ana', 'Martínez','Cuarm', '67890123', 'ana.martinez@gmail.com','$2a$10$0NMoRm.yiA41kvcw7zI0iu.cLe.d36CqC7Os8HwhJFgsWsYeoUhyu', 1, 1,'12345678');
INSERT INTO dbcamasutra.MetodoPago (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES ('Tarjeta de Crédito', 'Pago mediante tarjeta de crédito', 1, 1),
       ('Efectivo', 'Pago en efectivo', 1, 1),
       ('Transferencia Bancaria', 'Pago mediante transferencia bancaria', 1, 1);
INSERT INTO dbcamasutra.TipoComprobante (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES ('Factura', 'Documento legal para facturación', 1, 1),
       ('Boleta', 'Documento legal para ventas menores', 1, 1),
       ('Nota de Crédito', 'Documento de devolución de dinero', 1, 1);
INSERT INTO dbcamasutra.Comprobante (monto, fecha, hora, usuarioCreador, usuarioModificador, idTipoComprobante)
VALUES (500.00, '2024-09-01', '12:30:00', 1, 1, 1),
       (250.00, '2024-09-02', '14:00:00', 1, 1, 2),
       (300.00, '2024-09-03', '16:45:00', 1, 1, 3);
INSERT INTO dbcamasutra.Ventas (idCliente, idEmpleado, fecha, total, descuento, idMetodoPago, horaVenta, idComprobante, usuarioCreador, usuarioModificador)
VALUES (1, 1, '2024-09-01', 500.00, 0.00, 1, '12:30', 1, 1, 1),
       (2, 2, '2024-09-02', 250.00, 10.00, 2, '14:00', 2, 1, 1),
       (3, 3, '2024-09-03', 300.00, 5.00, 3, '16:45', 3, 1, 1);
INSERT INTO dbcamasutra.DetallesVenta (idVenta, cantidad, idProducto, usuarioCreador, usuarioModificador)
VALUES (1, 2, 1, 1, 1),
       (2, 1, 2, 1, 1),
       (3, 3, 3, 1, 1);
INSERT INTO dbcamasutra.Direcciones (idCliente, direccion, distrito, referencia, usuarioCreador, usuarioModificador)
VALUES (1, 'Av. Principal 123', 'Lima', 'Frente al parque', 1, 1),
       (2, 'Calle Secundaria 456', 'Callao', 'Al costado del hospital', 1, 1),
       (3, 'Jr. Los Robles 789', 'Miraflores', 'Al lado del supermercado', 1, 1);
INSERT INTO dbcamasutra.EstadosEnvio (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES ('En proceso', 'El envío está en proceso', 1, 1),
       ('Entregado', 'El envío fue entregado', 1, 1),
       ('Cancelado', 'El envío fue cancelado', 1, 1);
INSERT INTO dbcamasutra.Transporte (placa, modelo, marca, descripcion, usuarioCreador, usuarioModificador)
VALUES ('ABC-123', 'Camioneta', 'Toyota', 'Camioneta para envíos rápidos', 1, 1),
       ('XYZ-987', 'Camión', 'Ford', 'Camión de gran capacidad', 1, 1),
       ('JKL-456', 'Motocicleta', 'Honda', 'Motocicleta para envíos pequeños', 1, 1);
INSERT INTO dbcamasutra.Envios (idEmpleado, idTransporte, idVenta, fecha, horaEntrega, horaSalida, idEstadoEnvio, usuarioCreador, usuarioModificador)
VALUES (1, 1, 1, '2024-09-01', '13:00:00', '12:00:00', 1, 1, 1),
       (2, 2, 2, '2024-09-02', '15:30:00', '14:30:00', 2, 1, 1),
       (3, 3, 3, '2024-09-03', '17:00:00', '16:00:00', 3, 1, 1);
INSERT INTO dbcamasutra.EstadosCompra (nombre, descripcion, usuarioCreador, usuarioModificador)
VALUES ('Pendiente', 'Compra pendiente de confirmación', 1, 1),
       ('Confirmado', 'Compra confirmada por el proveedor', 1, 1),
       ('Cancelado', 'Compra cancelada', 1, 1);
INSERT INTO dbcamasutra.ProveedorContacto (nombre, telefono, idProveedor, usuarioCreador, usuarioModificador)
VALUES ('Carlos Jiménez', '987654321', 1, 1, 1),
       ('María Rodríguez', '123456789', 2, 1, 1),
       ('José Fernández', '567890123', 3, 1, 1);
INSERT INTO dbcamasutra.Compras (fecha, total, idEmpleado, idEstadoCompra, idProveedor, horaCompra, usuarioCreador, usuarioModificador, idComprobante)
VALUES ('2024-09-01', 1000.00, 1, 1, 1, '12:00:00', 1, 1, 1),
       ('2024-09-02', 2000.00, 2, 2, 2, '13:00:00', 1, 1, 2),
       ('2024-09-03', 1500.00, 3, 3, 3, '14:00:00', 1, 1, 3);
INSERT INTO dbcamasutra.DetallesCompra (idCompra, idProducto, cantidad, usuarioCreador, usuarioModificador)
VALUES (1, 1, 10, 1, 1),
       (2, 2, 20, 1, 1),
       (3, 3, 15, 1, 1);
