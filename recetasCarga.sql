INSERT INTO recetas(receta_nombre, receta_cantidades_ing, receta_mermas_ing, receta_alta, receta_unidades_sr, receta_costo, receta_porciones, receta_precioPorcion)
	VALUES('fideos a la bolognesa','','', true ,'4-4-', '1637', 4,'409.25');
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(10, 6);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(11, 6);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(12, 6);
INSERT INTO subrecetas_recetas( subreceta_id_fkey, receta_id_fkey)
	VALUES(1, 6);

INSERT INTO recetas(receta_nombre, receta_cantidades_ing, receta_mermas_ing, receta_alta, receta_unidades_sr, receta_costo, receta_porciones, receta_precioPorcion)
	VALUES('fideos al pesto','100-2-50-','0.0-0.0-0.0-0.0-0.0-0.0-', true ,'4-', '9.223372036854776E16', '4',' 9.223372036854776E16');
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(10, 6);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(11, 6);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(12, 6);
INSERT INTO subrecetas_recetas( subreceta_id_fkey, receta_id_fkey)
	VALUES(1, 6);
    
INSERT INTO recetas(receta_nombre, receta_cantidades_ing, receta_mermas_ing, receta_alta, receta_unidades_sr, receta_costo, receta_porciones, receta_precioPorcion)VALUES('ensalada mixta','500-600-300-20-50-','0.1-0.0-0.2-0.0-0.05-0.0-0.0-0.0-0.0-0.0-', true ,'', '583.05', '5',' 116.61');
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey) VALUES(9, 3);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey) VALUES(7, 3);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey) VALUES(8, 3);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey) VALUES(3, 3);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey) VALUES(10, 3);