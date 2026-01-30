USE Chinook


-- Tabla
SELECT * FROM Album

-- Vista
SELECT * FROM MediaType


-- Columnas
SELECT  * FROM Invoice;


SELECT  
	BillingCity,
	BillingCountry
FROM Invoice;

-- 3. Limite de filas

SELECT TOP 25 * FROM Invoice;

SELECT TOP 25 InvoiceId, CustomerId, BillingCity  FROM Invoice

-- 4. Uso de alias

SELECT 
	InvoiceId AS id_factura,
    CustomerId	AS id_cliente,
    BillingCity AS ciudad_facturacion
FROM Invoice 
 

-- 5. Filtrar datos

SELECT * FROM Invoice 
WHERE BillingCountry='Canada'

SELECT * FROM Invoice 
WHERE BillingCountry!='Canada'


SELECT BillingCountry,COUNT(*) FROM Invoice GROUP BY BillingCountry


-- Filtro texto
-- Wildcard(%) : Busqueda de texto
-- Usar LIKE antes del wilcard
SELECT * FROM Track;

SELECT * FROM Track
WHERE Composer='Tony';

-- a. Inicio del texto
SELECT * FROM Track
WHERE Composer LIKE 'Tony%'; -- texto a la derecha puede ser cualquier cosa

-- b. Final del texto
SELECT * FROM Track
WHERE Composer LIKE '%Tony'; -- texto a la izquierda puede ser cualquier cosa

-- c. En el texto
SELECT * FROM Track
WHERE Composer LIKE '%Tony%'; -- texto a la izquierda puede ser cualquier cosa


-- Las 2 condiciones se deben de cumplir 
SELECT   *
FROM
    Track
WHERE
    Composer LIKE '%John%'
        AND Composer LIKE '%Paul%';


-- Basta que 1 condición se cumpla
SELECT   *
FROM
    Track
WHERE
    Composer LIKE '%John%'
        OR Composer LIKE '%Paul%';
