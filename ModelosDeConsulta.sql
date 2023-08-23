USE costorecetas;
SELECT * FROM ingredientes;
SELECT * FROM subrecetas;
SELECT * FROM subrecetas ORDER BY subreceta_nombre ASC;
SELECT * FROM ingredientes_subrecetas;
SELECT * FROM recetas;
SELECT * FROM subrecetas_recetas;

SELECT * FROM ingredientes WHERE ingredientes.ingre_id = 1;

DELETE FROM ingredientes WHERE ingre_nombre = "pimiento";
DELETE FROM ingredientes_recetas WHERE receta_id_fkey = 4;
DELETE FROM subrecetas_recetas WHERE receta_id_fkey = 5;
DELETE FROM recetas WHERE receta_nombre ="fideos al pesto";

USE costorecetas;
DELETE FROM subrecetas_recetas WHERE receta_id_fkey = 1;
DELETE FROM recetas WHERE receta_nombre ="fideos a la bolognesa";

SELECT * FROM subrecetas ORDER BY subreceta_nombre ASC;

/*Trae todas las subrecetas que tienen un ingredientem determinado*/
SELECT DISTINCT subrecetas.* FROM subrecetas
	JOIN ingredientes_subrecetas ON subrecetas.subreceta_id = ingredientes_subrecetas.subreceta_id_fkey
    JOIN ingredientes ON ingredientes_subrecetas.ingre_id_fkey = ingredientes.ingre_id
    WHERE ingredientes.ingre_id=3;

USE costorecetas;
SELECT ingredientes.* FROM ingredientes
	JOIN ingredientes_recetas ON ingredientes.ingre_id = ingredientes_recetas.ingre_id_fkey
    JOIN recetas ON recetas.receta_id = ingredientes_recetas.receta_id_fkey
    WHERE recetas.receta_id=1;

SELECT subrecetas.* FROM subrecetas
	JOIN subrecetas_recetas ON subrecetas.subreceta_id = subrecetas_recetas.subreceta_id_fkey
    JOIN recetas ON recetas.receta_id = subrecertas_recetas.receta_id_fkey
    WHERE recetas.receta_id=1;

SELECT recetas.* FROM recetas
	JOIN subrecetas_recetas ON recetas.receta_id = subrecetas_recetas.receta_id_fkey
    JOIN subrecetas ON subrecetas_recetas.subreceta_id_fkey = subrecetas.subreceta_id
    WHERE recetas.receta_id=1;