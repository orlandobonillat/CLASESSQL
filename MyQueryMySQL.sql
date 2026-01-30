-- Aqui vamos a practicar SQL

/*

Este es un Query
donde aprenderemos
muchas sentencias de SQL.

*/

-- 1. Definir que BBD se va usar

USE sakila;
-- 2. Seleccionar datos de tablas
-- * equivale a todo (filas o columnas)

-- Tabla
SELECT * FROM  city;

-- Vista
SELECT * FROM actor_info;

--

SELECT * FROM film;

SELECT 
title,
special_features,
rental_duration
FROM film;

-- 3. Limite de filas

SELECT * FROM film
LIMIT 25;

SELECT film_id,title,rental_duration FROM film
LIMIT 25;

-- 4. Uso de alias

SELECT 
	title AS nombre_pelicula,
    description	AS description_pelicula,
    release_year AS año
from film;
 
 
-- 5. Filtrar datos

SELECT * FROM film
WHERE title='ACADEMY DINOSAUR';

SELECT * FROM film
WHERE title!='ACADEMY DINOSAUR';

-- Filtro texto
-- Wildcard(%) : Busqueda de texto
-- Usar LIKE antes del wilcard

SELECT * FROM film_text;

-- a. Inicio del texto
SELECT * FROM film_text
WHERE description LIKE 'Cat%'; -- texto a la derecha puede ser cualquier cosa

-- b. Final del texto
SELECT * FROM film_text
WHERE description LIKE '%Cat'; -- texto a la izquierda puede ser cualquier cosa

-- c. En el texto
SELECT * FROM film_text
WHERE description LIKE '%Cat%'; -- texto a la izquierda puede ser cualquier cosa


-- Las 2 condiciones se deben de cumplir 
SELECT 
    *
FROM
    film_text
WHERE
    description LIKE '%Cat%'
        AND description LIKE '%Feminist%';
        
-- Basta que 1 condición se cumpla     
SELECT 
    *
FROM
    film_text
WHERE
    description LIKE '%Cat%'
        OR description LIKE '%Feminist%';        

-- Varios filtros

SELECT * FROM film
WHERE title IN ('ACADEMY DINOSAUR','WHALE BIKINI');

SELECT * FROM film
WHERE title NOT IN ('ACADEMY DINOSAUR','WHALE BIKINI');

-- Operador >= y <= -> BETWEEN

SELECT * FROM film
WHERE title NOT IN ('ACADEMY DINOSAUR','WHALE BIKINI')
AND description LIKE '%Squirrel%'
AND special_features LIKE '%Deleted Scenes%'
AND length<90
AND rental_rate BETWEEN 2.99 AND 4.99;


-- 6. Ordenar datos
-- ASC (ascendente): menor a mayor
-- DESC (descendente): mayor a menor

SELECT * FROM customer;

SELECT * FROM customer
ORDER BY email ASC;

SELECT * FROM customer
ORDER BY email DESC;

SELECT * FROM actor
ORDER BY last_name, first_name;

SELECT * FROM actor
ORDER BY last_name, first_name DESC;

SELECT * FROM actor
ORDER BY last_name DESC, first_name ASC;

SELECT * FROM film
WHERE title NOT IN ('ACADEMY DINOSAUR','WHALE BIKINI')
AND description LIKE '%Squirrel%'
AND special_features LIKE '%Deleted Scenes%'
AND length<90
AND rental_rate BETWEEN 2.99 AND 4.99
ORDER BY title,description;

-- 7. Condicionales

SELECT 
    *,
    IF(special_features LIKE '%Trailer%',
        'Yes',
        'No') AS trailers,
    IF(special_features LIKE '%Commentaries%',
        'Yes',
        'No') AS comentaries,
    IF(special_features LIKE '%Deleted Scenes%',
        'Yes',
        'No') AS delete_scenes,
    IF(special_features LIKE '%Behind the Scenes%',
        'Yes',
        'No') AS behind_the_scenes
FROM
    film;
    

SELECT 
    *,
    CASE
        WHEN special_features LIKE '%Trailer%' THEN 'Yes'
        ELSE 'No'
    END AS Trailers,
        CASE
        WHEN special_features LIKE '%Commentaries%' THEN 'Yes'
        ELSE 'No'
    END AS commentaries,
        CASE
        WHEN special_features LIKE '%Deleted Scenes%' THEN 'Yes'
        ELSE 'No'
    END AS delete_scenes,
        CASE
        WHEN special_features LIKE '%Behind the Scenes%' THEN 'Yes'
        ELSE 'No'
    END AS behind_the_scenes
FROM
    film;

-- Varias condiciones (length en rangos de 60,120,180 a más)

SELECT 
    length,
    CASE
        WHEN length <= 60 THEN '000-060' -- Condicion 1
        WHEN length > 60 AND length <= 120 THEN '060-120' -- Condicion 2
        WHEN length > 120 AND length <= 180 THEN '120-180' -- Condicion 3
        ELSE 'Otro'
    END AS rango_length	
FROM
    film
ORDER BY length ASC;


-- Buenas practicas
-- 1 línea = 1 columna o 1 operación
-- Comandos en MAYUSCULA
-- Nombres sin ESPACIOS
-- Objetos (tablas,columnas,bbdd) en minuscula


-- 8. Agregaciones y agrupaciones

SELECT * FROM film;

-- ¿Cuantas peliculas hay por valor de rental_duration o rental_date?

SELECT 
    rental_duration, -- Columna en la que se basa el calculo (columna agrupada)
    COUNT(film_id) AS films -- Calculo (columna agregada)
FROM
    film
GROUP BY rental_duration
ORDER BY rental_duration;


-- 2 columnas - calcular custome por store_id y address_id

SELECT * FROM customer;

SELECT 
    store_id, -- Columna agrupada 1
    address_id, -- Columnada agrupada 2 
    COUNT(customer_id) AS customers -- Calculo (Columna agregada)
FROM
    customer
    GROUP BY store_id,address_id
    ORDER BY store_id;


SELECT 
  IF(special_features LIKE '%Trailer%',
        'Yes',
        'No') AS trailers,
    IF(special_features LIKE '%Commentaries%',
        'Yes',
        'No') AS commentaries,
    IF(special_features LIKE '%Deleted Scenes%',
        'Yes',
        'No') AS delete_scenes,
    IF(special_features LIKE '%Behind the Scenes%',
        'Yes',
        'No') AS behind_the_scenes,
        COUNT( film_id)
FROM film
GROUP BY trailers,commentaries,delete_scenes,behind_the_scenes;        
