/*TABLAS*/
/*TABLAS*/
/*TABLAS*/
/*TABLAS*/
CREATE DATABASE salonmanager;
USE salonmanager;
CREATE TABLE IF NOT EXISTS config_general(
    config_table_total VARCHAR(100), /*nro total de tabs*/
    config_table_num_panes VARCHAR(100), /*número de mesas por pane*/
    config_table_name_panes VARCHAR(2000), /*nombre de cada pane*/
    config_table_chart_panes VARCHAR(200), /*Inicial de cada pane*/
    config_table_name_categories VARCHAR(2000), /*nombre de rubros*/
    config_table_tip VARCHAR(100), /*porcentaje propina*/
	config_active VARCHAR(100)                  
);

CREATE TABLE IF NOT EXISTS config_actual(
    config_open_ws VARCHAR(100),/*turno actual abierto*/
    config_open_ws_id VARCHAR(100), /*openWsId*/
    config_defer_close_ws VARCHAR(5000),
    config_unmod_tabs VARCHAR(5000),
	config_indexes_buttons VARCHAR (5000)
);


CREATE TABLE IF NOT EXISTS item_cards(
    item_card_id VARCHAR(100) PRIMARY KEY,
    item_card_code VARCHAR(100) UNIQUE,
    item_card_name VARCHAR(100),
    item_card_category VARCHAR(100),
    item_card_description VARCHAR(2500),
    item_card_cost VARCHAR(100),
    item_card_price VARCHAR(100),
    item_card_stock VARCHAR(100),
    item_card_date_creation TIMESTAMP(3),
    item_card_date_update TIMESTAMP(3),
    item_card_tip VARCHAR(100),
	item_card_active VARCHAR(100)   
);


CREATE TABLE IF NOT EXISTS tabs(
	table_num VARCHAR(100),
    table_pos VARCHAR(100),
    table_open_time TIMESTAMP(3),
    table_close_time TIMESTAMP(3),
    table_id VARCHAR(100) PRIMARY KEY,
    table_open VARCHAR(100),
    table_bill VARCHAR(100),
    table_to_pay VARCHAR(100),
    table_discount VARCHAR(100),
    table_error VARCHAR(100),
    table_price_correction VARCHAR(100),
    table_amount_cash VARCHAR(100),
    table_amount_electronic VARCHAR(100),
    table_total VARCHAR(100),
    table_comments VARCHAR(500),
    table_active VARCHAR(100)
);
    
CREATE TABLE IF NOT EXISTS workshifts(
	workshift_id VARCHAR(100) PRIMARY KEY,
    workshift_open_time_shift TIMESTAMP(3),
    workshift_close_time_shift TIMESTAMP(3),
    workshift_state_shift VARCHAR(100),
    workshift_mount_cash VARCHAR(100),
    workshift_mount_electronic VARCHAR(100),
    workshift_total_mount_tabs VARCHAR(100),
    workshift_total_mount_ws VARCHAR(100),
    workshift_error_mount_tabs VARCHAR(100),
    workshift_error_mount_ws VARCHAR(100),
    workshift_cash_flow_cash VARCHAR(100),
    workshift_cash_flow_elec VARCHAR(100),
    workshift_comment VARCHAR(5000),
    workshift_error VARCHAR(100),
    workshift_active VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS users(
	user_id VARCHAR(200) UNIQUE PRIMARY KEY,
    user_name VARCHAR(100),
    user_last_name VARCHAR(100),
    user_mail VARCHAR(100) UNIQUE,
    user_role VARCHAR(100),
    user_image_route VARCHAR(5000),
    user_image_name VARCHAR(100),
    user_password VARCHAR(100),
    user_phone VARCHAR(100) UNIQUE,
    user_active VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS categories(
	category_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS spaces(
	space_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS chars(
	char_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS deliverys(
	delivery_id VARCHAR(100),
    delivery_consumer_phone VARCHAR(100),
    delivery_tab_id VARCHAR(100),
    delivery_user_id VARCHAR(30),
    delivery_open VARCHAR(100),
    delivery_active VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS delivery_clients (
	delivery_client_id VARCHAR(100) PRIMARY KEY,
    delivery_client_street VARCHAR(100),
    delivery_client_street_num VARCHAR(100),
    delivery_client_dept_floor VARCHAR(100),
    delivery_client_dept_num VARCHAR(100),
    delivery_client_district VARCHAR(100),
    delivery_client_area VARCHAR(100),
    delivery_client_details VARCHAR(5000),
    delivery_client_name VARCHAR(100),
    delivery_client_lastname VARCHAR(100),
    delivery_client_phone VARCHAR(100),
    delivery_client_social_network VARCHAR(100),
    delivery_client_active VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS item_card_order_tabs(
	item_card_order_tab_id VARCHAR(100),
	item_card_order_tab_active VARCHAR(100),
    item_card_order_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_order_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE IF NOT EXISTS item_card_gift_tabs(
	item_card_gift_tab_id VARCHAR(100),
    item_card_gift_tab_active VARCHAR(100),
    item_card_gift_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_gift_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
    );

CREATE TABLE IF NOT EXISTS item_card_payed_tabs(
	item_card_payed_tab_id VARCHAR(100),
    item_card_payed_tab_active VARCHAR(100),
    item_card_payed_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_payed_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE IF NOT EXISTS item_card_payed_nd_tabs(
	item_card_payed_nd_tab_id VARCHAR(100),
    item_card_payed_nd_tab_active VARCHAR(100),
    item_card_payed_nd_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_payed_nd_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE IF NOT EXISTS item_monits(
	item_monit_id VARCHAR(100),
    item_monit_table_id VARCHAR(100),
    item_monit_item_id VARCHAR(100),
    item_monit_tipe VARCHAR(100),
    item_monit_init_bool VARCHAR(100),
    item_monit_init_date DATETIME(3),
    item_monit_cook_bool VARCHAR(100),
    item_monit_cook_date DATETIME(3),
    item_monit_ready_bool VARCHAR(100),
    item_monit_ready_date DATETIME(3),
    item_monit_otw_bool VARCHAR(100),
    item_monit_otw_date DATETIME(3),
    item_monit_open VARCHAR(100),
    item_monit_active VARCHAR(100),
    item_monit_indications VARCHAR(5000)
);
 
 CREATE TABLE IF NOT EXISTS item_sales_statics(
	item_sale_static_id VARCHAR(100),
    item_sale_id VARCHAR(100),
    item_sale_category VARCHAR(100),
    item_sale_tab_pos VARCHAR(100),
	item_sale_waiter_id VARCHAR(100),
    item_sale_workshift_id VARCHAR(100),
    item_sale_cost VARCHAR(100),
    item_sale_price VARCHAR(100),
    item_sale_client_id VARCHAR(100),
    item_sale_date DATETIME(3),
    item_sale_active VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS money_flows(
	money_flow_id VARCHAR(100) PRIMARY KEY,
    money_flow_kind VARCHAR(100),
    money_flow_m_k VARCHAR(100),
    money_flow_amount VARCHAR(100),
    money_flow_comment VARCHAR(5000),
    money_flow_date TIMESTAMP(3),
    money_flow_ws_id VARCHAR(100),
    money_flow_active VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS waiter_tabs(
    waiter_tab_id VARCHAR(100),
    waiter_tab_active VARCHAR(100),
    waiter_id_fkey VARCHAR(200),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (waiter_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);

CREATE TABLE IF NOT EXISTS cashier_workshifts(
	cashier_workshift_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_workshift_active VARCHAR(100),
    cashier_id_fkey VARCHAR(200),
    workshift_id_fkey VARCHAR(100),
    FOREIGN KEY (cashier_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (workshift_id_fkey) REFERENCES workshifts(workshift_id)
);

CREATE TABLE IF NOT EXISTS registers(
	register_id VARCHAR(100) PRIMARY KEY,
    register_ejecution DATETIME(3),
    register_userId VARCHAR(100),
    register_object_kind VARCHAR(100),
    register_object_id VARCHAR(100),
    register_operation VARCHAR(100)
);


/*CONFIGURACIONES NO ENCRIPTADAS*/
INSERT INTO config_general(config_table_total, config_table_num_panes, config_table_name_panes, config_table_chart_panes,  config_table_name_categories, config_table_tip , config_active)VALUES('36', '12-24', 'salón-vereda', 's-v', 'PANIF. DUL-PANIF. SAL', '0', 'true');
INSERT INTO config_actual(config_open_ws, config_open_ws_id, config_defer_close_ws, config_unmod_tabs, config_indexes_buttons) VALUES('false', '0', '', '', '0-0');

/*CATEGORIAS - CHAR - SPACES*/
INSERT INTO spaces(space_name)VALUES('salón');
INSERT INTO chars(char_name)VALUES('s');
INSERT INTO spaces(space_name)VALUES('vereda');
INSERT INTO chars(char_name)VALUES('v');
INSERT INTO categories(category_name)VALUES('PANIF. DUL');
INSERT INTO categories(category_name)VALUES('PANIF. SAL');

/*ADMIN*/
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('uT6dWCAh', 'Mariana', 'Bastias', 'mbastias382@gmail.com', 'ADMIN', 'resources|avatar.jpg', 'avatar.jpg', 'lana', '456575522', 'true');

/*MOZO*/
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('2XQ9fQcb', 'Adam', 'Grietten', 'adam@gmail.com', 'MOZO', 'resources|avatar.jpg', 'avatar.jpg', '1234', '234566174', 'true');
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('utMiNG5y', 'Eddie', 'Vedder', 'vedder@gmail.com', 'DELIVERY', 'C:|Users|Gonzalo|Documents|NetbeansProject|SalonManager|resources|images|avatar.jpg', 'avatar.jpg', '', '2143646134', 'true');

INSERT INTO delivery_clients(delivery_client_id, delivery_client_street, delivery_client_street_num, delivery_client_dept_floor, delivery_client_dept_num, delivery_client_district, delivery_client_area, delivery_client_details, delivery_client_name, delivery_client_lastname, delivery_client_phone, delivery_client_social_network, delivery_client_active)VALUES('4', 'Four Strings', '12', '--', '--', 'Torontown', 'Amoeba', 'Casa de campo', 'Neil', 'Young', '32567523', 'twitter: @defeat', 'true');
INSERT INTO delivery_clients(delivery_client_id, delivery_client_street, delivery_client_street_num, delivery_client_dept_floor, delivery_client_dept_num, delivery_client_district, delivery_client_area, delivery_client_details, delivery_client_name, delivery_client_lastname, delivery_client_phone, delivery_client_social_network, delivery_client_active)VALUES('2', 'Floorpainter', '4566', '--', '--', 'Aberdeen', 'Guayinton', 'Trailer de dealer', 'Kurt', 'Cobain', '34560998', 'forchan: @heeeywaaait', 'true');

INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '1', 'O1', 'Alfajor', 'PANIF. DUL','Alfajor de maizena','450.0','950.0-0.0-950.0-0.0-', '12', '2024-11-07 23:33:03.049', 'true', 'true');

INSERT INTO workshifts(workshift_id, workshift_open_time_shift, workshift_close_time_shift, workshift_state_shift, workshift_mount_cash, workshift_mount_electronic, workshift_error_mount_tabs, workshift_error_mount_ws, workshift_total_mount_tabs, workshift_total_mount_ws, workshift_cash_flow_cash, workshift_cash_flow_elec, workshift_comment, workshift_error, workshift_active) VALUES( '1', '2024-11-08 15:18:56.233', null, 'true', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', 'false', 'true');
INSERT INTO registers(register_id, register_ejecution, register_userId, register_object_kind, register_object_id, register_operation)VALUES('1', '2024-11-08 15:18:56.252', 'uT6dWCAh', 'Turno', '1', 'CREACION - ');
INSERT INTO cashier_workshifts(cashier_workshift_active, cashier_id_fkey, workshift_id_fkey) VALUES( 'true', 'uT6dWCAh', '1');
UPDATE config_actual SET config_open_ws = 'true';
UPDATE config_actual SET config_open_ws_id = '1';
INSERT INTO tabs(table_num, table_pos, table_open_time, table_close_time, table_id, table_open, table_bill, table_to_pay, table_discount, table_error, table_price_correction, table_amount_cash, table_amount_electronic, table_total, table_comments, table_active) VALUES( '1', 's', '2024-11-08 15:19:01.206', null, '1s_2024-11-08_15:19:01.206', 'true', 'false', 'false', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '', 'true');
INSERT INTO registers(register_id, register_ejecution, register_userId, register_object_kind, register_object_id, register_operation)VALUES('2', '2024-11-08 15:19:10.705', 'uT6dWCAh', 'Orden', '1s_2024-11-08_15:19:01.206', 'CREACION - 1s_2024-11-08_15:19:01.206');
INSERT INTO waiter_tabs(waiter_id_fkey, table_id_fkey) VALUES('2XQ9fQcb', '1s_2024-11-08_15:19:01.206');
UPDATE tabs SET table_total = '950.0' WHERE table_id = '1s_2024-11-08_15:19:01.206';
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '1s_2024-11-08_15:19:01.206');
UPDATE item_cards SET item_card_stock = '11' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '1s_2024-11-08_15:19:01.206_1', '1s_2024-11-08_15:19:01.206', '1', 'mesa', 'true', '2024-11-08 15:19:10.753', 'false', null, 'false', null, 'false', null, 'true', 'true', '');
UPDATE tabs SET table_total = '950.0' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_bill = 'true' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_amount_cash = '0.0' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_amount_electronic = '950.0' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_close_time = '2024-11-08 15:19:20.413' WHERE table_id = '1s_2024-11-08_15:19:01.206';
INSERT INTO item_sales_statics( item_sale_static_id, item_sale_id, item_sale_waiter_id, item_sale_category, item_sale_tab_pos, item_sale_workshift_id, item_sale_cost, item_sale_price, item_sale_client_id, item_sale_date, item_sale_active)VALUES('1', '1', '2XQ9fQcb', 'PANIF. DUL', 'tab', '1', '450.0', '950.0', '0', '2024-11-08 15:19:20.457', 'true');
UPDATE tabs SET table_total = '950.0' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_open = 'false' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_open = 'false' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE tabs SET table_comments = '' WHERE table_id = '1s_2024-11-08_15:19:01.206';
UPDATE item_monits SET item_monit_open = 'false' WHERE item_monit_id = '1s_2024-11-08_15:19:01.206_1';
INSERT INTO tabs(table_num, table_pos, table_open_time, table_close_time, table_id, table_open, table_bill, table_to_pay, table_discount, table_error, table_price_correction, table_amount_cash, table_amount_electronic, table_total, table_comments, table_active) VALUES( '12', 's', '2024-11-08 15:19:45.23', null, '12s_2024-11-08_15:19:45.23', 'true', 'false', 'false', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '', 'true');
INSERT INTO registers(register_id, register_ejecution, register_userId, register_object_kind, register_object_id, register_operation)VALUES('3', '2024-11-08 15:19:52.557', 'uT6dWCAh', 'Orden', '12s_2024-11-08_15:19:45.23', 'CREACION - 12s_2024-11-08_15:19:45.23');
INSERT INTO waiter_tabs(waiter_id_fkey, table_id_fkey) VALUES('2XQ9fQcb', '12s_2024-11-08_15:19:45.23');
UPDATE tabs SET table_total = '5700.0' WHERE table_id = '12s_2024-11-08_15:19:45.23';
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '12s_2024-11-08_15:19:45.23');
UPDATE item_cards SET item_card_stock = '10' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '12s_2024-11-08_15:19:45.23_1', '12s_2024-11-08_15:19:45.23', '1', 'mesa', 'true', '2024-11-08 15:19:52.589', 'false', null, 'false', null, 'false', null, 'true', 'true', '');
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '12s_2024-11-08_15:19:45.23');
UPDATE item_cards SET item_card_stock = '9' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '12s_2024-11-08_15:19:45.23_1', '12s_2024-11-08_15:19:45.23', '1', 'mesa', 'true', '2024-11-08 15:19:52.621', 'false', null, 'false', null, 'false', null, 'true', 'true', '');
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '12s_2024-11-08_15:19:45.23');
UPDATE item_cards SET item_card_stock = '8' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '12s_2024-11-08_15:19:45.23_1', '12s_2024-11-08_15:19:45.23', '1', 'mesa', 'true', '2024-11-08 15:19:52.637', 'false', null, 'false', null, 'false', null, 'true', 'true', '');
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '12s_2024-11-08_15:19:45.23');
UPDATE item_cards SET item_card_stock = '7' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '12s_2024-11-08_15:19:45.23_1', '12s_2024-11-08_15:19:45.23', '1', 'mesa', 'true', '2024-11-08 15:19:52.673', 'false', null, 'false', null, 'false', null, 'true', 'true', '');
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '12s_2024-11-08_15:19:45.23');
UPDATE item_cards SET item_card_stock = '6' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '12s_2024-11-08_15:19:45.23_1', '12s_2024-11-08_15:19:45.23', '1', 'mesa', 'true', '2024-11-08 15:19:52.693', 'false', null, 'false', null, 'false', null, 'true', 'true', '');
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('true', '1', '12s_2024-11-08_15:19:45.23');
UPDATE item_cards SET item_card_stock = '5' WHERE item_card_id = '1';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( '12s_2024-11-08_15:19:45.23_1', '12s_2024-11-08_15:19:45.23', '1', 'mesa', 'true', '2024-11-08 15:19:52.709', 'false', null, 'false', null, 'false', null, 'true', 'true', '');