UPDATE detalles
INNER JOIN documentos ON detalles.documento_id = documentos.id
SET detalles.detalle_impuesto_tasa  = documentos.documento_impuesto_tasa