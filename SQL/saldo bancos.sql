SELECT b.banco_nombre AS banco, SUM(t.transaccion_monto_2) AS total_transacciones
FROM transacciones t
JOIN bancos b ON t.banco_id = b.id
GROUP BY b.banco_nombre;
