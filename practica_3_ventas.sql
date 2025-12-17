-- =============================================
-- CREAR TABLAS PARA PRACTICA 3
-- =============================================

-- Tabla productos (ya existente)
CREATE TABLE IF NOT EXISTS productos (
   producto_id SERIAL PRIMARY KEY,
   nombre VARCHAR(100) NOT NULL,
   descripcion TEXT,
   precio NUMERIC(10, 2) NOT NULL,
   stock INTEGER NOT NULL,
   categoria VARCHAR(50)
);

-- Tabla clientes (ya existente)
CREATE TABLE IF NOT EXISTS clientes (
  cliente_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  ciudad VARCHAR(50),
  fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla ventas (nueva)
CREATE TABLE IF NOT EXISTS ventas (
  venta_id SERIAL PRIMARY KEY,
  cliente_id INTEGER REFERENCES clientes(cliente_id),
  producto_id INTEGER REFERENCES productos(producto_id),
  cantidad INTEGER NOT NULL,
  precio_unitario NUMERIC(10, 2) NOT NULL,
  fecha_venta DATE DEFAULT CURRENT_DATE,
  metodo_pago VARCHAR(20) CHECK (metodo_pago IN ('tarjeta', 'efectivo', 'transferencia'))
);

-- Tabla pedidos (nueva)
CREATE TABLE IF NOT EXISTS pedidos (
  pedido_id SERIAL PRIMARY KEY,
  cliente_id INTEGER REFERENCES clientes(cliente_id),
  fecha_pedido DATE DEFAULT CURRENT_DATE,
  estado VARCHAR(20) DEFAULT 'pendiente'
);

-- Tabla detalles_pedido
CREATE TABLE IF NOT EXISTS detalles_pedido (
  detalle_id SERIAL PRIMARY KEY,
  pedido_id INTEGER REFERENCES pedidos(pedido_id),
  producto_id INTEGER REFERENCES productos(producto_id),
  cantidad INTEGER NOT NULL,
  precio NUMERIC(10, 2) NOT NULL
);


-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio, stock, categoria) VALUES
('iPhone 15', 'Smartphone Apple', 1299.99, 25, 'Electrónica'),
('MacBook Air', 'Laptop ultradelgada', 1499.99, 15, 'Electrónica'),
('Samsung TV 55"', 'TV LED 4K', 799.99, 10, 'Electrónica'),
('Audífonos Sony', 'Noise cancelling', 299.99, 30, 'Accesorios'),
('Teclado Logitech', 'Teclado mecánico', 89.99, 50, 'Accesorios'),
('Mouse Gamer', 'RGB 16000DPI', 59.99, 40, 'Accesorios'),
('Silla Ergonómica', 'Para oficina', 399.99, 8, 'Muebles'),
('Escritorio Moderno', 'Madera maciza', 299.99, 5, 'Muebles'),
('Monitor 27"', 'QHD 144Hz', 449.99, 12, 'Electrónica'),
('Tablet Android', '10 pulgadas', 199.99, 18, 'Electrónica'),
('Impresora Láser', 'Multifunción', 199.99, 7, 'Oficina'),
('Router WiFi 6', 'Doble banda', 129.99, 22, 'Redes'),
('Webcam 4K', 'Para streaming', 89.99, 35, 'Accesorios'),
('Disco SSD 1TB', 'NVMe PCIe 4.0', 119.99, 28, 'Componentes'),
('Memoria RAM 16GB', 'DDR4 3200MHz', 79.99, 45, 'Componentes');

-- Insertar clientes
INSERT INTO clientes (nombre, apellido, email, ciudad, fecha_registro) VALUES
('Ana', 'García', 'ana.garcia@email.com', 'Madrid', '2023-01-15'),
('Carlos', 'Rodríguez', 'carlos.rod@email.com', 'Barcelona', '2023-02-20'),
('María', 'López', 'maria.lopez@email.com', 'Valencia', '2023-03-10'),
('Javier', 'Martínez', 'javier.mtz@email.com', 'Madrid', '2023-04-05'),
('Laura', 'Sánchez', 'laura.sanchez@email.com', 'Sevilla', '2023-05-12'),
('David', 'Fernández', 'david.fernandez@email.com', 'Bilbao', '2023-06-18'),
('Sofía', 'Gómez', 'sofia.gomez@email.com', 'Málaga', '2023-07-22'),
('Miguel', 'Pérez', 'miguel.perez@email.com', 'Zaragoza', '2023-08-30'),
('Elena', 'Ruiz', 'elena.ruiz@email.com', 'Madrid', '2023-09-14'),
('Daniel', 'Hernández', 'daniel.hdez@email.com', 'Barcelona', '2023-10-25');

-- Insertar ventas (histórico de 2023-2024)
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, fecha_venta, metodo_pago) VALUES
(1, 1, 1, 1299.99, '2023-11-15', 'tarjeta'),
(1, 4, 2, 299.99, '2023-11-15', 'tarjeta'),
(2, 2, 1, 1499.99, '2023-12-05', 'transferencia'),
(2, 5, 1, 89.99, '2023-12-05', 'transferencia'),
(3, 3, 1, 799.99, '2024-01-10', 'efectivo'),
(3, 6, 2, 59.99, '2024-01-10', 'efectivo'),
(4, 7, 1, 399.99, '2024-01-20', 'tarjeta'),
(4, 8, 1, 299.99, '2024-01-20', 'tarjeta'),
(5, 9, 2, 449.99, '2024-02-15', 'transferencia'),
(1, 10, 1, 199.99, '2024-02-20', 'tarjeta'),
(2, 11, 1, 199.99, '2024-02-25', 'tarjeta'),
(3, 12, 1, 129.99, '2024-03-05', 'efectivo'),
(4, 13, 3, 89.99, '2024-03-10', 'tarjeta'),
(5, 14, 2, 119.99, '2024-03-15', 'transferencia'),
(6, 15, 4, 79.99, '2024-03-20', 'tarjeta'),
(1, 2, 1, 1499.99, '2024-04-01', 'tarjeta'),
(2, 3, 1, 799.99, '2024-04-05', 'transferencia'),
(3, 4, 1, 299.99, '2024-04-10', 'efectivo'),
(4, 5, 2, 89.99, '2024-04-15', 'tarjeta'),
(5, 6, 3, 59.99, '2024-04-20', 'tarjeta'),
(6, 7, 1, 399.99, '2024-05-01', 'transferencia'),
(7, 8, 1, 299.99, '2024-05-05', 'tarjeta'),
(8, 9, 1, 449.99, '2024-05-10', 'efectivo'),
(9, 10, 2, 199.99, '2024-05-15', 'tarjeta'),
(10, 11, 1, 199.99, '2024-05-20', 'transferencia'),
(1, 12, 1, 129.99, '2024-05-25', 'tarjeta'),
(2, 13, 2, 89.99, '2024-05-28', 'tarjeta'),
(3, 14, 1, 119.99, '2024-06-01', 'efectivo'),
(4, 15, 3, 79.99, '2024-06-05', 'tarjeta');

-- Insertar pedidos y detalles (para el ejercicio de clientes con más de 3 pedidos)
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(1, '2024-01-15', 'completado'),
(1, '2024-02-20', 'completado'),
(1, '2024-03-10', 'completado'),
(1, '2024-04-05', 'completado'),
(2, '2024-02-01', 'completado'),
(2, '2024-03-15', 'completado'),
(2, '2024-04-20', 'completado'),
(3, '2024-01-10', 'completado'),
(3, '2024-02-15', 'completado'),
(4, '2024-03-01', 'completado'),
(4, '2024-04-10', 'completado'),
(5, '2024-02-05', 'completado');

INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, precio) VALUES
(1, 1, 1, 1299.99),
(1, 4, 2, 299.99),
(2, 2, 1, 1499.99),
(3, 3, 1, 799.99),
(3, 6, 2, 59.99),
(4, 10, 1, 199.99),
(5, 5, 1, 89.99),
(6, 9, 2, 449.99),
(7, 11, 1, 199.99),
(8, 12, 1, 129.99),
(9, 13, 3, 89.99),
(10, 7, 1, 399.99),
(11, 8, 1, 299.99),
(12, 14, 2, 119.99);


-- CONSULTAS DEL EJERCICIO 3
--------------------------------------------------------

-- Ejercicio 1: Ingresos totales por categoría
SELECT p.categoria,
       SUM(v.cantidad * v.precio_unitario) AS ingresos_totales
FROM ventas v
JOIN productos p ON v.producto_id = p.producto_id
GROUP BY p.categoria
ORDER BY ingresos_totales DESC;

-- Ejercicio 2: Clientes con más de 3 pedidos en últimos 12 meses
SELECT c.nombre, c.apellido, COUNT(p.pedido_id) AS total_pedidos
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE p.estado = 'completado'
  AND p.fecha_pedido >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY c.cliente_id
HAVING COUNT(p.pedido_id) > 3;

-- todos los pedidos de ejmplo estan antes de 2024- 12-17, asi que no cumple la condicion
-- del ultimo año, por tanto se cambiara la fecha de los ultimos pedidos.
-- por ejemplo fecha de 2025

UPDATE pedidos
SET fecha_pedido = fecha_pedido + INTERVAL '1 year';

-- Ejercicio 2: Clientes con más de 3 pedidos (ajustado para datos 2024)
SELECT c.nombre, c.apellido, COUNT(p.pedido_id) AS total_pedidos
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE p.estado = 'completado'
  AND p.fecha_pedido >= '2024-01-01'  -- año 2024
  AND p.fecha_pedido <= '2024-12-31'
GROUP BY c.cliente_id
HAVING COUNT(p.pedido_id) > 3;

-- Ejercicio 3: Producto más vendido por categoría
-- Se calcula la suma de cantidades vendidas por producto y se selecciona el máximo por categoría

WITH ventas_por_producto AS (
    SELECT p.producto_id, p.nombre, p.categoria, SUM(v.cantidad) AS total_vendido
    FROM ventas v
    JOIN productos p ON v.producto_id = p.producto_id
    GROUP BY p.producto_id, p.nombre, p.categoria
)
SELECT vpp.categoria, vpp.nombre, vpp.total_vendido
FROM ventas_por_producto vpp
JOIN (
    SELECT categoria, MAX(total_vendido) AS max_vendido
    FROM ventas_por_producto
    GROUP BY categoria
) maximos
ON vpp.categoria = maximos.categoria
   AND vpp.total_vendido = maximos.max_vendido
ORDER BY vpp.categoria;

-- -- Ejercicio 4: Mes con mayores ingresos del año
-- Se suman los ingresos por mes y se ordena para ver el mes con más ventas

SELECT EXTRACT(MONTH FROM fecha_venta) AS mes, 
       SUM(cantidad * precio_unitario) AS ingresos_mes
FROM ventas
WHERE EXTRACT(YEAR FROM fecha_venta) = 2024 -- ajusta al año de tus datos
GROUP BY mes
ORDER BY ingresos_mes DESC
LIMIT 1;

-- Ejercicio 5: Categorías con stock promedio bajo
-- Calcula el promedio de stock por categoría y muestra las que tienen menos de 20 unidades

SELECT categoria, AVG(stock) AS stock_promedio
FROM productos
GROUP BY categoria
HAVING AVG(stock) < 20
ORDER BY stock_promedio ASC;

