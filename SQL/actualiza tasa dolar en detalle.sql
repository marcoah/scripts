UPDATE detalles 
inner JOIN documentos ON detalles.documento_id = documentos.id
SET detalles.detalle_moneda_tasa = documentos.documento_moneda_tasa
Where detalles.detalle_moneda_tasa = 0