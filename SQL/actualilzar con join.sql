UPDATE transacciones t
JOIN bancos b ON t.transaccion_codigo = b.banco_codigo
SET t.banco_id = b.id;
