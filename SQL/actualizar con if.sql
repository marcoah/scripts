UPDATE administracion.transacciones
SET 
    transaccion_tasa = CASE 
        WHEN transaccion_monto_moneda_2 = 0 THEN 0
        ELSE transaccion_monto_moneda_1 / transaccion_monto_moneda_2
    END;
