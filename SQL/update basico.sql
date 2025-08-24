UPDATE detalles
SET 
detalles.detalle_subtotal = detalles.detalle_cantidad * detalles.precio_unitario,
detalles.detalle_impuesto = detalles.detalle_subtotal * detalles.detalle_impuesto_tasa,
detalles.detalle_total = detalles.detalle_subtotal + detalles.detalle_impuesto
where detalles.detalle_subtotal = 0