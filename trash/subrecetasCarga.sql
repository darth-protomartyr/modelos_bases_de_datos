INSERT INTO subrecetas(subreceta_nombre,subreceta_cantidades,subreceta_mermas,subreceta_costo_parcial,subreceta_porciones,subreceta_costo_porcion,subreceta_alta)
	VALUES('tallarines','500-5-10','0.0-0.0-0.0-0.0-0.0-0.0-','321.00',4,'80.25', true);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(1, 1);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(2, 1);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(3, 1);

INSERT INTO subrecetas(subreceta_nombre,subreceta_cantidades,subreceta_mermas,subreceta_costo_parcial,subreceta_porciones,subreceta_costo_porcion,subreceta_alta)
	VALUES('bolognesa','10-100-500-1000','0.0-0.0-0.0-0.0-0.0-0.0-0.0-0.0-','1316',4,'329',true);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(3, 2);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(4, 2);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(5, 2);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(7, 2);