CREATE DATABASE salonmanager;
use salonmanager;

CREATE TABLE config(
	config_table_total int, /*nro total de mesas*/
    config_table_numPanes VARCHAR(50),
	config_table_namePanes VARCHAR(200),  /*nombre de panes*/
    config_table_chartPanes VARCHAR(50)
);


CREATE TABLE users(
    user_id VARCHAR(200) UNIQUE,
    user_name VARCHAR(200),
    user_last_name VARCHAR(200),
    user_mail VARCHAR(200) UNIQUE,
    user_role VARCHAR(200),    
    user_image_route VARCHAR(200),
    user_image_name VARCHAR(200),
    user_password VARCHAR(200),
    user_code_permission int,
    user_alta boolean
);

CREATE TABLE itemscarta(
	itemCarta_id INT AUTO_INCREMENT PRIMARY KEY,
    itemCarta_code VARCHAR(5) UNIQUE,
    itemCarta_name VARCHAR(50),
    itemCarta_caption VARCHAR(50),
    itemCarta_description VARCHAR(150),
    itemCarta_cost DOUBLE,
    itemCarta_price DOUBLE,
    itemCarta_stock INT,
    itemCarta_dateCreation TIMESTAMP,
    itemCarta_dateUpdate TIMESTAMP,
    itemCarta_tip BOOLEAN,
    itemCarta_alta BOOLEAN
);

CREATE TABLE mesas(
	table_num INT,
    table_pos VARCHAR(1),
    table_open_time TIMESTAMP,
    table_id VARCHAR(50) PRIMARY KEY,
    table_open BOOLEAN,
    table_bill BOOLEAN,
    table_discount INT,
    table_error DOUBLE,
    table_price_correction DOUBLE,
    table_amount_cash DOUBLE,
    table_amount_electronic DOUBLE,
    table_total DOUBLE
);

CREATE TABLE itemscartaOrder_mesas(
    itemscartaOrder_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcartaOrder_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcartaOrder_id_fkey) references itemscarta(itemCarta_id),
    FOREIGN KEY (table_id_fkey) references mesas(table_id)
);

CREATE TABLE itemscartaGift_mesas(
    itemscartaGift_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcartaGift_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcartaGift_id_fkey) references itemscarta(itemCarta_id),
    FOREIGN KEY (table_id_fkey) references mesas(table_id)
);


CREATE TABLE itemscartaPayed_mesas(
    itemscartaPayed_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcartaPayed_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcartaPayed_id_fkey) references itemscarta(itemCarta_id),
    FOREIGN KEY (table_id_fkey) references mesas(table_id)
);


CREATE TABLE itemscartaPayedND_mesas(
    itemscartaPayedND_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcartaPayedND_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcartaPayedND_id_fkey) references itemscarta(itemCarta_id),
    FOREIGN KEY (table_id_fkey) references mesas(table_id)
);

CREATE TABLE itemscartaError_mesas(
    itemscartaError_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcartaError_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcartaError_id_fkey) references itemscarta(itemCarta_id),
    FOREIGN KEY (table_id_fkey) references mesas(table_id)
);


CREATE TABLE waiter_mesas(
    waiter_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    waiter_id_fkey VARCHAR(200),
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (waiter_id_fkey) references users(user_id),
    FOREIGN KEY (table_id_fkey) references mesas(table_id)
);


CREATE TABLE registers(
	register_id INT AUTO_INCREMENT PRIMARY KEY,
    register_ejecution TIMESTAMP,
    register_user VARCHAR(50),
    register_user_modify VARCHAR(50),
    register_operation VARCHAR(50),
    register_object VARCHAR(30),
    register_modification VARCHAR(2000)
);


CREATE TABLE workshifts(
	workshift_id INT AUTO_INCREMENT PRIMARY KEY,
    workshift_open_shift TIMESTAMP, 
	workshift_close_shift TIMESTAMP,
	workshift_state_shift BOOLEAN,
	workshift_mount_cash DOUBLE,
	workshift_mount_electronic DOUBLE,
	workshift_error_mount DOUBLE,
	workshift_error_mount_real DOUBLE,
	workshift_total_mount DOUBLE,
	workshift_total_mount_real DOUBLE
);


CREATE TABLE cashier_workshifts(
    cashier_mesas_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_id_fkey VARCHAR(200),
    workshift_id_fkey INT,
    FOREIGN KEY (cashier_id_fkey) references users(user_id),
    FOREIGN KEY (workshift_id_fkey) references workshifts(workshift_id)
);



/*Config*/
INSERT INTO config(config_table_total, config_table_numPanes, config_table_namePanes, config_table_chartPanes)
	VALUES(72,"48-24-", "salon-vereda-", "s-v-");
    
    
/*Usuarios*/
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('WDep7urv', 'Gonzalo', 'Di nasso', 'gon@gmail.com', 'ADMIN', 'C:|Users|ferlo|Documents|imagenes_salon|dylan.jpg', 'dylan.jpg', '27949874', true);
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('WDec7tyv', 'Lucho', 'Velez', 'luch@gmail.com', 'MOZO', '', '', '27949774', true);
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('WDeu7tpv', 'Abi', 'Fritz', 'abi@gmail.com', 'MOZO', '', '', '27944574', true);
    
    
/*Items Carta*/
INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'B1','Coca Cola 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 17:28:35.892',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'B2','Sprite 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 17:52:38.71',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'B3','Fanta 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 18:05:57.279',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'B4','Agua 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 18:23:13.906',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'B5','Agua c/gas','BEBIDAS','Botella 500','350.0','700.0','12','2023-09-01 18:55:21.699',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'B6','Vino Maleante Malbec','BEBIDAS',' Vino Maleante Malbec por 750 cm3.','1200.0','2500.0','0','2023-09-05 18:36:37.67',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'P1','Lomo Completo','PLATOS','Bife de lomo, tomate, lechuga, jamón, queso, huevo','2000.0','4500.0','0','2023-09-07 17:28:35.892',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'P2','Choripán','PLATOS','Choripán, tomate, huevo','1500.0','3500.0','0','2023-09-04 17:52:38.71',true, true);

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'P3','Pizza Muzzarella','PLATOS','Pizza Muzzarella con aceitunas','1200.0','3000.0','0','2023-09-12 18:05:57.279',true, true);    

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'P4','Pizza Especial','PLATOS','Pizza Muzzarella con aceitunas y jamón','1800.0','3500.0','0','2023-08-12 19:05:57.279',true, true);  
    
INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'P5','Pizza Serrana','PLATOS','Pizza Muzzarella con jamón serrano y rucula','2000.0','4000.0','0','2023-08-12 18:05:57.279',true, true);  

INSERT INTO itemsCarta(itemCarta_code, itemCarta_name, itemCarta_caption, itemCarta_description, itemCarta_cost, itemCarta_price, itemCarta_stock, itemCarta_dateCreation, itemCarta_tip, itemCarta_alta)
	VALUES( 'P6','Pizza Napolitana','PLATOS','Pizza Muzzarella con aceitunas, tomate y pesto','1800.0','3500.0','0','2023-03-12 18:05:57.279',true, true);  


/*
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_alta)
	VALUES('VeDQlNqdTiN2QvKGDISVYA==','8m2WNjRYQJ/wjxf/1ldSrQ==', 'KwjSsk5R48lMu2Id/ItU0Q==', 'BpPQj59jKQnyJvtIgEiDPw==', 'JtcIB/jIonX6g007aK0WuQ==', 'BtUA8NAIqMHUKbIFHu+hhmxccrbrOs6L4QkFWDQ7DJ4YSA5CAJFw6xKr0KIrFm5+ynnLItd766fAGZhrEZmqaA==', 'gebCrDg29V7e1XkR7moUGQ==', 'LvpxCndaQ9U4XJeRILdEGg==', true);
*/