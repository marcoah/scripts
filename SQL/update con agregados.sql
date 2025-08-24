Update documentos join
       (       
       SELECT documento_id, sum(detalle_subtotal) as documento_subtotal, sum(detalle_impuesto) as documento_impuesto, sum(detalle_total) as documento_total
		FROM detalles
		GROUP BY documento_id
        ) t2
       on documentos.id = t2.documento_id
    set documentos.documento_subtotal = t2.documento_subtotal,
     documentos.documento_impuesto = t2.documento_impuesto,
     documentos.documento_total = t2.documento_total;