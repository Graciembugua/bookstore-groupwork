-- ============================
-- USER MANAGEMENT FOR BOOKSTORE
-- ============================

-- 1. CREATE ROLES
CREATE ROLE 'reporting_analyst';
CREATE ROLE 'order_processor';
CREATE ROLE 'customer_viewer';
CREATE ROLE 'book_catalog_manager';
CREATE ROLE 'book_catalog_viewer';

-- 2. GRANTING PRIVILEGES TO ROLES
GRANT SELECT ON BookstoreDB.* TO 'reporting_analyst';
GRANT SELECT, INSERT, UPDATE ON BookstoreDB.* TO 'order_processor';
GRANT SELECT ON BookstoreDB.* TO 'customer_viewer';
GRANT SELECT, INSERT, DELETE, UPDATE ON BookstoreDB.* TO 'book_catalog_manager';
GRANT SELECT ON BookstoreDB.* TO 'book_catalog_viewer';

-- 3. CREATE USERS AND ASSIGN PASSWORDS
CREATE USER 'content_admin'@'localhost' IDENTIFIED BY 'CPASS1234';
CREATE USER 'support_staff'@'localhost' IDENTIFIED BY 'DPASS1234';
CREATE USER 'order_clerk'@'localhost' IDENTIFIED BY 'APASS1234';
CREATE USER 'data_analyst'@'localhost' IDENTIFIED BY 'DAPASS1234';
CREATE USER 'guest_user'@'localhost' IDENTIFIED BY 'GAPASS1234';

-- 4. ASSIGN ROLES TO USERS
GRANT 'book_catalog_manager' TO 'content_admin'@'localhost';
GRANT 'book_catalog_viewer' TO 'support_staff'@'localhost';
GRANT 'order_processor' TO 'order_clerk'@'localhost';
GRANT 'reporting_analyst' TO 'data_analyst'@'localhost';
GRANT 'customer_viewer' TO 'guest_user'@'localhost';

-- 5. SET DEFAULT ROLES
ALTER USER 'content_admin'@'localhost' DEFAULT ROLE 'book_catalog_manager';
ALTER USER 'support_staff'@'localhost' DEFAULT ROLE 'book_catalog_viewer';
ALTER USER 'order_clerk'@'localhost' DEFAULT ROLE 'order_processor';
ALTER USER 'data_analyst'@'localhost' DEFAULT ROLE 'reporting_analyst';
ALTER USER 'guest_user'@'localhost' DEFAULT ROLE 'customer_viewer';
