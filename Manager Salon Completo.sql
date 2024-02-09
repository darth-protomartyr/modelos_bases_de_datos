CREATE DATABASE salonmanager;
use salonmanager;

CREATE TABLE config_general(
	config_table_total INT, /*nro total de tabs*/
    config_table_num_panes VARCHAR(50), /*número de mesas por pane*/
	config_table_name_panes VARCHAR(200),  /*nombre de cada pane*/
    config_table_chart_panes VARCHAR(50), /*Inicial de cada pane*/
    config_active BOOLEAN
);

CREATE TABLE config_actual(
    config_open_ws BOOLEAN, /*turno actual abierto*/
    config_open_ws_id INT, /*openWsId*/
    config_open_session BOOLEAN, /*sesion actual abierto*/
    config_open_session_id INT, /*openIdSession*/
	config_last_session_time TIMESTAMP
);


CREATE TABLE users(
    user_id VARCHAR(200) UNIQUE,
    user_name VARCHAR(50),
    user_last_name VARCHAR(50),
    user_mail VARCHAR(50) UNIQUE,
    user_role VARCHAR(50),    
    user_image_route VARCHAR(500),
    user_image_name VARCHAR(100),
    user_password VARCHAR(50),
    user_phone VARCHAR(30) UNIQUE,
    user_active boolean
);


CREATE TABLE itemcards(
	itemcard_id INT AUTO_INCREMENT PRIMARY KEY,
    itemcard_code VARCHAR(5) UNIQUE,
    itemcard_name VARCHAR(50),
    itemcard_caption VARCHAR(50),
    itemcard_description VARCHAR(150),
    itemcard_cost DOUBLE,
    itemcard_price DOUBLE,
    itemcard_stock INT,
    itemcard_date_creation DATETIME(3),
    itemcard_date_update DATETIME(3),
    itemcard_tip BOOLEAN,
    itemcard_active BOOLEAN
);

CREATE TABLE tabs(
	table_num INT,
    table_pos VARCHAR(10),
    table_open_time DATETIME(3),
    table_id VARCHAR(50) PRIMARY KEY,
    table_open BOOLEAN,
    table_bill BOOLEAN,
    table_to_pay BOOLEAN,
    table_discount INT,
    table_error DOUBLE,
    table_price_correction DOUBLE,
    table_amount_cash DOUBLE,
    table_amount_electronic DOUBLE,
    table_total DOUBLE,
  	table_comments Varchar(500),
    table_active BOOLEAN
);

CREATE TABLE itemcard_order_tabs(
    itemcard_order_tabs_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcard_order_tabs_active BOOLEAN,
    itemcard_order_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcard_order_id_fkey) REFERENCES itemcards(itemcard_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE itemcard_gift_tabs(
    itemcard_gift_tabs_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcard_gift_tabs_active BOOLEAN,
    itemcard_gift_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcard_gift_id_fkey) REFERENCES itemcards(itemcard_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE itemcard_payed_tabs(
    itemcard_payed_tabs_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcard_payed_tabs_active BOOLEAN,
    itemcard_payed_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcard_payed_id_fkey) REFERENCES itemcards(itemcard_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE itemcard_payed_nd_tabs(
    itemcard_payed_nd_tabs_id INT PRIMARY KEY AUTO_INCREMENT,
    itemcard_payed_nd_tab_active BOOLEAN,
    itemcard_payed_nd_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (itemcard_payed_nd_id_fkey) REFERENCES itemcards(itemcard_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE waiter_tabs(
    waiter_tab_id INT PRIMARY KEY AUTO_INCREMENT,
    waiter_tab_active BOOLEAN,
    waiter_id_fkey VARCHAR(200),
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (waiter_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE registers(
	register_id INT AUTO_INCREMENT PRIMARY KEY,
    register_ejecution DATETIME(3),
    register_user VARCHAR(50),
    register_user_modify VARCHAR(50),
    register_operation VARCHAR(50),
    register_object VARCHAR(30),
    register_modification VARCHAR(2000)
);

CREATE TABLE item_monits(
	item_monit_id VARCHAR(100),
    item_monit_table_id VARCHAR(50),
    item_monit_item_id INT,
    item_monit_tipe VARCHAR(20),
    item_monit_init_bool BOOLEAN,
    item_monit_init_date DATETIME(3),
    item_monit_cook_bool BOOLEAN,
    item_monit_cook_date DATETIME(3),
    item_monit_ready_bool BOOLEAN,
    item_monit_ready_date DATETIME(3),
    item_monit_otw_bool BOOLEAN,
    item_monit_otw_date DATETIME(3),
    item_monit_open BOOLEAN,
    item_monit_active BOOLEAN,
    item_monit_indications VARCHAR(500)
);


CREATE TABLE workshifts(
	workshift_id INT AUTO_INCREMENT PRIMARY KEY,
    workshift_open_shift DATETIME(3), 
	workshift_close_shift DATETIME(3),
	workshift_state_shift BOOLEAN,
	workshift_mount_cash DOUBLE,
	workshift_mount_electronic DOUBLE,
	workshift_total_mount DOUBLE,
	workshift_total_mount_real DOUBLE,
	workshift_error_mount DOUBLE,
	workshift_error_mount_real DOUBLE,
    workshift_active BOOLEAN
);


CREATE TABLE cashier_workshifts(
    cashier_tab_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_tab_active BOOLEAN,
    cashier_id_fkey VARCHAR(200),
    workshift_id_fkey INT,
    FOREIGN KEY (cashier_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (workshift_id_fkey) REFERENCES workshifts(workshift_id)
);


CREATE TABLE sessions(
	session_id INT AUTO_INCREMENT PRIMARY KEY,
    session_open DATETIME(3), 
	session_close DATETIME(3),
	session_state BOOLEAN,
	session_total_mount DOUBLE,
	session_error_mount DOUBLE,
    session_active BOOLEAN
);

CREATE TABLE cashier_session_init(
    cashier_session_init_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_session_init_active BOOLEAN,
    cashier_init_id_fkey VARCHAR(200),
    session_init_id_fkey INT,
    FOREIGN KEY (cashier_init_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (session_init_id_fkey) REFERENCES sessions(session_id)
);

CREATE TABLE cashier_session_ends(
    cashier_session_end_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_session_end_active BOOLEAN,
    cashier_end_id_fkey VARCHAR(200),
    session_end_id_fkey INT,
    FOREIGN KEY (cashier_end_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (session_end_id_fkey) REFERENCES sessions(session_id)
);

CREATE TABLE workshift_sessions(
    workshift_session_id INT PRIMARY KEY AUTO_INCREMENT,
    workshift_session_active BOOLEAN,
    workshift_id_fkey INT,
    session_id_fkey INT,
    FOREIGN KEY (workshift_id_fkey) REFERENCES workshifts(workshift_id),
    FOREIGN KEY (session_id_fkey) REFERENCES sessions(session_id)
);

CREATE TABLE consumers (
	consumer_id INT AUTO_INCREMENT PRIMARY KEY,
    consumer_street VARCHAR(100),
    consumer_street_num VARCHAR(30),
    consumer_dept_floor VARCHAR(20),
    consumer_dept_num VARCHAR(6),
    consumer_district VARCHAR(100),
    consumer_area VARCHAR(100),
    consumer_details VARCHAR(500),
    consumer_name VARCHAR(50),
    consumer_phone VARCHAR(30),
    consume_social_network VARCHAR(50),
    consumer_active BOOLEAN
);

CREATE TABLE consumer_tabs(
    consumer_tabs_id INT PRIMARY KEY AUTO_INCREMENT,
    consumer_tabs_active BOOLEAN,
    consumer_id_fkey INT,
    table_id_fkey VARCHAR(50),
    FOREIGN KEY (consumer_id_fkey) REFERENCES consumers(consumer_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE deliverys(
	delivery_id VARCHAR(50),
    delivery_consumer int,
    delivery_tab VARCHAR(100),
    delivery_user VARCHAR(30),
    delivery_open BOOLEAN,
    delivery_active BOOLEAN
);


/*Config*/
INSERT INTO config(config_table_total, config_table_num_panes, config_table_name_panes, config_table_chart_panes, config_open_ws, config_open_ws_id, config_open_session, config_open_session_id, config_last_session_time, config_active)
	VALUES(12, "12-", "salon-", "s-", false, 0, false, 0, null, true);
    
/*Usuarios*/
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
	VALUES('WDep7urv', 'Gonzalo', 'Di nasso', 'gon@gmail.com', 'ADMIN', 'C:|Users|ferlo|Documents|imagenes_salon|dylan.jpg', 'dylan.jpg', '27949874', "2615613868",  true);
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
	VALUES('WDec7tyv', 'Lucho', 'Velez', 'luch@gmail.com', 'MOZO', '', '', '27949774', '2516473832', true);
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
	VALUES('WDeu7tpv', 'Abi', 'Fritz', 'abi@gmail.com', 'MOZO', '', '', '27944574', '2614733546', true);
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
	VALUES('WDeu7syt', 'Folder', 'Fruitz', 'rolo@gmail.com', 'DELIVERY', '', '', '27944574', '2615613863', true);
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
	VALUES('WDeu7nht', 'Gabi', 'Ritzo', 'gabi@gmail.com', 'DELIVERY', '', '', '27944574', '2615613898', true);


/*Clientes*/
INSERT INTO consumers(consumer_street, consumer_street_num, consumer_dept_floor, consumer_dept_num, consumer_district, consumer_area, consumer_details, consumer_name, consumer_phone, consume_social_network, consumer_active)
	VALUES('José Mármol', '482', '1', 'A3', 'Dorrego', 'Guaymallén', 'Puerta negra de metal', 'Franco Di Nasso', "2613456907", "Twitter @Dignatius12" ,true);

INSERT INTO consumers(consumer_street, consumer_street_num, consumer_dept_floor, consumer_dept_num, consumer_district, consumer_area, consumer_details, consumer_name, consumer_phone, consume_social_network, consumer_active)
	VALUES('Victor Mármol', '472', '', '', 'Dorrego', 'Guaymallén', 'Puerta blanca de chapa', 'Guillermo Di Nasso', "2613456909", "Twitter @Dignatius10" ,true);
    
INSERT INTO consumers(consumer_street, consumer_street_num, consumer_dept_floor, consumer_dept_num, consumer_district, consumer_area, consumer_details, consumer_name, consumer_phone, consume_social_network, consumer_active)
	VALUES('José Bárbol', '489', '', '', 'Dorrego', 'Guaymallén', 'Puerta gris de madera', 'Julieta Di Nasso', "2613456920", "Twitter @Dignatius13" ,true);


/*Items card*/
INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'B1','Coca Cola 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 17:28:35.892',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'B2','Sprite 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 17:52:38.71',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'B3','Fanta 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 18:05:57.279',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'B4','Agua 500','BEBIDAS','Botella 500cm3','350.0','700.0','12','2023-09-01 18:23:13.906',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'B5','Agua c/gas','BEBIDAS','Botella 500','350.0','700.0','12','2023-09-01 18:55:21.699',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'B6','Vino Maleante Malbec','BEBIDAS',' Vino Maleante Malbec por 750 cm3.','1200.0','2500.0','0','2023-09-05 18:36:37.67',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'P1','Lomo Completo','PLATOS','Bife de lomo, tomate, lechuga, jamón, queso, huevo','2000.0','4500.0','0','2023-09-07 17:28:35.892',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'P2','Choripán','PLATOS','Choripán, tomate, huevo','1500.0','3500.0','0','2023-09-04 17:52:38.71',true, true);

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'P3','Pizza Muzzarella','PLATOS','Pizza Muzzarella con aceitunas','1200.0','3000.0','0','2023-09-12 18:05:57.279',true, true);    

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'P4','Pizza Especial','PLATOS','Pizza Muzzarella con aceitunas y jamón','1800.0','3500.0','0','2023-08-12 19:05:57.279',true, true);  
    
INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'P5','Pizza Serrana','PLATOS','Pizza Muzzarella con jamón serrano y rucula','2000.0','4000.0','0','2023-08-12 18:05:57.279',true, true);  

INSERT INTO itemcards(itemcard_code, itemcard_name, itemcard_caption, itemcard_description, itemcard_cost, itemcard_price, itemcard_stock, itemcard_date_creation, itemcard_tip, itemcard_active)
	VALUES( 'P6','Pizza Napolitana','PLATOS','Pizza Muzzarella con aceitunas, tomate y pesto','1800.0','3500.0','0','2023-03-12 18:05:57.279',true, true);  


/*
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_active)
	VALUES('VeDQlNqdTiN2QvKGDISVYA==','8m2WNjRYQJ/wjxf/1ldSrQ==', 'KwjSsk5R48lMu2Id/ItU0Q==', 'BpPQj59jKQnyJvtIgEiDPw==', 'JtcIB/jIonX6g007aK0WuQ==', 'BtUA8NAIqMHUKbIFHu+hhmxccrbrOs6L4QkFWDQ7DJ4YSA5CAJFw6xKr0KIrFm5+ynnLItd766fAGZhrEZmqaA==', 'gebCrDg29V7e1XkR7moUGQ==', 'LvpxCndaQ9U4XJeRILdEGg==', true);
*/