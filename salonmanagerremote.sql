/*TABLAS*/
/*TABLAS*/
/*TABLAS*/
/*TABLAS*/
CREATE DATABASE IF NOT EXISTS salonmanager DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;
USE salonmanager;
CREATE TABLE IF NOT EXISTS config_general(
    config_table_total VARCHAR(100), /*nro total de tabs*/
    config_table_num_panes VARCHAR(100), /*número de mesas por pane*/
    config_table_name_panes VARCHAR(2000), /*nombre de cada pane*/
    config_table_chart_panes VARCHAR(200), /*Inicial de cada pane*/
    config_table_name_categories VARCHAR(2000), /*nombre de rubros*/
    config_table_tip VARCHAR(100), /*porcentaje propina*/
    config_modkey VARCHAR(100), /*Clave de modificación*/
	config_active VARCHAR(100)                  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS config_actual(
    config_open_ws VARCHAR(100),/*turno actual abierto*/
    config_open_ws_id VARCHAR(100), /*openWsId*/
	config_indexes_buttons VARCHAR (5000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE config_defer_close_tabs (
	config_defer_close_tab_id VARCHAR(100) PRIMARY KEY,
    config_defer_close_tab_active VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_cards(
    item_card_id VARCHAR(100) PRIMARY KEY,
    item_card_code VARCHAR(100) UNIQUE,
    item_card_name VARCHAR(100),
    item_card_category VARCHAR(100),
    item_card_description VARCHAR(2500),
    item_card_cost VARCHAR(100),
    item_card_price VARCHAR(100),
    item_card_stock VARCHAR(100),
    item_card_date_creation VARCHAR(100),
    item_card_date_update VARCHAR(100),
    item_card_tip VARCHAR(100),
	item_card_active VARCHAR(100)   
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS tabs(
	table_num VARCHAR(100),
    table_pos VARCHAR(100),
    table_open_time VARCHAR(100),
    table_close_time VARCHAR(100),
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
    table_workshift VARCHAR(100),
    table_active VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    
CREATE TABLE IF NOT EXISTS workshifts(
	workshift_id VARCHAR(100) PRIMARY KEY,
    workshift_open_time_shift VARCHAR(100),
    workshift_close_time_shift VARCHAR(100),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS categories(
	category_name VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS spaces(
	space_name VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS chars(
	char_name VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS deliverys(
	delivery_id VARCHAR(100) PRIMARY KEY,
    delivery_consumer_phone VARCHAR(100),
    delivery_tab_id VARCHAR(100),
    delivery_user_id VARCHAR(30),
    delivery_open VARCHAR(100),
    delivery_active VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_card_order_tabs(
	item_card_order_tab_id VARCHAR(100) PRIMARY KEY,
	item_card_order_tab_active VARCHAR(100),
    item_card_order_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_order_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_card_gift_tabs(
	item_card_gift_tab_id VARCHAR(100) PRIMARY KEY,
    item_card_gift_tab_active VARCHAR(100),
    item_card_gift_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_gift_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_card_payed_tabs(
	item_card_payed_tab_id VARCHAR(100) PRIMARY KEY,
    item_card_payed_tab_active VARCHAR(100),
    item_card_payed_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_payed_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_card_payed_nd_tabs(
	item_card_payed_nd_tab_id VARCHAR(100) PRIMARY KEY,
    item_card_payed_nd_tab_active VARCHAR(100),
    item_card_payed_nd_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_payed_nd_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS workshift_unmod_tabs (
	workshift_unmod_tab_id VARCHAR(100) PRIMARY KEY,
    workshift_unmod_tab_value VARCHAR(100),
    workshift_unmod_tab_ws_id VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_monits(
	item_monit_id VARCHAR(100) PRIMARY KEY,
    item_monit_table_id VARCHAR(100),
    item_monit_item_id VARCHAR(100),
    item_monit_tipe VARCHAR(100),
    item_monit_init_bool VARCHAR(100),
    item_monit_init_date VARCHAR(100),
    item_monit_cook_bool VARCHAR(100),
    item_monit_cook_date VARCHAR(100),
    item_monit_ready_bool VARCHAR(100),
    item_monit_ready_date VARCHAR(100),
    item_monit_otw_bool VARCHAR(100),
    item_monit_otw_date VARCHAR(100),
    item_monit_open VARCHAR(100),
    item_monit_active VARCHAR(100),
    item_monit_indications VARCHAR(5000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
 CREATE TABLE IF NOT EXISTS item_sales_statics(
	item_sale_static_id VARCHAR(100) PRIMARY KEY,
    item_sale_id VARCHAR(100),
    item_sale_category VARCHAR(100),
    item_sale_tab_pos VARCHAR(100),
	item_sale_waiter_id VARCHAR(100),
    item_sale_workshift_id VARCHAR(100),
    item_sale_cost VARCHAR(100),
    item_sale_price VARCHAR(100),
    item_sale_client_id VARCHAR(100),
    item_sale_date VARCHAR(100),
    item_sale_active VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS money_flows(
	money_flow_id VARCHAR(100) PRIMARY KEY,
    money_flow_kind VARCHAR(100),
    money_flow_m_k VARCHAR(100),
    money_flow_amount VARCHAR(100),
    money_flow_comment VARCHAR(5000),
    money_flow_date VARCHAR(100),
    money_flow_ws_id VARCHAR(100),
    money_flow_active VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS waiter_tabs(
    waiter_tab_id VARCHAR(100) PRIMARY KEY,
    waiter_tab_active VARCHAR(100),
    waiter_id_fkey VARCHAR(200),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (waiter_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS cashier_workshifts(
	cashier_workshift_id VARCHAR(100) PRIMARY KEY,
    cashier_workshift_active VARCHAR(100),
    cashier_id_fkey VARCHAR(200),
    workshift_id_fkey VARCHAR(100),
    FOREIGN KEY (cashier_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (workshift_id_fkey) REFERENCES workshifts(workshift_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS registers(
	register_id VARCHAR(100) PRIMARY KEY,
    register_ejecution VARCHAR(100),
    register_userId VARCHAR(100),
    register_object_kind VARCHAR(100),
    register_object_id VARCHAR(100),
    register_operation VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS error_stacks(
	error_stack_id VARCHAR(100) PRIMARY KEY,
    error_stack_date VARCHAR(100),
    error_stack_text VARCHAR(5000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS failed_attempts (
    attemp_user_id VARCHAR(100) PRIMARY KEY,
    attemp_ip_address VARCHAR(100),
    attemp_time VARCHAR(100),
    attempt_count VARCHAR(20),
    attemp_is_blocked VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS users_block_status (
    block_status_user_id VARCHAR(100) PRIMARY KEY, 
    block_status VARCHAR(100), 
    block_status_attempt_count VARCHAR(20), 
    block_status_end VARCHAR(100),
	block_status_first_try VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*ENTRADAS*/
/*ENTRADAS*/
/*ENTRADAS*/
/*ENTRADAS*/
/*USER*/
/*USER*/
INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES('c2OuJxQqABPRxKy/kPXW2A==', '5FB3bF4LheVY0H6KFiHt/g==', '+RzQUjtQ3UxomiHSZ0fmuQ==', 'S9FqHlkcN9TEgUKgVz/iTA==', 'M88re0RIWY4NF0w7/z6VRg==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDii4eUS9Zkgo93svn72ZXyX2r61k8ydfmPyOR1FhTHWuLmxVlzHSrQCRLmIortSRA5', 'fJ5rBMyacmtSuKFHHH34nA==', 'mfaEjOqNlJsxISmRZ33MdQ==', 'EtvVCnIlzRb1kVZUnbvHxg==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('c2OuJxQqABPRxKy/kPXW2A==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO config_general(config_table_total, config_table_num_panes, config_table_name_panes, config_table_chart_panes, config_table_name_categories, config_table_tip , config_modkey, config_active)VALUES('229', 'Kh69/u/QInaNFVqhgbs33Q==', 'o9Nsq2IO3JttCN1UyPjxDQhzspSwR6f1vYbyJLcnx7I=', '3f652EZDFac1av7SuYw/BA==', 'yALOUvaDGUFzi3yAgbq1nlnK1A/gjKmVg98NNj/YLtc2Uj6qkgmq79G1ApHAYROiCwshhq0bCO0DfChF6YX97g==', '21', 'dthhQYITGuY/5I6/tcf01g==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO config_actual(config_open_ws, config_open_ws_id, config_indexes_buttons)VALUES('K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', '1', 'x7bka9p5GM+yFNNZ6/H22g==');



INSERT IGNORE INTO categories(category_name)VALUES('vJE0iCtYQQkdgPmO1UHFrw==');
INSERT IGNORE INTO categories(category_name)VALUES('oq+ndGGeFoWVRa7z+jTQTg==');
INSERT IGNORE INTO categories(category_name)VALUES('QvhC0YyKkb+kHspXS3N7ug==');
INSERT IGNORE INTO categories(category_name)VALUES('99y4KhBCS3ZbirBVAQd0ig==');
INSERT IGNORE INTO categories(category_name)VALUES('cHJ6Jv8NGi+AtZJa4SPWZQ==');
INSERT IGNORE INTO categories(category_name)VALUES('BsOSSiksfXMpJ2bjNzRm6A==');
INSERT IGNORE INTO categories(category_name)VALUES('NlM2TVDCyk88sO9Bg19dRQ==');
INSERT IGNORE INTO categories(category_name)VALUES('puEq3qaOs63+2iQpl2/EtQ==');
INSERT IGNORE INTO categories(category_name)VALUES('ja/VBo/i753G3PBFQhwCiQ==');
INSERT IGNORE INTO categories(category_name)VALUES('zatBMBmei9d068q239VJhA==');
INSERT IGNORE INTO categories(category_name)VALUES('ME0GRKLK63WlQ4HSogwNQg==');
INSERT IGNORE INTO categories(category_name)VALUES('/HiphkqA6tuhoJxd12hZkQ==');
INSERT IGNORE INTO categories(category_name)VALUES('IQaqUCs7F9QVP6pskF+osA==');
INSERT IGNORE INTO categories(category_name)VALUES('lTn5UNcRhKkPYRyje/XNxQ==');

INSERT IGNORE INTO spaces(space_name)VALUES('kr9FPCHZNULu2Rd+WRBKfw==');
INSERT IGNORE INTO chars(char_name)VALUES('4DGEGm380j1veqRaESm0XA==');
INSERT IGNORE INTO spaces(space_name)VALUES('gBssOtGvtk5dum9jDlbmUw==');
INSERT IGNORE INTO chars(char_name)VALUES('mp5Dplj/sbi3D5XKdGSOqg==');
INSERT IGNORE INTO spaces(space_name)VALUES('Nhqu7QVAElpZI2OUXnYcjw==');
INSERT IGNORE INTO chars(char_name)VALUES('wkX9vSxYN2lKSHBEtQA9Ww==');
INSERT IGNORE INTO spaces(space_name)VALUES('6t51xrHrtwbNyTCoXNCe6w==');
INSERT IGNORE INTO chars(char_name)VALUES('m9zxrulihJiX6idVm17Nuw==');
INSERT IGNORE INTO spaces(space_name)VALUES('f5WebHIAnVcMXPq3museXw==');
INSERT IGNORE INTO chars(char_name)VALUES('t9OP6Yue4LYUl3MxX98FnQ==');
INSERT IGNORE INTO spaces(space_name)VALUES('0luuqsaK0U3+ykh/L2j5xQ==');
INSERT IGNORE INTO chars(char_name)VALUES('o42Gv9GJ8bMVgPemehHQOw==');
INSERT IGNORE INTO spaces(space_name)VALUES('Qj03zVC3VaugmycKGcJQow==');
INSERT IGNORE INTO chars(char_name)VALUES('pxWX9eR0L1daK4/bFbTuYQ==');
INSERT IGNORE INTO spaces(space_name)VALUES('Iv9pyXUcQZlzYNyfJUPmgw==');
INSERT IGNORE INTO chars(char_name)VALUES('e6hb1xIADTZW19PqacZFjw==');
INSERT IGNORE INTO spaces(space_name)VALUES('quT9g3Ig6Ef5FejezGFUZw==');
INSERT IGNORE INTO chars(char_name)VALUES('xUbBrCswPqYoULLBtI3lpQ==');
INSERT IGNORE INTO spaces(space_name)VALUES('w3tURT+QFzvP8nvVc09Yrw==');
INSERT IGNORE INTO chars(char_name)VALUES('tsoCPT0IQgTiDC6YA1WGaQ==');
INSERT IGNORE INTO spaces(space_name)VALUES('xCos15Avkq9RZALZTaBVJw==');
INSERT IGNORE INTO chars(char_name)VALUES('3Gt04JXQbjBdecdaxf0CGw==');

INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('uJC6Kf14A5dHMp+lHTjiZg==', 'q/vjhIIdVCNUxcdb/mkHFQ==', '24wt53kpAa7qb6njcPoVvA==', 'nRBR0CPOQaoShhtEN1hgUg==', 'DADiihVREcn88R30VPihog==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDii4eUS9Zkgo93svn72ZXyX2r61k8ydfmPyOR1FhTHWuLmxVlzHSrQCRLmIortSRA5', 'EJl5Rx42MVsOtfOvn7JcRA==', 'cYEMsnfQAYk72uLgPNQ7pg==', 'lrhireJqxi+pe9giEUTBow==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
UPDATE users SET user_role = 'bv2ha6jljpAl7dOl6aOVYg==' WHERE user_id = 'uJC6Kf14A5dHMp+lHTjiZg==';
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) VALUES('uJC6Kf14A5dHMp+lHTjiZg==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('dKRG0//TWJ8BosoNSLVwDA==', 'uOxJYnR3WPEDqRfbaUSi/g==', '+RzQUjtQ3UxomiHSZ0fmuQ==', 'y+WfCGTeuSNjZ0fPv1Bn1Q==', 'DADiihVREcn88R30VPihog==', 'UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=', 'EJl5Rx42MVsOtfOvn7JcRA==', 'aYA2dgrwH0UOx+7jdRLN5w==', 'cdiHwOsPCHsIfoS+oqsshw==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
UPDATE users SET user_role = 'bv2ha6jljpAl7dOl6aOVYg==' WHERE user_id = 'dKRG0//TWJ8BosoNSLVwDA==';
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) VALUES('dKRG0//TWJ8BosoNSLVwDA==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('RuJNDtd0B9OH2Z0fSUwr3Q==', 'fBn7gZUuGCPgdYDZSAzx7g==', '+gO7INot4KCbb1IbKMcgoA==', 'H0Ps07DvcLPoi1OBcunz6Q==', 'INIKjDsbEsznKLwFmrgNAw==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'Cwshhq0bCO0DfChF6YX97g==', 'Dr6uuNNJpNJFXCmBIFGeAQ==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT IGNORE INTO delivery_clients(delivery_client_id, delivery_client_street, delivery_client_street_num, delivery_client_dept_floor, delivery_client_dept_num, delivery_client_district, delivery_client_area, delivery_client_details, delivery_client_name, delivery_client_lastname, delivery_client_phone, delivery_client_social_network, delivery_client_active)VALUES('2', 'a8dssl4DwaUBZEVkOZ4l8w==', '42di7RLCcJPHB4gxbrDoHQ==', 'MxyuI1iRndQg8r3ImtVuOA==', 'MxyuI1iRndQg8r3ImtVuOA==', 'xXYXf0+U+SRf5fFDYlin6w==', 'B+L83g+pb/bsT42oYrcItw==', 'g7pvkdEIWypwFeABOAFStA==', 'pI31lVQTA+ve9VBfyH/MaA==', 'JWOaojhyt9t8JsYUUCj4zw==', 'MHAfUtazhe8lzBp51ye08A==', 'yKQWXd2W9asS7zSZYFf2dc6MJgm7FH4QPxod2YDtRWc=', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO delivery_clients(delivery_client_id, delivery_client_street, delivery_client_street_num, delivery_client_dept_floor, delivery_client_dept_num, delivery_client_district, delivery_client_area, delivery_client_details, delivery_client_name, delivery_client_lastname, delivery_client_phone, delivery_client_social_network, delivery_client_active)VALUES('3', 'GlbjJioajyGW2QlJPAENolVaCre9Ird8JN47NjIrVHA=', 'wBHGlDusfSwPGfLCQj6heg==', 'MxyuI1iRndQg8r3ImtVuOA==', 'MxyuI1iRndQg8r3ImtVuOA==', 'BZZ72d2fh/olRRdPx2/iKQ==', 'kgDLXunllYyQw6VEjVkCZw==', 'WdEPWmTMFV8mCRxViufTpqfukJ0D4vyulgsEfunPC3Q=', '+A8S6bLjh991D3bHASzdHQ==', '4kPhtgfIwyHiussm3r2BzQ==', 'w3sn15pDmJJUJAQRazjYJA==', 'daEtqIb/iYeDgmNIji/Iba//to0rc5groyi2BksI9+c=', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '2', 't9aQ9FmDqSugvBL4bZpB2g==', 'bq+DU4sBZT/kX3Qdyvxj3w==', 'vJE0iCtYQQkdgPmO1UHFrw==','poerm5eIaZkCs9dYxeqjI+Hbz1GisPw1gbrFgIs9VqlN+dNg7LQH4XRoY5/YKwKNGogsr7T797DSK0stQ+XtlQ==','5611/1','UO4oUroCGzkvoQSjpoSJCeEpL5+PWR+jV+wNxR0MOIE=', '23', '27JXL7Ej20vC1+grZ+umUg==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '3', 'y3PGsd8HnJxFBx/C2pqCaA==', 'OVBT0qbXQN8kqR2Ellujng==', 'oq+ndGGeFoWVRa7z+jTQTg==','FJ2wr4H6At55DBm/9zwEZyyraaJxtmiwSRoaYGXPuq8=',':11/1','lnug34IzEKzvPAEBMYDBLOEpL5+PWR+jV+wNxR0MOIE=', '35', 'YIowkPNeDYiS/h4B9wOi0w==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES(?,?,?,?,?,?,?,?,?,?,?);
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES(?,?,?,?,?,?,?,?,?,?,?);
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES(?,?,?,?,?,?,?,?,?,?,?);



/*





/*
INSERT INTO tabs(table_num, table_pos, table_open_time, table_close_time, table_id, table_open, table_bill, table_to_pay, table_discount, table_error, table_price_correction, table_amount_cash, table_amount_electronic, table_total, table_comments, table_active) VALUES( '21', '4DGEGm380j1veqRaESm0XA==', '2024-11-07 16:03:46.053', null, 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', '1', '1/1', '1/1', '1/1', '1/1', '1/1', 'Cwshhq0bCO0DfChF6YX97g==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO registers(register_id, register_ejecution, register_userId, register_object_kind, register_object_id, register_operation)VALUES('4', '2024-11-07 16:03:54.004', 'c2OuJxQqABPRxKy/kPXW2A==', 'usn2bdx2tF/GEbUsY068Vw==', 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=', 'IIczSIO0POrnPOR+xaKLotoieyeI4b0CFIlosE31qcuDm1BzQOnAHwx4JoCc11jA');
INSERT INTO waiter_tabs(waiter_id_fkey, table_id_fkey) VALUES('dKRG0//TWJ8BosoNSLVwDA==', 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=');
UPDATE tabs SET table_total = '5611/1' WHERE table_id = 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=';
INSERT INTO item_card_order_tabs( item_card_order_tab_active, item_card_order_id_fkey, table_id_fkey) VALUES('K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', '7', 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=');
UPDATE item_cards SET item_card_stock = '34' WHERE item_card_id = '7';
INSERT INTO item_monits(item_monit_id, item_monit_table_id, item_monit_item_id, item_monit_tipe, item_monit_init_bool, item_monit_init_date, item_monit_cook_bool, item_monit_cook_date, item_monit_ready_bool, item_monit_ready_date, item_monit_otw_bool, item_monit_otw_date, item_monit_open, item_monit_active, item_monit_indications) VALUES( 'vYE4HSBqPWILbEKhzh4yoAEue1vEIqQcqC5NewRkJzw=', 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=', '7', '1ckgTmMrzojTbX3xAwBcQw==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', '2024-11-07 16:03:54.04', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', null, 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', null, 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', null, 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'Cwshhq0bCO0DfChF6YX97g==');
UPDATE workshifts SET workshift_mount_cash = '1/1' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_mount_electronic = ':111/1' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_total_mount_tabs = ':111/1' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_total_mount_ws = ':111/1' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_error = 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_error_mount_ws = '1/1' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_close_time_shift = '2024-11-07 16:04:01.34' WHERE workshift_id = '2';
INSERT INTO registers(register_id, register_ejecution, register_userId, register_object_kind, register_object_id, register_operation)VALUES('5', '2024-11-07 16:04:08.691', 'c2OuJxQqABPRxKy/kPXW2A==', 'OGcZWWuU5x4c90iZf9V0IQ==', 'blLvUsU8V7dogEDDLrtoQA==', 'q5fm+pwlyiIa2VGD8KyiLA==');
UPDATE workshifts SET workshift_state_shift = 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u' WHERE workshift_id = '2';
UPDATE workshifts SET workshift_comment = 'Cwshhq0bCO0DfChF6YX97g==' WHERE workshift_id = '2';
UPDATE config_actual SET config_open_ws = 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u';
UPDATE config_actual SET config_open_ws_id = '1';
UPDATE config_actual SET config_unmod_tabs = 'Cwshhq0bCO0DfChF6YX97g==';
UPDATE config_actual SET config_indexes_buttons = 'x7bka9p5GM+yFNNZ6/H22g==';
INSERT INTO workshifts(workshift_id, workshift_open_time_shift, workshift_close_time_shift, workshift_state_shift, workshift_mount_cash, workshift_mount_electronic, workshift_error_mount_tabs, workshift_error_mount_ws, workshift_total_mount_tabs, workshift_total_mount_ws, workshift_cash_flow_cash, workshift_cash_flow_elec, workshift_comment, workshift_error, workshift_active) VALUES( '3', '2024-11-07 16:04:01.534', null, 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', '1/1', '1/1', '1/1', '1/1', '1/1', '1/1', '1/1', '1/1', 'Ll1PzMOIzVLnRHvXOfwjA0FW0sHVFjDibRbaZhEWuRneCzzvRcTvCrwQs5T4SUBSBqdXHLQMUr43zPLkgxMzRVRTaKiWqipwkYmvb4/bOwk=', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO registers(register_id, register_ejecution, register_userId, register_object_kind, register_object_id, register_operation)VALUES('6', '2024-11-07 16:04:08.755', 'c2OuJxQqABPRxKy/kPXW2A==', 'OGcZWWuU5x4c90iZf9V0IQ==', 'QPlleEVL2EJfp1T/F/vqCQ==', 'QIWbb3+El2V3/jk7xfU55w==');
UPDATE config_actual SET config_open_ws = 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u';
UPDATE config_actual SET config_open_ws_id = '3';
UPDATE item_card_order_tabs SET item_card_order_tab_active = 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u' WHERE table_id_fkey = 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=';
UPDATE tabs SET table_active = 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u' WHERE table_id = 'vYE4HSBqPWILbEKhzh4yoHKRWvnrQEw0E5N1bWPPmDo=';


