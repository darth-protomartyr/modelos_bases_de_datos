CREATE DATABASE costorecetas;
use costorecetas;
CREATE TABLE ingredientes(
	ingre_id INT AUTO_INCREMENT PRIMARY KEY,
    ingre_rubro VARCHAR(20),
    ingre_nombre VARCHAR(20) UNIQUE,
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
    subreceta_costo_parcial double,
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
    receta_precioPorcion DOUBLE
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