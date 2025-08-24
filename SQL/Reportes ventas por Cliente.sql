Use Gestion;

SELECT DISTINCT cliente_nombre  
       , MIN(factura_total) OVER (PARTITION BY clie.cliente_id) AS MinVenta  
       , MAX(factura_total) OVER (PARTITION BY clie.cliente_id) AS MaxVenta  
       , AVG(factura_total) OVER (PARTITION BY clie.cliente_id) AS AvgVenta
	   , sum(factura_total) OVER (PARTITION BY clie.cliente_id) AS TotalVentas
       , COUNT(clie.cliente_id) OVER (PARTITION BY clie.cliente_id) AS Facturas  
FROM documentos AS docu  
JOIN clientes AS clie  
     ON docu.cliente_id = clie.cliente_id  
WHERE docu.documento_tipo IS NOT NULL  
ORDER BY TotalVentas desc  