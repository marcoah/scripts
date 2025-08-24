UPDATE documentos
JOIN dolar ON documentos.documento_fecha_emision = dolar.tasa_fecha
SET 
documentos.documento_moneda_tasa = dolar.tasa_final
Where documentos.documento_moneda_tasa = 0