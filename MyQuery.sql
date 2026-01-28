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