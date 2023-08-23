USE costorecetas;

SELECT DISTINCT subrecetas.* FROM subrecetas
JOIN ingredientes_subrecetas ON subrecetas.subreceta_id = ingredientes_subrecetas.subreceta_id_fkey
JOIN ingredientes ON ingredientes_subrecetas.ingre_id_fkey = ingredientes.ingre_id
WHERE ingredientes.ingre_id= 1;


SELECT DISTINCT recetas.* FROM recetas
JOIN ingredientes_recetas ON recetas.receta_id = ingredientes_recetas.receta_id_fkey
JOIN ingredientes ON ingredientes_recetas.ingre_id_fkey = ingredientes.ingre_id
WHERE ingredientes.ingre_id= 12;


UPDATE ingredientes
	SET ingre_rubro = 'verduleria', ingre_nombre = 'ajo', ingre_u_medida = 'u', ingre_cant_compra = 10 , ingre_costo = 1200, ingre_costo_unidad = 120, ingre_alta = true
	WHERE ingre_id = 11;

UPDATE ingredientes SET ingre_rubro = 'almacen', ingre_nombre = 'aceite oliva', ingre_u_medida = 'ml', ingre_cant_compra = 1000 , ingre_costo = 1000.0, ingre_costo_unidad = 1.0, ingre_alta = true WHERE ingre_id = 10;

'=verduleria, ingre_nombre = Albahaca, ingre_u_medida = gr, ingre_cant_compra = 10'

UPDATE ingredientes
SET ingre_rubro ="rubro", ingre_nombre = "nombre", ingre_u_medida = "unidad",ingre_cant_compra = " + presentacion + " , ingre_costo = " + costo + ", ingre_costo_unidad = " + costo/presentacion + ", ingre_alta = true" +
                "WHERE ingre_id = " + id +";";