-- 1. Cantidad de clientes con membresia 
SELECT COUNT(*) AS huespedes_membresia_activa
FROM Huesped
WHERE membership = true;

-- 2. Obtener el nombre y el genero de 15 huespedes que 
-- mas se hospedan en navidad
SELECT nombre, genero, COUNT(*) as contador_hospedado
FROM Huesped
WHERE EXTRACT(MONTH FROM FechaCheckIn) = 12 AND EXTRACT(DAY FROM FechaCheckIn) BETWEEN 24 AND 26
GROUP BY nombre, genero
ORDER BY contador_hospedado DESC
LIMIT 15;

-- 3. Clientes con membresia que no se han hospedado en un penthouse

-- 4. Empleados del mismo estado que trabajen en distintos hoteles

-- 5. Rango de precios de habitaciones por estado
SELECT Estado, MIN(precio) as precio_minimo, MAX(precio) as precio_maximo


-- 6. Miembros con membresia que mas eventos organizan
SELECT H.*, COUNT(*) as contador_eventos
FROM Huespedes H
JOIN Rentar R ON H.id = R.id_huesped
WHERE H.MembresiaActiva = true
GROUP BY H.nombre
ORDER BY contador_rentado DESC
LIMIT 15;

-- 7. Huespedes con mascota que se han hospedado mas de 5 dias
SELECT H.*
FROM Huesped H
JOIN Hospedar HS ON H.id = HS.id_huesped
WHERE HS.mascota = true
    AND DATEDIFF(HS.FechaCheckOut, HS.FechaCheckIn) > 5;

