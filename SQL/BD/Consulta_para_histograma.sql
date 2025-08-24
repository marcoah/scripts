Select CASE WHEN prof < 10  THEN 'Menor a 10' 
WHEN prof between 10 AND 20 THEN 'Entre 10 y 20' 
ELSE 'Mayor a 20' END as Rango, Count(*) as Cantidad
FROM Perforaciones group by Rango