CREATE TABLE item_monitoring(
	itemMonit_id VARCHAR(50),
    itemMonit_table_id VARCHAR(50),
    itemMonit_item_id INT,
    itemMonit_tipe VARCHAR(20),
    itemMonit_init_bool BOOLEAN,
    itemMonit_init_date DATETIME(3),
    itemMonit_cook_bool BOOLEAN,
    itemMonit_cook_date DATETIME(3),    
    itemMonit_ready_bool BOOLEAN,
    itemMonit_ready_date DATETIME(3),     
    itemMonit_otw_bool BOOLEAN,
    itemMonit_otw_date DATETIME(3),
    itemMonit_paid_bool BOOLEAN,
    itemMonit_paid_date DATETIME(3)
);

/*
CREATE TABLE delivery (
    itemMonit_delivery_id INT,
    itemMonit_delivery_name VARCHAR(50),
    itemMonit_delivery_lastname VARCHAR(50),
    itemMonit_client_name,
    itemMonit_
)
*/

-- Crear el trigger para la tabla de origen
DELIMITER //
CREATE TRIGGER after_insert_update
AFTER INSERT ON tabla_origen
FOR EACH ROW
BEGIN
    -- Actualizar el campo en la tabla de destino después de la inserción
    UPDATE tabla_destino
    SET nombre_actualizado = NEW.nombre
    WHERE id = NEW.id;
END;
//
DELIMITER ;

-- También puedes crear un trigger para UPDATE si quieres manejar actualizaciones
DELIMITER //
CREATE TRIGGER after_update_update
AFTER UPDATE ON tabla_origen
FOR EACH ROW
BEGIN
    -- Actualizar el campo en la tabla de destino después de la actualización
    UPDATE tabla_destino
    SET nombre_actualizado = NEW.nombre
    WHERE id = NEW.id;
END;
//
DELIMITER ;