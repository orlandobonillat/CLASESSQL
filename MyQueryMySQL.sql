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
FROM film;
 
 
-- 5. Filtrar datos

SELECT * FROM film
WHERE title='ACADEMY DINOSAUR';

SELECT * FROM film
WHERE title!='ACADEMY DINOSAUR';
