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
	config_active VARCHAR(100), /*estado de la config*/
	config_terminal_kitchen VARCHAR(100), /*estado terminal cocina */
	config_terminal_waiter VARCHAR(100) /*estado terminal mozos */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS config_actual(
    config_open_ws VARCHAR(100),/*turno actual abierto*/
    config_open_ws_id VARCHAR(100), /*openWsId*/
	config_indexes_buttons VARCHAR (5000),
    config_tokken VARCHAR(100),
    config_update_cashier VARCHAR(100),
    config_update_waiter VARCHAR(100),
    config_update_chef VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE IF NOT EXISTS consumers (
	consumer_id VARCHAR(100) PRIMARY KEY,
    consumer_street VARCHAR(100),
    consumer_street_num VARCHAR(100),
    consumer_dept_floor VARCHAR(100),
    consumer_dept_num VARCHAR(100),
    consumer_district VARCHAR(100),
    consumer_area VARCHAR(100),
    consumer_details VARCHAR(5000),
    consumer_name VARCHAR(100),
    consumer_lastname VARCHAR(100),
    consumer_phone VARCHAR(100),
    consumer_social_network VARCHAR(100),
    consumer_active VARCHAR(100)
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
    item_monit_ws_id VARCHAR(100),
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
    item_monit_indications VARCHAR(5000),
    item_monit_to_watch VARCHAR(100),
    item_monit_anuled VARCHAR(100)
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

CREATE TABLE IF NOT EXISTS waiter_workshifts(
	waiter_workshift_id VARCHAR(100) PRIMARY KEY,
    waiter_workshift_active VARCHAR(100),
    waiter_id_fkey VARCHAR(200),
    workshift_id_fkey VARCHAR(100),
    FOREIGN KEY (waiter_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (workshift_id_fkey) REFERENCES workshifts(workshift_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS chef_workshifts(
	chef_workshift_id VARCHAR(100) PRIMARY KEY,
    chef_workshift_active VARCHAR(100),
    chef_id_fkey VARCHAR(200),
    workshift_id_fkey VARCHAR(100),
    FOREIGN KEY (chef_id_fkey) REFERENCES users(user_id),
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
    attempt_user_id VARCHAR(100) PRIMARY KEY,
    attempt_ip_address VARCHAR(100),
    attempt_time VARCHAR(100),
    attempt_count VARCHAR(20),
    attempt_is_blocked VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS failed_attempts_tokken (
    attempt_tokken_time VARCHAR(100),
    attempt_tokken_count VARCHAR(20),
    attempt_tokken_is_blocked VARCHAR(100)
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

/*ADMIN*/
INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES('c2OuJxQqABPRxKy/kPXW2A==', '5FB3bF4LheVY0H6KFiHt/g==', '+RzQUjtQ3UxomiHSZ0fmuQ==', 'S9FqHlkcN9TEgUKgVz/iTA==', 'M88re0RIWY4NF0w7/z6VRg==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDii4eUS9Zkgo93svn72ZXyX2r61k8ydfmPyOR1FhTHWuLmxVlzHSrQCRLmIortSRA5', 'fJ5rBMyacmtSuKFHHH34nA==', 'mfaEjOqNlJsxISmRZ33MdQ==', 'EtvVCnIlzRb1kVZUnbvHxg==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('c2OuJxQqABPRxKy/kPXW2A==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

/*WAITER*/
INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES ('2vvta/FxVZrx0LnHV1o1hQ==', 'QRCsHA2XcWk4Ac701foTQw==', 'sAO9BHdAVjaRXiIsWwilwQ==', 'hVFgEuga1V9Q3mPemVSRWQ==', 'bv2ha6jljpAl7dOl6aOVYg==', 'UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=', 'EJl5Rx42MVsOtfOvn7JcRA==', 'bksAKCCiy+276R0setIqgA==', 'A0qPUcwXR5TCVcPFTmhJvQ==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('2vvta/FxVZrx0LnHV1o1hQ==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES('Sj/an1ATwGJMnFdlYALugg==', 'XL8ni+01yoi1rijLH+M/QQ==', 'jhEO7tqfHYb3oxAUrLXQaQ==', '2bQ4sPCWzqqNKSmr/1A8Lg==', 'bv2ha6jljpAl7dOl6aOVYg==', 'UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=', 'EJl5Rx42MVsOtfOvn7JcRA==', 'MuBNBKsKVk4mMQbdaaB4HQ==', '5OWzUhs8mITFdLUxTMRorw==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('Sj/an1ATwGJMnFdlYALugg==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

/*DELIVERY*/
INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active) 
VALUES('+4nmfIJvZS+4BjBP1O7JuQ==', 'NO5yj7pQy1xfFtgklexYxg==', 'uvbROt/OhL+sjODdHct6fA==', '91YykS5APUj+hv37BWf3Sg==', 'INIKjDsbEsznKLwFmrgNAw==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'Cwshhq0bCO0DfChF6YX97g==', '7xb/d+X2gc1sObFJRJm46A==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('+4nmfIJvZS+4BjBP1O7JuQ==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES('0Y5fBhpjfddGEAL5j/tgiQ==', 'wd1VjMtB0vv9aVckQne63u6pWmTI3Ilc8iLlnlf5lfA=', 'WBdapT4Pe5436nTIBs9b4Q==', 'p8A//bVlvusZseb0/mYCFw==', 'INIKjDsbEsznKLwFmrgNAw==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'Cwshhq0bCO0DfChF6YX97g==', 'Zi8w6vzrmrlda2PL0TaOGw==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('0Y5fBhpjfddGEAL5j/tgiQ==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active) 
VALUES('obZQObtlJpAhIUIIPLOHCA==', 'QRCsHA2XcWk4Ac701foTQw==', '6f69CIAZqNMDNskG8gcD5A==', 'Sitwsd4DuUfe/Q7nccI0UrSCY4uIq8oA8PG4e754zm8=', 'INIKjDsbEsznKLwFmrgNAw==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'Cwshhq0bCO0DfChF6YX97g==', 'SDWn0csok4GFznUslGXHAQ==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) 
VALUES('obZQObtlJpAhIUIIPLOHCA==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

/*Config*/
INSERT IGNORE INTO config_general(config_table_total, config_table_num_panes, config_table_name_panes, config_table_chart_panes, config_table_name_categories, config_table_tip, config_modkey, config_active, config_terminal_kitchen, config_terminal_waiter)
VALUES('6:', 'G2H3a8RgTJzktiQ28nKaEg==', 'HvAr7HMgFxu3jaxIMKfejQ==', 'CJhWHxf5rgNRsIvW1vwccA==', 'yALOUvaDGUFzi3yAgbq1nlnK1A/gjKmVg98NNj/YLtc2Uj6qkgmq79G1ApHAYROiCwshhq0bCO0DfChF6YX97g==', '21', 'dthhQYITGuY/5I6/tcf01g==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

INSERT INTO config_actual(config_open_ws, config_open_ws_id, config_indexes_buttons, config_tokken, config_update_cashier, config_update_waiter, config_update_chef)VALUES('K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', '1', 'x7bka9p5GM+yFNNZ6/H22g==', 'Zg1TI/3yh5v12hteBV/GZQ==', 'GAZ7H8bRLXtDTHXPZKKtXA==', 'GAZ7H8bRLXtDTHXPZKKtXA==', 'GAZ7H8bRLXtDTHXPZKKtXA==');

/*Tokken fail*/
INSERT INTO failed_attempts_tokken(attempt_tokken_time, attempt_tokken_count, attempt_tokken_is_blocked)
VALUES("zRxkWw+Dyx6M+gv0zqO79A==", "1", "K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u");

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

INSERT IGNORE INTO consumers(consumer_id, consumer_street, consumer_street_num, consumer_dept_floor, consumer_dept_num, consumer_district, consumer_area, consumer_details, consumer_name, consumer_lastname, consumer_phone, consumer_social_network, consumer_active)VALUES('2', 'a8dssl4DwaUBZEVkOZ4l8w==', '42di7RLCcJPHB4gxbrDoHQ==', 'MxyuI1iRndQg8r3ImtVuOA==', 'MxyuI1iRndQg8r3ImtVuOA==', 'xXYXf0+U+SRf5fFDYlin6w==', 'B+L83g+pb/bsT42oYrcItw==', 'g7pvkdEIWypwFeABOAFStA==', 'pI31lVQTA+ve9VBfyH/MaA==', 'JWOaojhyt9t8JsYUUCj4zw==', 'MHAfUtazhe8lzBp51ye08A==', 'yKQWXd2W9asS7zSZYFf2dc6MJgm7FH4QPxod2YDtRWc=', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO consumers(consumer_id, consumer_street, consumer_street_num, consumer_dept_floor, consumer_dept_num, consumer_district, consumer_area, consumer_details, consumer_name, consumer_lastname, consumer_phone, consumer_social_network, consumer_active)VALUES('3', 'GlbjJioajyGW2QlJPAENolVaCre9Ird8JN47NjIrVHA=', 'wBHGlDusfSwPGfLCQj6heg==', 'MxyuI1iRndQg8r3ImtVuOA==', 'MxyuI1iRndQg8r3ImtVuOA==', 'BZZ72d2fh/olRRdPx2/iKQ==', 'kgDLXunllYyQw6VEjVkCZw==', 'WdEPWmTMFV8mCRxViufTpqfukJ0D4vyulgsEfunPC3Q=', '+A8S6bLjh991D3bHASzdHQ==', '4kPhtgfIwyHiussm3r2BzQ==', 'w3sn15pDmJJUJAQRazjYJA==', 'daEtqIb/iYeDgmNIji/Iba//to0rc5groyi2BksI9+c=', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');


/*
INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES('RuJNDtd0B9OH2Z0fSUwr3Q==', 'fBn7gZUuGCPgdYDZSAzx7g==', '+gO7INot4KCbb1IbKMcgoA==', 'H0Ps07DvcLPoi1OBcunz6Q==', 'INIKjDsbEsznKLwFmrgNAw==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'Cwshhq0bCO0DfChF6YX97g==', 'Dr6uuNNJpNJFXCmBIFGeAQ==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try)
VALUES('RuJNDtd0B9OH2Z0fSUwr3Q==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);


INSERT IGNORE INTO `users` VALUES ('9s1kkkKyIOLk3vMB7YpZ7w==','5MOOxvi8bhJUjrdNvjNDNQ==','Vi/5CC/hilask9jKpYZrFA==','SdLA8CDpMed+/LKgz/bLtx3YZ3IZvMYoLPcfkhIB6gg=','bv2ha6jljpAl7dOl6aOVYg==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','doz4iWV1ZqHRiFV+vzr7uQ==','BIfCc63b0mGgeFhdH5vbOA==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) VALUES('9s1kkkKyIOLk3vMB7YpZ7w==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO `users` VALUES ('bjuQM48aNx9CJbHex8Xzsw==','4JFYkSuzyGfogjMZMAra+Q==','24wt53kpAa7qb6njcPoVvA==','sohkCJwCrsYAjPCv0D7rVSQ63zseWMKLT6OA6HAHPgY=','bv2ha6jljpAl7dOl6aOVYg==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','doz4iWV1ZqHRiFV+vzr7uQ==','bM9/3eZmDZlAFTaxGhpm5g==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) VALUES('bjuQM48aNx9CJbHex8Xzsw==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);

INSERT IGNORE INTO `users` VALUES ('r9tXUZi7LVb9FV9l+SgNBQ==','F0fzwNSSmea71rs47a1RSA==','ah/h30vC7RPXO6+dzSvnUg==','oQR96+M3vGVjeIKJuTDib7SCY4uIq8oA8PG4e754zm8=','bv2ha6jljpAl7dOl6aOVYg==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','doz4iWV1ZqHRiFV+vzr7uQ==','4Wy+Lj05cM81tDaGO+xWQQ==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try) VALUES('r9tXUZi7LVb9FV9l+SgNBQ==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);
*/

/*chef
INSERT IGNORE INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
VALUES('5u/KnRbxA1ykfzSyygqm7A==', 'pEKNOzRzeONiRKfwlVL6OQ==', 'uz3dv9HGKkhPBamjGvpyug==', 'j0jq2OX151FxoiE5NRuBLTRcMzoJhQnoiJ5jZyHZGDw=', 'jI7J2+R34f8pRGqrWopTMA==', 'UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=', 'EJl5Rx42MVsOtfOvn7JcRA==', 'mfaEjOqNlJsxISmRZ33MdQ==', 'MzSSnYZt1U6PzZ6jnC3Zww==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO users_block_status(block_status_user_id, block_status, block_status_attempt_count, block_status_end, block_status_first_try)
VALUES('5u/KnRbxA1ykfzSyygqm7A==', 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1', null, null);
*/

INSERT IGNORE INTO `item_cards` VALUES ('21','sXv9vBIoBOWsupafyn8taw==','/1GcI9xwraDwQqNMnn017nasNiFERFuQ+dMt3h08asA=','vJE0iCtYQQkdgPmO1UHFrw==','8BbRvt87p+kLBv+KKkzAvgBCiv8jQsdtK3uOAHiMMdOXQeuwOjj7N8zGNVZKbseDYZEDZBdmlYjeCNjcb/bDIlveTBtg53gTDRX1jdK+Y1M=','8111/1','yeW2K5bT0Z3EFnggMr9R59aSwWxOe8gK76eQEl4xcmE=','23','SuTQlOQ/N5iYiJon8Emiyg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('22','NrvATbrJT1n2JF6DGICRHQ==','xBxCceYbODV56Nn8RBnqHg==','cHJ6Jv8NGi+AtZJa4SPWZQ==','ALcL+iUk2pSFsfJiMLSwZMCxWa6ZzZLjD3eIZi3UZn235HVvz9rij0HcXqU2xfftMYiVLGipFHYSrijIyC8dEJEf0TG+yXBEKbY8VEUtFgVMkLxwv5m6WRt+DqYAN9wY1zvcjMYyzoKZ5ThKd4lbgtjYSU58MlULcV1pTdTT5Nrh0XgnNTZSCNbTy2olqWei','4611/1','tFG1DInYbKP1erhKB2NJouEpL5+PWR+jV+wNxR0MOIE=','23','6l0SYLZviVo9sqjI/Eha5A==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('23','+4UbnH/QUgkXBfXMR199mg==','wwzMdVkgv3dM5lMxpmKAmryZHwOkYIXJcYzKvqgAgvI=','cHJ6Jv8NGi+AtZJa4SPWZQ==','CsAjjwnHX8fasOfY1RGnYxHAjaWWNAGLCItoCnDSi+aJxON/00BFfb91ykCT1hvxguMrKBsyYHczlkvkkRcnjXIhROEuG0R7TBUpkMOWFf0xcdRDW8Ncjrq6VPgoCntweaucS1V3VdCtyAzJICSK+VNNjLmHrcKb9sDy4IcnPkhnL3rfbKyDG0o3INpNyr3c','3111/1','/YGzaqGrJRy58wqnxsKxYuEpL5+PWR+jV+wNxR0MOIE=','23','BPHznfn5heov0Tv5JwqMDg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('24','7drx+GveifhqYjceOq38qA==','mc1OXxAQI/eUcHBPBNqX4wsLIYatGwjtA3woRemF/e4=','cHJ6Jv8NGi+AtZJa4SPWZQ==','kgh4zGO1W65Hc5RDKGCd+5zMTlIjhlCeUFRki70vgSMxiJUsaKkUdhKuKMjILx0QZnHANwOWWgrRvP9oGYkDcl+I7Saqaoyc9NuvuyzXaSeqrKfhg3l/QGOqS9v2UvR6irEB6TidsZZka1a4/YSRdc9WkawGELHCjkOi0G8kV+CJXofJG2esNBOO1+3/AkOM','4111/1','rGZUQiZ81OMhjf2wZlzZnOEpL5+PWR+jV+wNxR0MOIE=','23','V4vBtE+b7ihQY9VHrCx1ZA==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('25','R64UrEX/JScqBMcUC0dUiA==','gKsifiP31rvqc/1HpL8RtQ==','cHJ6Jv8NGi+AtZJa4SPWZQ==','mahSDPfS6j7qEDHy5vJqGbD7hO47uLAVCdpCxAfZFbFgtxRdZTYg0Bu1fGoJ+6U5SWOdbPkvohDqXZ33JM2VJHnBYLCDp0TM5a5l5I0yLjIkQXBNbqtx25OUKvw9ijg9RzeTytdnIZu5tJ4+DKJhjlVrrtR1VDo8zs2iVPreMLRdBA6YglnWKs4SIe8uIeTOCwshhq0bCO0DfChF6YX97g==','5111/1','/w7q9FIOfmv9pLEeh9I4UeEpL5+PWR+jV+wNxR0MOIE=','23','GZJoo6Emhv+y2utrHaUVdQ==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('26','mfmxdlChCf5QrujuA4TFFg==','AHRQi8+/keQc4p/ovyCmqA==','cHJ6Jv8NGi+AtZJa4SPWZQ==','RY7EuAwrqzX9prseiI9XxbpBxFXpPf6v9eBSy8Thzc1NlVSOj0dBpdrIwQwQGybrKIwb2/lXpUN7IND6U8COWpvqZZacqbKv2yFyiP8sq60Uc0vIYbhfPFNA5MEPJ4o4tZWodELuoSbt8gql6toSMbZGDmsXn6R4TkcsFWhV/CoydNPNOIPBkqCE1hTVcihL','5111/1','/w7q9FIOfmv9pLEeh9I4UeEpL5+PWR+jV+wNxR0MOIE=','23','zNm+cg9XCHp66M9pDfSouQ==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('3','y3PGsd8HnJxFBx/C2pqCaA==','OVBT0qbXQN8kqR2Ellujng==','oq+ndGGeFoWVRa7z+jTQTg==','FJ2wr4H6At55DBm/9zwEZyyraaJxtmiwSRoaYGXPuq8=',':11/1','lnug34IzEKzvPAEBMYDBLOEpL5+PWR+jV+wNxR0MOIE=','35','YIowkPNeDYiS/h4B9wOi0w==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('4','8G+77TicvtTcmbpyVzXr5g==','DaL4r5my318qVoC9/DAzKQ==','vJE0iCtYQQkdgPmO1UHFrw==','9zBF3Gug15j/31ixbPqHnO2NTY513eIuFoDqVFlYiQYnER8+ZT8jz17iwh8AZhMPnIaTMW1cjxIirTUjSHnsv27OJbSA7zOhbKFvXAqBTJY=','5611/1','UO4oUroCGzkvoQSjpoSJCeEpL5+PWR+jV+wNxR0MOIE=','23','yYf34eImWvBvhL9gdFk80g==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('5','Wp+niVwi6v6LzKJbRjOudA==','6B54uSV9ZLxd3TbvVSD92gsLIYatGwjtA3woRemF/e4=','vJE0iCtYQQkdgPmO1UHFrw==','+scnP2qNMDw/m4UZWrgypyP4cef/g8F7wU0q8DbI2g8sDGG3LUSe+bAyWAwW2JvmTkH4ZzxfFl+nQCqf/NSi3e0u3RzeEaJ5rASg9yVzG0tmLSLVMY0mb52G3wamg3Um','6111/1','25iBUvKYbR/wX2dbqVvPkNaSwWxOe8gK76eQEl4xcmE=','23','m5AFzEh6TnhE2znoUOH4Qg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('6','xiRKQWM7XC8mXJpXqbx70Q==','mL+MgchAmPqFGi9b/nU6eg==','vJE0iCtYQQkdgPmO1UHFrw==','atAt+5SVedUUav6rALxvUaAlHx6SNheaGaz3p+wn+hdgBzOX+ScztZxR8btKP9VyZFgSdWnRlPQw4UDfg2kgHE3tDUhS1QlOsVdyjWYefTK1aukQNvPFEssitB+28N13','7111/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=','23','1UN/yMw1vStYVFYJ6ZVing==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('7','apu3jEYWzkJ2HraOmy3zaA==','Tr5ylQOddEl/pvCgcoHrsw==','vJE0iCtYQQkdgPmO1UHFrw==','enz3ZXgkLdxQ7gq9lvaj7JebByk+huRKsc82YnmnmgoQT7xA30K3iXNhXZ9R58sVOVbqKrnTsFxfZVn8FVIvo62p/GgamEZYbZAFGSRuDErVCvpuT1ZRXEDsQFTt4uLd','6111/1','25iBUvKYbR/wX2dbqVvPkNaSwWxOe8gK76eQEl4xcmE=','23','3lqkArUua1V//mG0nYxzvA==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('8','EXzNdTx1FpLoeEBBSYxZmg==','dsRdqSBQqcagj715QzQbZA==','vJE0iCtYQQkdgPmO1UHFrw==','yqpLFtloQN1z/mDIGWVJfQklgz86W5vYAhtgOmOn3VYYMXpCYMu0USKvngYHTzlyJibis4aiqL3oFjgDOr1NtIhmhmpdcW3S6IVXl7kxzRo=','7111/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=','23','pw8FV2OoPv5sIGp7RKLIXg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES ('9','dthUIxK1m3JpuZG/q1NV/g==','bq+DU4sBZT/kX3Qdyvxj3w==','vJE0iCtYQQkdgPmO1UHFrw==','mwZdt0co4efeP5ZE4EX0JJAkQgF61cys66gCrQ+yStpZN3VgMZLNcFUhJg6tp6wDy/AixqOuLK2qbgoNU5MklJFeCESKY5UcHjlJ/9ALbKM=','7111/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=','23','3AmwPm8h/nPFZWrvTXH3sg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT IGNORE INTO `item_cards` VALUES (':','BLCYxlw97rL6S2VYTJXTgg==','Jpw4kYPoESltLXBzugdCVg==','vJE0iCtYQQkdgPmO1UHFrw==','eYt4bJSTCyOG3gXkr0TUfyudlA5ozByahaQLtQtouUkgf62apFSdkDBd/Xm6gf595D9VWZm9qi2Bzs6cIu8cqhZ8oZcvx1EoZZixikPEeF8=','8111/1','yeW2K5bT0Z3EFnggMr9R59aSwWxOe8gK76eQEl4xcmE=','23','Kuf4RQecGYf495aZe+y7iw==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');