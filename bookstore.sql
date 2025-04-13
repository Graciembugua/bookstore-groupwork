-- USER MANAGEMENT
 CREATE ROLE 'reporting_analyst', 'order_processor','customer_viewer','book_catalog_manager','book_catalog_viewer';
-- GRANTING PRIVILEDGES
GRANT ALL PRIVILEGES ON BookstoreDB.* TO 'book_catalog_viewer';
GRANT SELECT,INSERT,DELETE ,UPDATE ON BookstoreDB.*TO 'book_catalog_manager';
GRANT SELECT ON BookstoreDB.*TO 'customer_viewer';
GRANT SELECT,INSERT,UPDATE ON BookstoreDB.*TO 'order_processor';
GRANT SELECT ON BookstoreDB.*TO 'reporting_analyst';

-- CREATE USERS
CREATE USER 'content_admin',@'localhost'
IDENTIFIED BY "CPASS1234";
CREATE USER 'support_staff',@'localhost'
IDENTIFIED BY "DPASS1234";
CREATE USER 'order_clerk',@ 'localhost'
IDENTIFIED BY "APASS1234";
CREATE USER 'data_analyst',@ 'localhost'
IDENTIFIED BY "DAPASS1234";
CREATE USER 'guest_user',@ 'localhost'
IDENTIFIED BY "GAPASS1234";

-- ASSIGNING ROLES
GRANT 'book_catalog_manager' TO 'content_admin'@'localhost';
GRANT 'customer_viewer' TO 'guest_user'@'localhost';
GRANT 'order_processor' TO 'order_clerk'@'localhost';
GRANT 'reporting_analyst' TO 'data_analyst'@'localhost';
GRANT 'book_catalog_viewer' TO 'support_staff'@'localhost';

--SETTING DEFAULT ROLES
ALTER USER 'content_admin'@'localhost'DEFAULT ROLE 'book_catalog_manager';
ALTER USER 'order_clerk'@'localhost'DEFAULT ROLE 'order_processor';
ALTER USER 'data_analyst'@'localhost'DEFAULT ROLE 'reporting_analyst';



