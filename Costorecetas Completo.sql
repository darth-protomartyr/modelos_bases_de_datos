CREATE DATABASE costorecetas;
use costorecetas;
CREATE TABLE ingredientes(
	ingre_id INT AUTO_INCREMENT PRIMARY KEY,
    ingre_rubro VARCHAR(50),
    ingre_nombre VARCHAR(50) UNIQUE,
    ingre_u_medida VARCHAR(20),
    ingre_cant_compra INT,
	ingre_costo DOUBLE,
    ingre_costo_unidad DOUBLE,
    ingre_alta BOOLEAN
);

CREATE TABLE subrecetas(
	subreceta_id INT AUTO_INCREMENT PRIMARY KEY,
    subreceta_nombre VARCHAR(50) UNIQUE,
    subreceta_cantidades VARCHAR(1000),
    subreceta_mermas VARCHAR(1000),
    subreceta_costo double,
    subreceta_porciones INT,
    subreceta_costo_porcion double,
    subreceta_alta BOOLEAN
);

CREATE TABLE ingredientes_subrecetas(
    id_subrecetas_ingredientes INT PRIMARY KEY AUTO_INCREMENT,
    ingre_id_fkey INT,
    subreceta_id_fkey INT,
    FOREIGN KEY (ingre_id_fkey) references ingredientes(ingre_id),
    FOREIGN KEY (subreceta_id_fkey) references subrecetas(subreceta_id)
);

CREATE TABLE recetas(
	receta_id INT AUTO_INCREMENT PRIMARY KEY,
    receta_nombre VARCHAR(50) UNIQUE,
    receta_cantidades_ing VARCHAR(1000),
    receta_mermas_ing VARCHAR(1000),
    receta_alta BOOLEAN,
    receta_unidades_sr VARCHAR(1000),
	receta_costo DOUBLE,
    receta_porciones INT,
    receta_costo_porcion DOUBLE
);


CREATE TABLE ingredientes_recetas(
    id_recetas_ingredientes INT PRIMARY KEY AUTO_INCREMENT,
    ingre_id_fkey INT,
    receta_id_fkey INT,
    FOREIGN KEY (ingre_id_fkey) references ingredientes(ingre_id),
    FOREIGN KEY (receta_id_fkey) references recetas(receta_id)
);


CREATE TABLE subrecetas_recetas(
	id_recetas_subrecetas INT PRIMARY KEY AUTO_INCREMENT,
    subreceta_id_fkey INT,
    receta_id_fkey INT,
    FOREIGN KEY (subreceta_id_fkey) references subrecetas(subreceta_id),
    FOREIGN KEY (receta_id_fkey) references recetas(receta_id)
);


CREATE TABLE rubros(
	id_rubro INT PRIMARY KEY AUTO_INCREMENT,
    rubro_nombre VARCHAR(50) UNIQUE
);


CREATE TABLE users(
    user_id VARCHAR(30) UNIQUE,
    user_name VARCHAR(30),
    user_last_name VARCHAR(30),
    user_mail VARCHAR(60) UNIQUE,
    user_role VARCHAR(15),    
    user_image_route VARCHAR(200),
    user_image_name VARCHAR(50),
    user_password VARCHAR(15),
    user_alta BOOLEAN
);

CREATE TABLE registers(
	register_id INT AUTO_INCREMENT PRIMARY KEY,
    register_ejecution TIMESTAMP,
    register_user VARCHAR(50),
    register_operation VARCHAR(50),
    register_object VARCHAR(30),
    register_modification VARCHAR(500)
);


/*Ingredientes*/
INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacen","harina","gr", 1000,230,0.23,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Almacén","huevo","u", 1, 40, 40,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Almacén","sal","gr",500,300,0.60,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Almacén","extracto de tomate","gr",500, 400, 1.25,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Carnicería","carne picada","gr", 1000,1700,1.70,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Carnicería","bola de lomo","gr", 1000, 2300,2.3,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Verdulería","tomate","gr", 1000, 400,0.4,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "Verduleria","cebolla","gr", 1000, 370, 0.37,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "verduleria","lechuga","gr", 1000, 230, 0.23,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacen","aceite oliva","ml",1000,800,0.80,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "verduleria","ajo","u", 10, 350, 35,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "verduleria","albahaca","gr", 1000, 2400, 2.4,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","puré de tomate","gr", 2500, 4600, 1.84,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","aceite de oliva","ml", 1000, 2500, 2.5,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","harina orgánica","gr", 1000, 380, 0.38,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","harina de centeno","gr", 1000, 500, 0.5,true);
    
INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","sémola de maiz","gr", 1000, 600, 0.6,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","levadura fresca","gr", 500, 300, 1.66,true);

INSERT INTO ingredientes(ingre_rubro,ingre_nombre,ingre_u_medida,ingre_cant_compra,ingre_costo,ingre_costo_unidad, ingre_alta)
	VALUES( "almacén","agua","ml", 1000, 1, 0.001,true);

/*Subrecetas*/
INSERT INTO subrecetas(subreceta_nombre,subreceta_cantidades,subreceta_mermas,subreceta_costo,subreceta_porciones,subreceta_costo_porcion,subreceta_alta)
	VALUES('fideos','500-5-10-','10.0-20.0-0.0-0.0-0.0-0.0-','355.5','4','88.875', true);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(1, 1);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(2, 1);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(3, 1);

INSERT INTO subrecetas(subreceta_nombre,subreceta_cantidades,subreceta_mermas,subreceta_costo,subreceta_porciones,subreceta_costo_porcion,subreceta_alta)
	VALUES('salsa bolognesa','10-100-500-1000-','0.0-0.0-0.0-0.0-0.0-0.0-0.0-0.0-','1381.0','4','345.25', true);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(3, 2);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(4, 2);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(5, 2);
INSERT INTO ingredientes_subrecetas(ingre_id_fkey, subreceta_id_fkey)
	VALUES(7, 2);

/*Recetas*/
INSERT INTO recetas(receta_nombre, receta_cantidades_ing, receta_mermas_ing, receta_alta, receta_unidades_sr, receta_costo, receta_porciones, receta_costo_porcion)
	VALUES('fideos a la bolognesa','','', true ,'4-4-', '1736.5', '4',' 434.125');
INSERT INTO subrecetas_recetas( subreceta_id_fkey, receta_id_fkey)
	VALUES(2, 1);
INSERT INTO subrecetas_recetas( subreceta_id_fkey, receta_id_fkey)
	VALUES(1, 1);
    
INSERT INTO recetas(receta_nombre, receta_cantidades_ing, receta_mermas_ing, receta_alta, receta_unidades_sr, receta_costo, receta_porciones, receta_costo_porcion)
	VALUES('ensalada mixta','500-600-300-20-50-','10.0-0.0-20.0-0.0-5.0-0.0-0.0-0.0-0.0-0.0-', true ,'', '779.15', '5',' 155.83');
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(3, 2);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(7, 2);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(8, 2);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(9, 2);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(10, 2);

INSERT INTO recetas(receta_nombre, receta_cantidades_ing, receta_mermas_ing, receta_alta, receta_unidades_sr, receta_costo, receta_porciones, receta_costo_porcion)
	VALUES('fideos al pesto','100-4-60-','0.0-0.0-0.0-0.0-30.0-0.0-', true ,'4-', '762.7', '4',' 190.675');
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(10, 3);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(11, 3);
INSERT INTO ingredientes_recetas(ingre_id_fkey, receta_id_fkey)
	VALUES(12, 3);
INSERT INTO subrecetas_recetas( subreceta_id_fkey, receta_id_fkey)
	VALUES(1, 3);

/*Rubros*/
INSERT INTO rubros(rubro_nombre)
	VALUES("Almacén");
INSERT INTO rubros(rubro_nombre)
	VALUES("Carnicería");
INSERT INTO rubros(rubro_nombre)
	VALUES("Verdulería");

/*Users*/
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('xD6BWKI0', 'Gonzalo', 'Di Nasso', 'gon@gmail.com', 'ADMIN', 'C:|Users|ferlo|Documents|imagenes_costeador|dylan.jpg', 'dylan.jpg', '27949874', true);

INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('5GDfuk9M', 'Julieta', 'Di Nasso', 'juli@gmail.com', 'SUSCRIPTOR', 'C:|Users|ferlo|Documents|imagenes_costeador|avatar.jpg', 'avatar.jpg', '27949874', true);

INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('5GDfak9M', 'Fran', 'Di Nasso', 'fran@gmail.com', 'EDITOR', 'C:|Users|ferlo|Documents|imagenes_costeador|avatar.jpg', 'avatar.jpg', '27949874', true);