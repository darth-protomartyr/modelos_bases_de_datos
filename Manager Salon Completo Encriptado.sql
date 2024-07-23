CREATE DATABASE salonmanager;
use salonmanager;

CREATE TABLE config_general(
	config_table_total VARCHAR(100), /*nro total de tabs*/
    config_table_num_panes VARCHAR(100), /*número de mesas por pane*/
  	config_table_name_categories VARCHAR(2000),  /*nombre de rubros*/
	config_table_name_panes VARCHAR(2000),  /*nombre de cada pane*/
    config_table_chart_panes VARCHAR(200), /*Inicial de cada pane*/
    config_table_tip VARCHAR(100), /*porcentaje propina*/
    config_active VARCHAR(100)
);


CREATE TABLE config_actual(
    config_open_ws VARCHAR(100), /*turno actual abierto*/
    config_open_ws_id VARCHAR(100), /*openWsId*/
    congif_defer_close_ws VARCHAR(5000),
    congif_unmod_tabs VARCHAR(5000)
);


CREATE TABLE item_cards(
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


CREATE TABLE tabs(
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


CREATE TABLE workshifts(
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


CREATE TABLE users(
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


CREATE TABLE categories(
    category_name VARCHAR(100)
);


CREATE TABLE spaces(
    space_name VARCHAR(100)
);


CREATE TABLE chars(
    char_name VARCHAR(100)
);


CREATE TABLE deliverys(
	delivery_id VARCHAR(100),
    delivery_consumer_phone VARCHAR(100),
    delivery_tab_id VARCHAR(100),
    delivery_user_id VARCHAR(30),
    delivery_open VARCHAR(100),
    delivery_active VARCHAR(100)
);


CREATE TABLE delivery_clients (
	delivery_client_id VARCHAR(100) PRIMARY KEY,
    delivery_client_street VARCHAR(100),
    delivery_client_street_num VARCHAR(100),
    delivery_client_dept_floor VARCHAR(100),
    delivery_client_dept_num VARCHAR(100),
    delivery_client_district VARCHAR(100),
    delivery_client_area VARCHAR(100),
    delivery_client_details VARCHAR(5000),
    delivery_client_name VARCHAR(100),
    delivery_client_phone VARCHAR(35),
    delivery_client_social_network VARCHAR(100),
    delivery_client_active VARCHAR(100)
);


CREATE TABLE item_card_order_tabs(
    item_card_order_tab_id VARCHAR(100),
    item_card_order_tab_active VARCHAR(100),
    item_card_order_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_order_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);


CREATE TABLE item_card_gift_tabs(
    item_card_gift_tab_id VARCHAR(100), 
    item_card_gift_tab_active VARCHAR(100),
    item_card_gift_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_gift_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);


CREATE TABLE item_card_payed_tabs(
    item_card_payed_tab_id VARCHAR(100), 
    item_card_payed_tab_active VARCHAR(100),
    item_card_payed_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_payed_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);


CREATE TABLE item_card_payed_nd_tabs(
    item_card_payed_nd_tab_id VARCHAR(100),
    item_card_payed_nd_tab_active VARCHAR(100),
    item_card_payed_nd_id_fkey VARCHAR(100),
    table_id_fkey VARCHAR(100),
    FOREIGN KEY (item_card_payed_nd_id_fkey) REFERENCES item_cards(item_card_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);


CREATE TABLE item_monits(
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


CREATE TABLE item_sales_statics(
    item_sale_static_id VARCHAR(100),
    item_sale_id VARCHAR(100),
	item_sale_category VARCHAR(100),
    item_sale_tab_pos VARCHAR(100),
    item_sale_waiter_id VARCHAR(100),
    item_sale_workshift_id VARCHAR(100),
    item_sale_price VARCHAR(100),
    item_sale_date DATETIME(3),
    item_sale_active VARCHAR(100)  
);


CREATE TABLE money_flows(
    money_flow_id VARCHAR(100) PRIMARY KEY,
	money_flow_kind VARCHAR(100),
    money_flow_m_k VARCHAR(100),
    money_flow_amount VARCHAR(100),
	money_flow_comment VARCHAR(5000),
    money_flow_date TIMESTAMP(3),
	money_flow_ws_id VARCHAR(100),
    money_flow_active VARCHAR(100)
);


CREATE TABLE waiter_tabs(
    waiter_tab_id VARCHAR(100),
    waiter_tab_active VARCHAR(100),
    waiter_id_fkey VARCHAR(200),
    table_id_fkey VARCHAR(100),
	FOREIGN KEY (waiter_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (table_id_fkey) REFERENCES tabs(table_id)
);


CREATE TABLE cashier_workshifts(
    cashier_workshift_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_workshift_active VARCHAR(100),
    cashier_id_fkey VARCHAR(200),
    workshift_id_fkey VARCHAR(100),
    FOREIGN KEY (cashier_id_fkey) REFERENCES users(user_id),
    FOREIGN KEY (workshift_id_fkey) REFERENCES workshifts(workshift_id)
);


CREATE TABLE registers(
	register_id INT AUTO_INCREMENT PRIMARY KEY,
    register_ejecution DATETIME(3),
    register_user VARCHAR(100),
    register_user_modify VARCHAR(100),
    register_operation VARCHAR(100),
    register_object VARCHAR(100),
    register_modification VARCHAR(2000)
);


UPDATE config_general SET config_active = 'K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u';

INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)
	VALUES('c2OuJxQqABPRxKy/kPXW2A==', '5FB3bF4LheVY0H6KFiHt/g==', '+RzQUjtQ3UxomiHSZ0fmuQ==', 'S9FqHlkcN9TEgUKgVz/iTA==', 'M88re0RIWY4NF0w7/z6VRg==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInl/D4zUgkXSKu/0DOY7ZQzdVy8qSrJzVzAOJjhW90yG67', 'fJ5rBMyacmtSuKFHHH34nA==', 'mfaEjOqNlJsxISmRZ33MdQ==', 'EtvVCnIlzRb1kVZUnbvHxg==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');

/*---------------------------------------Test--------------------------------------*/
/*Usuarios*/
INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('TrQ0T6UCPBE08WnIh15NbA==', 'q/vjhIIdVCNUxcdb/mkHFQ==', '24wt53kpAa7qb6njcPoVvA==', 'nRBR0CPOQaoShhtEN1hgUg==', 'DADiihVREcn88R30VPihog==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'mfaEjOqNlJsxISmRZ33MdQ==', 'IFpSS1UrcHbUwRUGURUklw==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
UPDATE users SET user_active = 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u' WHERE user_id = 'TrQ0T6UCPBE08WnIh15NbA==';
UPDATE users SET user_role = 'bv2ha6jljpAl7dOl6aOVYg==' WHERE user_id = 'TrQ0T6UCPBE08WnIh15NbA==';

INSERT INTO users(user_id, user_name, user_last_name, user_mail, user_role, user_image_route, user_image_name, user_password, user_phone, user_active)VALUES('K0hLKXQPl8wnur/1a3hydA==', 'uOxJYnR3WPEDqRfbaUSi/g==', '+RzQUjtQ3UxomiHSZ0fmuQ==', 'y+WfCGTeuSNjZ0fPv1Bn1Q==', 'DADiihVREcn88R30VPihog==', 'CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu', 'EJl5Rx42MVsOtfOvn7JcRA==', 'mfaEjOqNlJsxISmRZ33MdQ==', 'Izm4ou4ZPD7eAq9ThW8sHg==', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
UPDATE users SET user_active = 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u' WHERE user_id = 'K0hLKXQPl8wnur/1a3hydA==';
UPDATE users SET user_role = 'bv2ha6jljpAl7dOl6aOVYg==' WHERE user_id = 'K0hLKXQPl8wnur/1a3hydA==';

/*Itemcards*/
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '2', 't9aQ9FmDqSugvBL4bZpB2g==', 'H9nxzKSUZp4yJ2SMWm6K3g==', 'vJE0iCtYQQkdgPmO1UHFrw==','l5P8mY7HqphqYPRm0tu/IGj00uvJ8U9GLsrSerZLlmL1bDvqGDT6DY2mdA/nJy3z/C9+YFiRbRTGZd+xw4yW2A==','5:11/1','MeNR7CLAjL1EwHjdysz5kNaSwWxOe8gK76eQEl4xcmE=', '1', '2024-07-23 08:52:13.929', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '3', '8G+77TicvtTcmbpyVzXr5g==', 'GQAmNfW/AnxBpnhyk1xyZwsLIYatGwjtA3woRemF/e4=', 'vJE0iCtYQQkdgPmO1UHFrw==','GQAmNfW/AnxBpnhyk1xyZwYyn3nenQkYpvT+21/G3pULCyGGrRsI7QN8KEXphf3u','5611/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=', '1', '2024-07-23 09:01:50.611', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '4', 'y3PGsd8HnJxFBx/C2pqCaA==', 'TAOIo5BXifN2Qa3p7LkOsnUCKYlfzkBp2no/TZaR1Kg=', 'oq+ndGGeFoWVRa7z+jTQTg==','2q4Q7ZUWSzfRyhcxBrMIxU4SnvdqNJhJLEulzwXLPWNiD1zCMlj/ALtgxrUbLqfFCwshhq0bCO0DfChF6YX97g==','811/1','48+qcX1tPL/1FORBb9VQoOEpL5+PWR+jV+wNxR0MOIE=', '23', '2024-07-23 09:17:52.86', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
INSERT INTO item_cards(item_card_id, item_card_code, item_card_name, item_card_category, item_card_description, item_card_cost, item_card_price,  item_card_stock, item_card_date_creation, item_card_tip, item_card_active) VALUES( '5', 'iDom2cUYpxBhZih6kwNJcg==', 'XpucmJPsrBx4+8Jxp5mo/q0Jx8tfKZykJg/cyvIo3bk=', 'oq+ndGGeFoWVRa7z+jTQTg==','XpucmJPsrBx4+8Jxp5mo/g0nsAyWbSkVnIH4w9IO8s0hLnmxsqao/CY1A10qRlYFl+tF6wgTGgJ7CBymChjL9w==','5:11/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=', '7', '2024-07-23 09:19:41.525', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u', 'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
