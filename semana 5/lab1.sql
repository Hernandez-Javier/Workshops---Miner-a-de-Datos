
-------Generar un reporte de las ventas (cantidad * precio unidad) y la cantidad de clientes por ciudad a la que pertenece, de los clientes que tiene un límite de crédito superior igual a $6000-----

SELECT c.ciudad, COUNT(c.codigo_cliente) AS total_clientes, SUM(dp.cantidad * dp.precio_unidad) AS ventas
FROM cliente c
INNER JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
INNER JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido
WHERE c.limite_credito >= 6000
GROUP BY c.ciudad;

----2. Generar un reporte de las ventas por empleado, así como los clientes gestionados por cada uno, donde el puesto de los empleados sea estrictamente “Representante Ventas”---

select * from cliente

SELECT e.nombre, e.puesto, COUNT(c.CODIGO_EMPLEADO_REP_VENTAS) AS clientes, SUM(dp.cantidad * dp.precio_unidad) AS ventas
FROM empleado e
INNER JOIN cliente c ON e.codigo_empleado = c.CODIGO_EMPLEADO_REP_VENTAS
INNER JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
INNER JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido
WHERE e.puesto= 'Representante Ventas'
GROUP BY e.nombre, e.puesto;

---1.	Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.---
SELECT o.codigo_oficina, o.ciudad from oficina o

---2.	Actualice el límite de crédito de los clientes en un 25% adicional para los clientes que tengan un límite de crédito superior a  los $12000 y que viven en la ciudad de Miami.---

---3.	Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.---
select e.nombre, e.apellido, e.emai; from empledos e where e.codigo_jefe  == 7
