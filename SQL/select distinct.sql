
SELECT DISTINCT ramo_nombre 
       , COUNT(ram.id) OVER (PARTITION BY ram.id) AS rmos  
FROM empresas AS emp  
JOIN ramos AS ram  
     ON emp.ramo_id = ram.id  
WHERE emp.ramo_id IS NOT NULL  
ORDER BY rmos desc  