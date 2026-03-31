UPDATE administracion.transacciones
SET 
    transaccion_tipo = CASE
        WHEN transaccion_monto_moneda_2 < 0 THEN 'EGRESO'
        WHEN transaccion_monto_moneda_2 > 0 THEN 'INGRESO'
        ELSE transaccion_tipo
    END,
	transaccion_monto_moneda_2 = CASE
        WHEN transaccion_monto_moneda_2 < 0 THEN ABS(transaccion_monto_moneda_2)
        ELSE transaccion_monto_moneda_2
    END;
