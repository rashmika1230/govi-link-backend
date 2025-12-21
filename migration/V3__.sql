ALTER TABLE bookings
DROP
FOREIGN KEY bookings_ibfk_1;

ALTER TABLE bookings
DROP
FOREIGN KEY bookings_ibfk_2;

ALTER TABLE produce
DROP
FOREIGN KEY produce_ibfk_1;

ALTER TABLE bookings
DROP
COLUMN buyer_id;

ALTER TABLE bookings
DROP
COLUMN id;

ALTER TABLE bookings
DROP
COLUMN produce_id;

ALTER TABLE bookings
DROP
COLUMN status;

ALTER TABLE bookings
    ADD buyer_id BINARY(16) NOT NULL;

ALTER TABLE produce
    MODIFY `description` VARCHAR (255);

ALTER TABLE produce
DROP
COLUMN farmer_id;

ALTER TABLE produce
DROP
COLUMN id;

ALTER TABLE produce
    ADD farmer_id BINARY(16) NOT NULL;

ALTER TABLE bookings
    ADD id BINARY(16) NOT NULL PRIMARY KEY;

ALTER TABLE pricing_history
DROP
COLUMN id;

ALTER TABLE pricing_history
    ADD id BINARY(16) NOT NULL PRIMARY KEY;

ALTER TABLE produce
    ADD id BINARY(16) NOT NULL PRIMARY KEY;

ALTER TABLE users
DROP
COLUMN id;

ALTER TABLE users
    ADD id BINARY(16) NOT NULL PRIMARY KEY;

ALTER TABLE produce
    MODIFY image_url VARCHAR (255);

ALTER TABLE users
    MODIFY name VARCHAR (255) NULL;

ALTER TABLE bookings
    ADD produce_id BINARY(16) NOT NULL;

ALTER TABLE users
    MODIFY `role` VARCHAR (255);

ALTER TABLE bookings
    ADD status SMALLINT NOT NULL;