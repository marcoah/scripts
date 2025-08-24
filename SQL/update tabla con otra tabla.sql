UPDATE detalles
INNER JOIN productos ON detalles.producto_id = productos.id
SET 
detalles.precio_unitario = IF(detalles.precio_unitario = 0, productos.producto_precio , detalles.precio_unitario),
detalles.detalle_medida = productos.producto_medida,
detalles.detalle_unidad = productos.producto_unidad